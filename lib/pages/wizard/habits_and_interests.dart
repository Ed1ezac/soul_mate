import 'package:flutter/material.dart';
import 'package:soul_mate/utils/widget_utils.dart';
import 'package:soul_mate/widgets/habit_picker.dart';
import 'package:soul_mate/widgets/interests_picker.dart';

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
  RangeValues _currentRangeValues = const RangeValues(20, 40);

  @override
  Widget build(BuildContext context) {
    double screenHeight = (MediaQuery.of(context).size.height);
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
              Divider(),
              Container(
                padding: _formFieldPadding,
                margin: _formFieldMargin,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Age Range",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                          style: TextStyle(
                            color: Theme.of(context).hintColor,
                          ),
                          text: "I want to date people aged:",
                          children: <TextSpan>[
                            TextSpan(
                              text: _currentRangeValues.start.toString() +
                                  ' to ' +
                                  _currentRangeValues.end.toString(),
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                //fontWeight: FontWeight.bold,
                              ),
                            ),
                          ]),
                    ),
                    Container(
                      child: RangeSlider(
                        values: _currentRangeValues,
                        min: 18,
                        max: 100,
                        divisions: 82,
                        labels: RangeLabels(
                          _currentRangeValues.start.round().toString() + " yrs",
                          _currentRangeValues.end.round().toString() + " yrs",
                        ),
                        onChanged: (RangeValues values) {
                          setState(() {
                            _currentRangeValues = values;
                          });
                        },
                        onChangeEnd: (values) {
                          if (values.end - values.start > 30) {
                            setState(() {
                              values = new RangeValues(
                                  values.start, values.start + 30);
                              _currentRangeValues = values;
                            });
                          }
                        },
                      ),
                    ),
                    Text(
                      "max range is 30 years.",
                      style: TextStyle(
                        color: Theme.of(context).hintColor,
                        fontSize: 13.0,
                        //fontWeight: FontWeight.w700,
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
