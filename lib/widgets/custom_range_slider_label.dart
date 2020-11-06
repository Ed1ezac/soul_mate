import 'package:flutter/material.dart';

class CustomLabels extends RangeSliderValueIndicatorShape {
  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete,
      {TextPainter labelPainter}) {
    // TODO: implement getPreferredSize
    throw UnimplementedError();
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    Thumb thumb,
    double value,
    bool isOnTop,
    bool isDiscrete,
    RenderBox parentBox,
    TextPainter labelPainter,
    SliderThemeData sliderTheme,
    TextDirection textDirection,
    Animation<double> enableAnimation,
    Animation<double> activationAnimation,
  }) {
    // TODO: implement paint
  }
}
