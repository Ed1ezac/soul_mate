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
    double startOpacity = 0.3;
    double startWidth = ScreenUtil().screenWidth - ScreenUtil().setWidth(40.0);

    _fadeIn = Tween(begin: startOpacity, end: 1.0).animate(
        CurvedAnimation(parent: _controllerFadeIn, curve: Curves.ease));
    _enlarge = Tween(
            begin: startWidth,
            end: (ScreenUtil().screenWidth - ScreenUtil().setWidth(16.0)))
        .animate(
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
      height: ScreenUtil().screenHeight - ScreenUtil().setHeight(280.0),
      width: ScreenUtil().screenWidth - ScreenUtil().setWidth(40.0),
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
