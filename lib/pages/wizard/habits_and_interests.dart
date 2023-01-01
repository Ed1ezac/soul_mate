import 'package:Soulmate_App/models/user_habits_and_interests.dart';
import 'package:flutter/material.dart';
import 'package:Soulmate_App/widgets/habit_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Soulmate_App/widgets/interests_picker.dart';
import '../../styles.dart';

class HabitsAndInterests extends StatefulWidget {
  final UserHabitsAndInterests habitsAndInterests;

  HabitsAndInterests(this.habitsAndInterests);

  @override
  _HabitsAndInterestsState createState() => _HabitsAndInterestsState();
}

class _HabitsAndInterestsState extends State<HabitsAndInterests> {
  List<String> _pickedHabits = [];
  List<String> _pickedInterests = [];
  bool _habitsIsEmpty = true,
      _interestsIsEmpty = true,
      _habitsHasError = false,
      _interestsHasError = false;
  late String habitsErrorText, interestsErrorText;

  @override
  initState() {
    super.initState();
    if (!widget.habitsAndInterests.isEmpty()) {
      _pickedHabits.addAll(widget.habitsAndInterests.habits);
      _pickedInterests.addAll(widget.habitsAndInterests.interests);
      _interestsIsEmpty = false;
      _habitsIsEmpty = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final EdgeInsets _formFieldPadding = EdgeInsets.symmetric(
        vertical: 0.0, horizontal: ScreenUtil().setWidth(32.0));
    final EdgeInsets _formFieldMargin = EdgeInsets.only(
        top: ScreenUtil().setHeight(8.0), bottom: ScreenUtil().setHeight(16.0));

    return Scaffold(
      appBar: AppBar(
        title: Text("Habits and Interests"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () => _popOrFail(),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            left: ScreenUtil().setWidth(8.0),
            right: ScreenUtil().setWidth(8.0),
            bottom: ScreenUtil().setHeight(16.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: _formFieldPadding,
                margin: _formFieldMargin,
                child: Text(
                  "Your interests are shown publicly, but your habits are " +
                      "only shown to your matches.",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: ScreenUtil().setSp(16.0),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Form(
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: _formFieldPadding,
                      margin: _formFieldMargin,
                      child: GestureDetector(
                        onTap: () {
                          showHabitsPicker(context);
                        },
                        child: buildHabitsWidget(),
                      ),
                    ),
                    Container(
                      padding: _formFieldPadding,
                      margin: _formFieldMargin,
                      child: GestureDetector(
                        onTap: () {
                          showInterestsPicker(context);
                        },
                        child: buildInterestsWidget(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _popOrFail() {
    if (_formIsValid()) {
      widget.habitsAndInterests.habits = _pickedHabits;
      widget.habitsAndInterests.interests = _pickedInterests;
      //pop!
      Navigator.pop(context, widget.habitsAndInterests);
    } else {
      //display errors
      setState(() {});
    }
  }

  bool _formIsValid() {
    bool isValid = true;
    _habitsHasError = false;
    _interestsHasError = false;

    if (_pickedHabits.isEmpty) {
      isValid = false;
      _habitsHasError = true;
      habitsErrorText = "you need to pick some habits.";
    } else if (_pickedHabits.length != 3) {
      isValid = false;
      _habitsHasError = true;
      habitsErrorText = "you must pick 3 habits.";
    }

    if (_pickedInterests.isEmpty) {
      isValid = false;
      _interestsHasError = true;
      interestsErrorText = "you need to pick some interests.";
    } else if (_pickedInterests.length != 6) {
      isValid = false;
      _interestsHasError = true;
      interestsErrorText = "you must pick 6 interests.";
    }

    return isValid;
  }

  Widget buildHabitsWidget() {
    if (_habitsHasError) {
      return InputDecorator(
        isEmpty: _habitsIsEmpty,
        child: _getHabitsText(),
        decoration: InputDecoration(
          errorText: habitsErrorText,
          labelText: "Habits",
          prefixIcon: Icon(
            Icons.beenhere,
            color: AppColors.soulPrimary,
          ),
        ),
      );
    } else {
      return InputDecorator(
        isEmpty: _habitsIsEmpty,
        child: _getHabitsText(),
        decoration: InputDecoration(
          helperMaxLines: 2,
          helperText: "Shown to your matches only. Choose 3",
          labelText: "Habits",
          prefixIcon: Icon(
            Icons.beenhere,
            color: AppColors.soulPrimary,
          ),
        ),
      );
    }
  }

  Widget? _getHabitsText() {
    if (_pickedHabits.isNotEmpty) {
      String items = "";
      for (int i = 0; i < _pickedHabits.length; i++) {
        items += i != _pickedHabits.length - 1
            ? _pickedHabits[i] + ", "
            : _pickedHabits[i];
      }
      return Text(
        items,
        style: TextStyle(fontSize: ScreenUtil().setSp(16.0)),
      );
    }
    return null;
  }

  Widget buildInterestsWidget() {
    if (_interestsHasError) {
      return InputDecorator(
        isEmpty: _interestsIsEmpty,
        child: _getInterestsText(),
        decoration: InputDecoration(
          errorText: interestsErrorText,
          labelText: "Interests",
          prefixIcon: Icon(
            Icons.beach_access,
            color: AppColors.soulPrimary,
          ),
        ),
      );
    } else {
      return InputDecorator(
        isEmpty: _interestsIsEmpty,
        child: _getInterestsText(),
        decoration: InputDecoration(
          helperMaxLines: 2,
          helperText: "Shown on your profile. Choose 6",
          labelText: "Interests",
          prefixIcon: Icon(
            Icons.beach_access,
            color: AppColors.soulPrimary,
          ),
        ),
      );
    }
  }

  Widget? _getInterestsText() {
    if (_pickedInterests.isNotEmpty) {
      String items = "";
      for (int i = 0; i < _pickedInterests.length; i++) {
        items += i != _pickedInterests.length - 1
            ? _pickedInterests[i] + ", "
            : _pickedInterests[i];
      }
      return Text(
        items,
        style: TextStyle(fontSize: ScreenUtil().setSp(16.0)),
      );
    }

    return null;
  }

  //------Dialogs
  void showHabitsPicker(BuildContext context) async {
    bool hasItems = await showDialog(
        context: context,
        builder: (context) => HabitPicker(pickedHabits: _pickedHabits));

    if (hasItems != null) {
      setState(() {
        _habitsIsEmpty = !hasItems;
      });
    }
  }

  void showInterestsPicker(BuildContext context) async {
    bool hasItems = await showDialog(
        context: context,
        builder: (context) =>
            InterestsPicker(pickedInterests: _pickedInterests));

    if (hasItems != null) {
      setState(() {
        _interestsIsEmpty = !hasItems;
      });
    }
  }
  //-
}
