import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:soul_mate/utils/widget_utils.dart';
import 'package:soul_mate/widgets/height_picker.dart';
import 'package:soul_mate/widgets/wizard_option_drawing.dart';

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
          child: Container(
            height: MediaQuery.of(context).size.height * 0.75,
            width: MediaQuery.of(context).size.width * 0.75,
            child: Card(
              color: Colors.grey[200],
              child: Padding(
                padding: EdgeInsets.only(top: screenAwareSizeV(16.0, context)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text("HEIGHT (cm)",
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                        )),
                    Expanded(
                      child: LayoutBuilder(builder: (context, constraints) {
                        return HeightPicker(
                          widgetHeight: constraints.maxHeight,
                          height: height,
                          onChange: (val) => setState(() => height = val),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
