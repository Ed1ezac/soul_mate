import 'package:flutter/material.dart';
import 'package:Soulmate_App/utils/widget_utils.dart';
import 'package:Soulmate_App/widgets/habit_picker.dart';
import 'package:Soulmate_App/widgets/interests_picker.dart';
import '../../styles.dart';

class HabitsAndInterests extends StatefulWidget {
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

  @override
  Widget build(BuildContext context) {
    final EdgeInsets _formFieldPadding = EdgeInsets.symmetric(
        vertical: 0.0, horizontal: screenAwareSizeH(32.0, context));
    final EdgeInsets _formFieldMargin = EdgeInsets.only(
        top: screenAwareSizeV(8.0, context),
        bottom: screenAwareSizeV(16.0, context));

    return Scaffold(
      appBar: AppBar(
        title: Text("Habits and Interests"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.check), onPressed: () => Navigator.pop(context)),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            left: screenAwareSizeH(8.0, context),
            right: screenAwareSizeH(8.0, context),
            bottom: screenAwareSizeV(16.0, context),
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
                    fontSize: 16.0,
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

  Widget buildHabitsWidget() {
    if (_habitsHasError) {
      return InputDecorator(
        isEmpty: _habitsIsEmpty,
        child: _getHabitsText(),
        decoration: InputDecoration(
          errorText: "something aint right..",
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

  Widget _getHabitsText() {
    if (_pickedHabits.isNotEmpty) {
      String items = "";
      for (int i = 0; i < _pickedHabits.length; i++) {
        items += i != _pickedHabits.length - 1
            ? _pickedHabits[i] + ", "
            : _pickedHabits[i];
      }
      return Text(
        items,
        style: TextStyle(fontSize: 16.0),
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
          errorText: "something aint right..",
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

  Widget _getInterestsText() {
    if (_pickedInterests.isNotEmpty) {
      String items = "";
      for (int i = 0; i < _pickedInterests.length; i++) {
        items += i != _pickedInterests.length - 1
            ? _pickedInterests[i] + ", "
            : _pickedInterests[i];
      }
      return Text(
        items,
        style: TextStyle(fontSize: 16.0),
      );
    }

    return null;
  }

  //------Dialogs
  void showHabitsPicker(BuildContext context) async {
    bool hasItems = await showDialog(
        context: context,
        builder: (context) => HabitPicker(pickedHabits: _pickedHabits));

    if (hasItems != null && hasItems) {
      setState(() {
        _habitsIsEmpty = false;
      });
    }
  }

  void showInterestsPicker(BuildContext context) async {
    bool hasItems = await showDialog(
        context: context,
        builder: (context) =>
            InterestsPicker(pickedInterests: _pickedInterests));

    if (hasItems != null && hasItems) {
      setState(() {
        _interestsIsEmpty = false;
      });
    }
  }
  //-
}
