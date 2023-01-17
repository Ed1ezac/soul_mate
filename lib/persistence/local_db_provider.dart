import 'dart:async';
import 'dart:collection';
import '../models/user.dart';
import 'package:Soulmate_App/persistence/db_constants.dart';
import 'package:path/path.dart';

User snapshotToUser(Map<String, Object?> snapshot) {
  return User.fromMap(snapshot);
}

class LocalDatabseProvider {
  final DatabaseFactory dbFactory;
  final _updateTriggerController = StreamController<bool>.broadcast();
  Database? db;

  LocalDatabseProvider(this.dbFactory);

/*
  Future openPath(String path) async {
    db = await dbFactory.openDatabase(path,
        options: OpenDatabaseOptions(
            version: 1, //TODO: currVersion!
            onCreate: (db, version) async {
              await _createDb(db);
            },
            onUpgrade: (db, oldVersion, newVersion) async {
              if (oldVersion < 1) {
                await _createDb(db);
              }
            }));
  }

  void _triggerUpdate() {
    _updateTriggerController.sink.add(true);
  }

  Future<Database?> get ready async {
    if (db == null) {
      await open();
    }
    return db;
  }

  Future open() async {
    await openPath(await fixPath());
  }

  Future<String> fixPath() async =>
      join(await getDatabasesPath(), DatabaseName);

  //convenience
  Future saveUser(User u) async {
    await _saveUser(db, u);
  }

  //Create or Update user
  Future _saveUser(DatabaseExecutor? db, User user) async {
    if (user.id > 0) {
      await db!.update(UsersTable, user.toMap());
    } else {
      user.id = await db!.insert(UsersTable, user.toMap());
    }
  }

  //Read single
  Future<User?> getUser(int? id) async {
    var list = (await db!.query(UsersTable,
        columns: UsersTableColumns, where: "id = ?", whereArgs: <Object?>[id]));
    if (list.isNotEmpty) {
      return User.fromMap(list.first);
    }
    return null;
  }

  //Read multiple User,
  Future<Users> getUserList({int? offset, int? limit, bool? descending}) async {
    var list = (await db!.query(
      UsersTable,
      columns: UsersTableColumns,
      orderBy: 'id ${(descending ?? false) ? 'ASC' : 'DESC'}',
      limit: limit,
      offset: offset,
    ));

    return Users(list);
  }

  //delete single
  Future<void> deleteUser(int? id) async {
    await db!.delete(UsersTable, where: 'id = ?', whereArgs: <Object?>[id]);
    _triggerUpdate();
  }

  //delete all
  Future deleteAllUsers() async {
    await db!.delete(UsersTable);
    _triggerUpdate();
  }

  //------------Transformers-USERS--------------------
  var usersTransformer =
      StreamTransformer<List<Map<String, Object?>>, List<User>>.fromHandlers(
          handleData: (snapshotList, sink) {
    sink.add(Users(snapshotList));
  });

  var userTransformer =
      StreamTransformer<Map<String, Object?>, User?>.fromHandlers(
          handleData: (snapshot, sink) {
    sink.add(snapshotToUser(snapshot));
  });

  //----------------Streams-------------------------
  Stream<List<User?>>? onUsers() {
    //ignore: close_sinks
    late StreamController<Users> ctlr;
    StreamSubscription? triggerSubscription;

    Future<void> sendUpdate() async {
      var users = await getUserList();
      if (!ctlr.isClosed) {
        ctlr.add(users);
      }
    }

    ctlr = StreamController<Users>(onListen: () {
      sendUpdate();
      //listen for trigger
      triggerSubscription = _updateTriggerController.stream.listen((_) {
        sendUpdate();
      });
    }, onCancel: () {
      triggerSubscription?.cancel();
    });

    return ctlr.stream;
  }

  Stream<User?> onUser(int? id) {
    //ignore: close_sinks
    late StreamController<User?> ctlr;
    StreamSubscription? triggerSubscription;

    Future<void> sendUpdate() async {
      var user = await getUser(id);
      if (!ctlr.isClosed) {
        ctlr.add(user);
      }
    }

    ctlr = StreamController<User?>(onListen: () {
      sendUpdate();

      /// Listen for trigger
      triggerSubscription = _updateTriggerController.stream.listen((_) {
        sendUpdate();
      });
    }, onCancel: () {
      triggerSubscription?.cancel();
    });
    return ctlr.stream;
  }

  Future _createDb(Database db) async {
    await db.execute('DROP TABLE If EXISTS ' + UsersTable);
    await db.execute('DROP TABLE If EXISTS ' + GendersTable);
    await db.execute('DROP TABLE If EXISTS ' + InterestsTable);
    await db.execute('DROP TABLE If EXISTS ' + SexualitiesTable);
    await db.execute('DROP TABLE If EXISTS ' + PersonalitiesTable);
    await db.execute('DROP TABLE If EXISTS ' + AffectionTraitsTable);

    await db.execute(CreateUsersTable);
    await db.execute(CreateGendersTable);
    await db.execute(CreateSexualitiesTable);
    await db.execute(CreateInterestsTable);
    await db.execute(CreatePersonalitiesTable);
    await db.execute(CreateAffectionTraitsTable);
    //await db.execute(CreateUserInterestsTable);

    //add default records
    //Genders
    await _addRecord(db, GendersTable, {'gender': 'Male'});
    await _addRecord(db, GendersTable, {'gender': 'Female'});
    await _addRecord(db, GendersTable, {'gender': 'Transgender'});
    await _addRecord(db, GendersTable, {'gender': 'GenderQueer'});
    await _addRecord(db, GendersTable, {'gender': 'GenderNeutral'});
    //Sexualities
    await _addRecord(db, SexualitiesTable, {'sexuality': 'Heterosexual'});
    await _addRecord(db, SexualitiesTable, {'sexuality': 'Homosexual'});
    await _addRecord(db, SexualitiesTable, {'sexuality': 'Bisexual'});
    await _addRecord(db, SexualitiesTable, {'sexuality': 'Queer'});
    await _addRecord(db, SexualitiesTable, {'sexuality': 'Other'});
    //personalities
    await _addRecord(db, PersonalitiesTable, {'personality': 'Introvert'});
    await _addRecord(db, PersonalitiesTable, {'personality': 'Extrovert'});
    //Affection Traits
    //TODO - Include the Descriptions
    await _addRecord(db, AffectionTraitsTable, {'affection_trait': 'Gifting'});
    await _addRecord(
        db, AffectionTraitsTable, {'affection_trait': 'Helpfulness'});
    await _addRecord(
        db, AffectionTraitsTable, {'affection_trait': 'Verbal Affection'});
    await _addRecord(
        db, AffectionTraitsTable, {'affection_trait': 'Physical Affection'});
    await _addRecord(
        db, AffectionTraitsTable, {'affection_trait': 'Prioritizing Time'});
    //Interests
    for (int i = 0; i < defaultInterests.length; i++) {
      await _addRecord(db, InterestsTable, {'interest': defaultInterests[i]});
    }
  }

  Future _addRecord(
      DatabaseExecutor? db, String table, Map<String, Object> record) async {
    await db!.insert(table, record);
  }

  //Read single Item-
  Future<Map<String, Object?>?> getSingleRecord(
      int? id, String table, List<String> cols) async {
    var list = (await db!.query(
      table,
      columns: cols,
      where: "id = ?",
      whereArgs: <Object?>[id],
    ));
    if (list.isNotEmpty) {
      return list.first;
    }
    return null;
  }

  //Read all table records
  Future<List<Map<String, Object?>>> getRecordList(
      String table, List<String> cols,
      {int? offset, bool? descending}) async {
    var list = (await db!.query(
      table,
      columns: cols,
      orderBy: 'id ${'ASC'}',
      offset: offset,
    ));

    return list;
  }

  Future close() async {
    await db!.close();
    await _updateTriggerController.close();
  }
  */
}

class Users extends ListBase<User> {
  final List<Map<String, Object?>> list;
  late List<User?> _cacheUsers;

  Users(this.list) {
    _cacheUsers = List.generate(list.length, (index) => null);
  }

  @override
  User operator [](int index) {
    return _cacheUsers[index] ??= snapshotToUser(list[index]);
  }

  @override
  int get length => list.length;

  @override
  void operator []=(int index, User? value) => throw 'read-only';

  @override
  set length(int newLength) => throw 'read-only';
}

//Dummies
class Database {}

class DatabaseFactory {}
