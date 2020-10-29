import '../styles.dart';
import 'package:flutter/material.dart';
import 'package:Soulmate_App/utils/widget_utils.dart';

class HabitPicker extends StatefulWidget {
  //collection of habits
  final List<String> pickedHabits;

  HabitPicker({this.pickedHabits});
  @override
  HabitPickerState createState() => HabitPickerState();
}

class HabitPickerState extends State<HabitPicker> {
  List<String> _selectedHabits = [];

  @override
  void initState() {
    super.initState();
    _selectedHabits.addAll(widget.pickedHabits);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0))),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.75,
        width: MediaQuery.of(context).size.width * 0.75,
        decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: Padding(
          padding: EdgeInsets.only(top: screenAwareSizeV(16.0, context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("${_selectedHabits.length}" + " Habits",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                  )),
              Text("choose 3 for now.",
                  style: TextStyle(
                    fontSize: 13.0,
                    color: Colors.grey,
                    fontWeight: FontWeight.w300,
                  )),
              Expanded(
                  child: ListView.builder(
                itemCount: habits.length,
                itemBuilder: (BuildContext context, int index) {
                  return CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    title: Text(habits[index]),
                    onChanged: (value) => setState(() {
                      if (value) {
                        //deterrance
                        if (_selectedHabits.length < 3) {
                          _selectedHabits.add(habits[index]);
                        }
                      } else {
                        _selectedHabits.remove(habits[index]);
                        _selectedHabits.join(", ");
                      }
                    }),
                    value: _selectedHabits.contains(habits[index]),
                  );
                },
              )),
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                child: RaisedButton(
                  child: Text(
                    "DONE",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                  color: AppColors.soulPrimary,
                  onPressed: () {
                    widget.pickedHabits.clear();
                    widget.pickedHabits.addAll(_selectedHabits);
                    _selectedHabits = null;
                    Navigator.pop(context, widget.pickedHabits.isNotEmpty);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<String> habits = [
    "Eating",
    "Smiling",
    "Sleeping",
    "Drinking",
    "Smoking",
    "Gambling",
    "Hugging",
    "Reading",
    "Spitting",
    "Laughing",
    "Cuddling",
    "Belching",
    "Exercising",
    "Gossiping",
    "Day Dreaming",
    "Chewing Gum",
    "Drinking Tea",
    "Procrastinating",
    "Losing Focus",
    "Complaining",
    "Eavesdropping",
    "Exaggerating",
    "Meditating",
    "Binge Watching",
    "Being Late",
    "Video Gaming",
    "Staying Up Late",
  ];
}
