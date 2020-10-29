import 'package:flutter/material.dart';
import 'package:Soulmate_App/utils/widget_utils.dart';

import '../styles.dart';

class InterestsPicker extends StatefulWidget {
  final List<String> pickedInterests;

  InterestsPicker({this.pickedInterests});

  @override
  _InterestsPickerState createState() => _InterestsPickerState();
}

class _InterestsPickerState extends State<InterestsPicker> {
  List<String> _selectedInterests = [];

  @override
  void initState() {
    super.initState();
    _selectedInterests.addAll(widget.pickedInterests);
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
              Text("${_selectedInterests.length}" + " Interests",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                  )),
              Text(
                "choose 6 for now.",
                style: TextStyle(
                  fontSize: 13.0,
                  color: Colors.grey,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: interests.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      title: Text(interests[index]),
                      onChanged: (value) => setState(() {
                        if (value) {
                          //deterrence
                          if (_selectedInterests.length < 6) {
                            _selectedInterests.add(interests[index]);
                          }
                        } else {
                          _selectedInterests.remove(interests[index]);
                          _selectedInterests.join(", ");
                        }
                      }),
                      value: _selectedInterests.contains(interests[index]),
                    );
                  },
                ),
              ),
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
                    widget.pickedInterests.clear();
                    widget.pickedInterests.addAll(_selectedInterests);
                    _selectedInterests = null;
                    Navigator.pop(context, widget.pickedInterests.isNotEmpty);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<String> interests = [
    "Tennis",
    "Movies",
    "Football",
    "Fashion",
    "Drawing",
    "Painting",
    "Anime",
    "Rugby",
    "Nature",
    "Mathematics",
    "Islam",
    "Series",
    "Current Affairs",
    "House Music",
    "Dancing",
    "Acting",
    "Athletics",
    "Travelling",
    "Jazz Music",
    "Physics",
    "Technology",
    "Buddhism",
    "Christianity",
    "Afro Pop Music",
    "Video Games",
    "Netball",
    "Hip Hop Music",
    "Politics",
    "History",
    "Boxing",
    "Dancehall Music",
    "Nursing",
    "Sikhism",
    "R&B Music",
    "Business",
    "Agriculture",
    "Regae Music",
    "Bahai Faith",
    "Cooking",
    "Table Tennis",
    "Poetry",
    "Dental Health",
    "Gospel Music",
    "Graphics Design",
    "Photography",
    "Badminton",
    "Reading",
    "Journalism",
    "Accounting",
    "Engineering",
    "Software Programming",
    "African Traditional Religion",
  ];
}
