import 'package:flutter/material.dart';

import '../styles.dart';

class SliderHandlerDecoration extends Decoration {
  final double handlerRadius;

  SliderHandlerDecoration({this.handlerRadius = 9.0});

  @override
  BoxPainter createBoxPainter([onChanged]) {
    return _SliderHandlerDecorationPainter(handlerRadius);
  }
}

class _SliderHandlerDecorationPainter extends BoxPainter {
  final double mRadius;
  _SliderHandlerDecorationPainter(this.mRadius);
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Offset center = configuration.size.center(offset);
    final rect = Rect.fromCircle(center: center, radius: mRadius);
    final sliderGrip = Paint()
      ..color = Colors.white
      ..strokeWidth = mRadius / 3;

    final rrect = RRect.fromRectAndRadius(
      Rect.fromPoints(
        Offset(rect.left - (mRadius * 0.5), rect.top),
        Offset(rect.right + (mRadius * 0.5), rect.bottom),
      ),
      Radius.circular(mRadius * 0.6),
    );

    final fillPaint = Paint()
      ..color = AppColors.soulPrimary
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = Colors.white24
      ..strokeWidth = 0.1
      ..style = PaintingStyle.stroke;

    //---fill
    canvas.drawRRect(rrect, fillPaint);
    //handles
    canvas.drawLine(
        Offset(center.dx - (mRadius * 0.6), center.dy - (mRadius * 0.5)),
        Offset(center.dx - (mRadius * 0.6), center.dy + (mRadius * 0.5)),
        sliderGrip);

    canvas.drawLine(Offset(center.dx, center.dy - (mRadius * 0.5)),
        Offset(center.dx, center.dy + (mRadius * 0.5)), sliderGrip);

    canvas.drawLine(
        Offset(center.dx + (mRadius * 0.6), center.dy - (mRadius * 0.5)),
        Offset(center.dx + (mRadius * 0.6), center.dy + (mRadius * 0.5)),
        sliderGrip);
    //stroke
    canvas.drawRRect(rrect, borderPaint);
  }
}
