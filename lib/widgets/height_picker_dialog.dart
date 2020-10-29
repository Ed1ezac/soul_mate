import 'package:flutter/material.dart';
import 'package:Soulmate_App/utils/widget_utils.dart';
import '../styles.dart';
import 'height_picker.dart';

class HeightPickerDialog extends StatefulWidget {
  final int height;
  HeightPickerDialog({this.height});
  @override
  HeightPickerDialogState createState() => HeightPickerDialogState(height);
}

class HeightPickerDialogState extends State<HeightPickerDialog> {
  int height;
  HeightPickerDialogState(int height) {
    this.height = height;
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
              Text("HEIGHT (cm)",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                  )),
              Text("approximate your height against the door.",
                  style: TextStyle(
                    fontSize: 13.0,
                    color: Colors.grey,
                    fontWeight: FontWeight.w300,
                  )),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return HeightPicker(
                      widgetHeight: constraints.maxHeight,
                      height: height,
                      onChange: (val) => setState(() => height = val),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
