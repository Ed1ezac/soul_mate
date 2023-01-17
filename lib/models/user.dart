class User {
  int id;
  String name;
  String gender;
  String sexuality;
  String birthday;
  int age, height;
  bool hideAge;

  User(
      {required this.name,
      required this.gender,
      required this.height,
      required this.sexuality,
      required this.birthday,
      this.id = -1,
      this.age = -1,
      this.hideAge = false});

  factory User.fromMap(Map<String, dynamic> map) => User(
      id: map["id"] as int,
      name: map["name"] as String,
      gender: map["gender"] as String,
      sexuality: map["sexuality"] as String,
      birthday: map["birthday"] as String,
      height: map["height"] as int,
      hideAge: map["hide_age"].toString().toLowerCase() == 'true');

  //factory User.fromJson(Map<String, dynamic> map) => User();

  Map<String, dynamic> toMap() => {
        "name": name,
        "height": height,
        "gender": gender,
        "birthday": birthday,
        "sexuality": sexuality,
        "hide_age": hideAge.toString(),
      };

  Map<String, dynamic> toJson() => {
        'name': name,
        'hideAge': hideAge,
        'age': age.toString(),
        'gender': gender,
        'birthday': birthday,
        'height': height.toString(),
        'sexuality': sexuality.toString()
      };

  void makeAgeFromBirthday() {
    //TODO: implement
  }

  bool isEmpty() {
    //default values
    return this.age == -1 &&
        this.name == "" &&
        this.height == -1 &&
        this.gender == "" &&
        this.birthday == "" &&
        this.sexuality == "";
  }
}
