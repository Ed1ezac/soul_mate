import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Soulmate_App/utils/widget_utils.dart';
import 'package:Soulmate_App/widgets/height_picker.dart';
import 'package:Soulmate_App/widgets/wizard_option_drawing.dart';
import '../styles.dart';

class DrawingArea extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DrawingAreaState();
  }
}

class DrawingAreaState extends State<DrawingArea> {
  //int height = 700;
  int height;

  @override
  void initState() {
    super.initState();
    //height = widget.height ?? 170;
    height = 170;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Center(
          child: Container(),
        ),
      ),
    );
  }
}
