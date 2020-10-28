import 'package:flutter/material.dart';
import '../styles.dart';

class WizardOptionBorder extends ShapeBorder {
  final double guestSideLength;
  final double borderWidth;
  final double cornerRadius;
  final bool colored;
  final Color borderColor;

  WizardOptionBorder(
      {this.guestSideLength: 40.0,
      this.borderWidth: 1.0,
      this.cornerRadius: 8.0,
      this.borderColor: AppColors.soulPrimary,
      this.colored: false});

  @override
  EdgeInsetsGeometry get dimensions {
    return new EdgeInsets.all(borderWidth);
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection textDirection}) {
    return new Path()
      ..fillType = PathFillType.evenOdd
      ..addPath(getOuterPath(rect), Offset.zero);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    Rect guest = _positionGuestAtCenterLeft(rect);

    // The guest's shape is a circle bounded by the guest rectangle.
    // So the guest's radius is half the guest width.
    final double notchRadius = guest.width / 2.0;

    return Path()
      ..moveTo(rect.left + cornerRadius, rect.bottom)
      ..arcToPoint(Offset(rect.left, rect.bottom - cornerRadius),
          radius: Radius.circular(cornerRadius),
          rotation: 45.0,
          largeArc: false,
          clockwise: true)
      ..lineTo(guest.center.dx, guest.bottomCenter.dy)
      //guest arc
      ..arcToPoint(
        guest.topCenter,
        radius: Radius.circular(notchRadius),
        clockwise: false,
      )
      //--end guest arc
      //top-left
      ..lineTo(rect.left, rect.top + cornerRadius)
      ..arcToPoint(Offset(rect.left + cornerRadius, rect.top),
          radius: Radius.circular(cornerRadius),
          rotation: 45.0,
          largeArc: false,
          clockwise: true)
      //topRight
      ..lineTo(rect.right - cornerRadius, rect.top)
      ..arcToPoint(Offset(rect.right, rect.top + cornerRadius),
          radius: Radius.circular(cornerRadius),
          rotation: 45.0,
          largeArc: false,
          clockwise: true)
      //bottomRight
      ..lineTo(rect.right, rect.bottom - cornerRadius)
      ..arcToPoint(Offset(rect.right - cornerRadius, rect.bottom),
          radius: Radius.circular(cornerRadius),
          rotation: 45.0,
          largeArc: false,
          clockwise: true)
      ..close();
  }

  Rect _positionGuestAtCenterLeft(Rect main) {
    return Rect.fromCenter(
      center: Offset(main.left, main.center.dy),
      width: guestSideLength,
      height: guestSideLength,
    );
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {
    Paint paint = new Paint()
      ..color = colored ? borderColor : Colors.transparent
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;

    canvas.drawPath(getOuterPath(rect), paint);
  }

  @override
  ShapeBorder scale(double t) {
    return new WizardOptionBorder(borderWidth: borderWidth * (t));
  }
}
