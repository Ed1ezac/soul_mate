import 'package:flutter/material.dart';

import '../styles.dart';

class CustomSliderThumb extends SliderComponentShape {
  final double thumbRadius;

  const CustomSliderThumb({
    this.thumbRadius = 8.0,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    double value,
    bool isDiscrete,
    RenderBox parentBox,
    TextPainter labelPainter,
    TextDirection textDirection,
    SliderThemeData sliderTheme,
    Animation<double> activationAnimation,
    Animation<double> enableAnimation,
  }) {
    // final Tween<double> radiusTween =
    //     Tween<double>(begin: 4.0, end: thumbRadius);
    final Canvas canvas = context.canvas;
    //final rect = Rect.fromCircle(center: center, radius: radiusTween.evaluate(activationAnimation));
    final rect = Rect.fromCircle(center: center, radius: thumbRadius);
    final sliderHumps = Paint()
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
      ..color = AppColors.soulPrimaryLight
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = Colors.white24
      ..strokeWidth = 0.1
      ..style = PaintingStyle.stroke;

    //---fill
    canvas.drawRRect(rrect, fillPaint);
    //handles
    canvas.drawLine(
        Offset(
            center.dx - (thumbRadius * 0.6), center.dy - (thumbRadius * 0.5)),
        Offset(
            center.dx - (thumbRadius * 0.6), center.dy + (thumbRadius * 0.5)),
        sliderHumps);

    canvas.drawLine(Offset(center.dx, center.dy - (thumbRadius * 0.5)),
        Offset(center.dx, center.dy + (thumbRadius * 0.5)), sliderHumps);

    canvas.drawLine(
        Offset(
            center.dx + (thumbRadius * 0.6), center.dy - (thumbRadius * 0.5)),
        Offset(
            center.dx + (thumbRadius * 0.6), center.dy + (thumbRadius * 0.5)),
        sliderHumps);
    //stroke
    canvas.drawRRect(rrect, borderPaint);
  }
}
