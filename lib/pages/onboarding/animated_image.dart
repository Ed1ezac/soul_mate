import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimatedImage extends StatefulWidget {
  final String _assetPath;
  AnimatedImage(this._assetPath);

  @override
  State<StatefulWidget> createState() {
    return _EnlargeAndFadeIn();
  }
}

class _EnlargeAndFadeIn extends State<AnimatedImage>
    with TickerProviderStateMixin {
  late AnimationController _controllerFadeIn;
  late AnimationController _controllerEnlarge;
  late Animation _fadeIn;
  late Animation _enlarge;

  @override
  initState() {
    super.initState();
    _controllerFadeIn =
        AnimationController(duration: Duration(seconds: 2), vsync: this)
          ..forward();
    _controllerEnlarge =
        AnimationController(duration: Duration(seconds: 2), vsync: this)
          ..forward();
  }

  @override
  Widget build(BuildContext context) {
    double startWidth = (1.sw - 56.w);

    _fadeIn = Tween(begin: 0.2, end: 1.0).animate(
        CurvedAnimation(parent: _controllerFadeIn, curve: Curves.ease));
    _enlarge = Tween(begin: startWidth, end: (1.sw - 16.w)).animate(
        CurvedAnimation(parent: _controllerEnlarge, curve: Curves.ease));

    return AnimatedBuilder(
      animation: _fadeIn,
      builder: (context, child) {
        return FadeTransition(
          opacity: _controllerFadeIn.drive(CurveTween(curve: Curves.ease)),
          child: Container(
            width: _enlarge.value,
            child: child,
          ),
        );
      },
      child: svgImage(context),
    );
  }

  Widget svgImage(BuildContext context) {
    return SvgPicture.asset(
      widget._assetPath,
      height: 1.sh - 280.h,
      width: 1.sw - 48.w,
      semanticsLabel: 'vector asset image',
    );
  }

  @override
  void dispose() {
    _controllerFadeIn.dispose();
    _controllerEnlarge.dispose();
    super.dispose();
  }
}
