import 'package:flutter/material.dart';

import '../styles.dart';

class CustomRangeSliderThumb extends RangeSliderThumbShape {
  final double thumbRadius;

  CustomRangeSliderThumb({this.thumbRadius = 8.0});

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    Thumb thumb,
    bool isOnTop,
    bool isEnabled,
    bool isDiscrete,
    TextDirection textDirection,
    SliderThemeData sliderTheme,
    Animation<double> enableAnimation,
    Animation<double> activationAnimation,
  }) {
    // TODO: implement paint
    final Canvas canvas = context.canvas;

    final rect = Rect.fromCircle(center: center, radius: thumbRadius);
    final sliderGrip = Paint()
      ..color = Colors.white
      ..strokeWidth = thumbRadius / 3;

    final rrect = RRect.fromRectAndRadius(
      Rect.fromPoints(
        Offset(rect.left - (thumbRadius * 0.5), rect.top),
        Offset(rect.right + (thumbRadius * 0.5), rect.bottom),
      ),
      Radius.circular(thumbRadius * 0.6),
    );

    final fillPaint = Paint()
      ..color = AppColors.soulPrimary
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = isOnTop ? Colors.white70 : Colors.white24
      ..strokeWidth = isOnTop ? 1.0 : 0.1
      ..style = PaintingStyle.stroke;
    //---fill
    canvas.drawRRect(rrect, fillPaint);
    //handles
    canvas.drawLine(
        Offset(
            center.dx - (thumbRadius * 0.6), center.dy - (thumbRadius * 0.5)),
        Offset(
            center.dx - (thumbRadius * 0.6), center.dy + (thumbRadius * 0.5)),
        sliderGrip);

    canvas.drawLine(Offset(center.dx, center.dy - (thumbRadius * 0.5)),
        Offset(center.dx, center.dy + (thumbRadius * 0.5)), sliderGrip);

    canvas.drawLine(
        Offset(
            center.dx + (thumbRadius * 0.6), center.dy - (thumbRadius * 0.5)),
        Offset(
            center.dx + (thumbRadius * 0.6), center.dy + (thumbRadius * 0.5)),
        sliderGrip);
    //stroke
    canvas.drawRRect(rrect, borderPaint);
  }
}
