import '../styles.dart';
import 'dart:math' as math;
import 'height_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeightPicker extends StatefulWidget {
  final int maxHeight;
  final int minHeight;
  final int height;
  final double widgetHeight;
  final ValueChanged<int> onChange;

  const HeightPicker(
      {Key? key,
      required this.height,
      required this.widgetHeight,
      required this.onChange,
      this.maxHeight = 210,
      this.minHeight = 0})
      : super(key: key);

  int get totalUnits => maxHeight - minHeight;

  @override
  _HeightPickerState createState() => _HeightPickerState();
}

class _HeightPickerState extends State<HeightPicker> {
  double labelsFontSize = 14.sp;
  int heightInterval = 10;
  late double startDragYOffset;
  late int startDragHeight;

  double get _pixelsPerUnit {
    return _drawingHeight / widget.totalUnits;
  }

  double get _sliderPosition {
    double halfOfBottomLabel = labelsFontSize / 2;
    int unitsFromBottom = widget.height - widget.minHeight;
    return halfOfBottomLabel + unitsFromBottom * _pixelsPerUnit;
  }

  double get _drawingHeight {
    double totalHeight = widget.widgetHeight;
    double marginBottom = 16.h;
    //TODO
    double marginTop = 32.h;
    return totalHeight - (marginBottom + marginTop + labelsFontSize);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTapDown: _onTapDown,
      onVerticalDragStart: _onDragStart,
      onVerticalDragUpdate: _onDragUpdate,
      child: Stack(
        children: <Widget>[
          _drawBackgroundDoor(),
          _drawSlider(),
          //_drawLabels(),
          _drawDoneButton(),
        ],
      ),
    );
  }

  Widget _drawBackgroundDoor() {
    return Align(
      alignment: Alignment.center,
      child: Image(
        image: AssetImage("assets/images/height_door.png"),
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _drawSlider() {
    return Positioned(
      child: HeightSlider(height: widget.height),
      left: 0.0,
      right: 0.0,
      bottom: _sliderPosition,
    );
  }

  Widget _drawDoneButton() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
          width: 0.5.sw,
          child: RaisedButton(
            child: Text(
              "DONE",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            ),
            color: AppColors.soulPrimary,
            onPressed: () {
              Navigator.pop(context, widget.height);
            },
          )),
    );
  }

  _onTapDown(TapDownDetails tapDownDetails) {
    int height = _globalOffsetToHeight(tapDownDetails.globalPosition);
    if (height >= 80) {
      widget.onChange(_normalizeHeight(height));
    }
  }

  int _normalizeHeight(int height) {
    return math.max(80, math.min(widget.maxHeight, height));
  }

  int _globalOffsetToHeight(Offset globalOffset) {
    RenderBox getBox = context.findRenderObject() as RenderBox;
    Offset localPosition = getBox.globalToLocal(globalOffset);
    double dy = localPosition.dy;
    dy = dy - (32.h) - (labelsFontSize / 2);
    int height = widget.maxHeight - (dy ~/ _pixelsPerUnit);
    return height;
  }

  _onDragStart(DragStartDetails dragStartDetails) {
    int newHeight = _globalOffsetToHeight(dragStartDetails.globalPosition);
    widget.onChange(newHeight);
    setState(() {
      startDragYOffset = dragStartDetails.globalPosition.dy;
      startDragHeight = newHeight;
    });
  }

  _onDragUpdate(DragUpdateDetails dragUpdateDetails) {
    double currentYOffset = dragUpdateDetails.globalPosition.dy;
    double verticalDifference = startDragYOffset - currentYOffset;
    int diffHeight = verticalDifference ~/ _pixelsPerUnit;
    int height = _normalizeHeight(startDragHeight + diffHeight);
    setState(() => widget.onChange(height));
  }
}
