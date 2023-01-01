import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'height_picker.dart';

class HeightPickerDialog extends StatefulWidget {
  final int height;
  HeightPickerDialog({required this.height});
  @override
  HeightPickerDialogState createState() => HeightPickerDialogState();
}

class HeightPickerDialogState extends State<HeightPickerDialog> {
  late int height;

  @override
  void initState() {
    height = widget.height;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0))),
      child: Container(
        height: ScreenUtil().screenHeight * 0.75,
        width: ScreenUtil().screenWidth * 0.75,
        decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: Padding(
          padding: EdgeInsets.only(top: ScreenUtil().setHeight(16.0)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("HEIGHT (cm)",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                  )),
              Text("approximate your height against the door.",
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(13.0),
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
