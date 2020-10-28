import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AnimatedImage extends StatefulWidget {
  String _assetPath;
  AnimatedImage(this._assetPath);

  @override
  State<StatefulWidget> createState() {
    return _EnlargeAndFadeIn(_assetPath);
  }
}

class _EnlargeAndFadeIn extends State<AnimatedImage>
    with TickerProviderStateMixin {
  AnimationController _controllerFadeIn;
  AnimationController _controllerEnlarge;
  Animation _fadeIn;
  Animation _enlarge;
  String path;

  _EnlargeAndFadeIn(String path) {
    this.path = path;
  }

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
    double startWidth = MediaQuery.of(context).size.width - 30;

    _fadeIn = Tween(begin: startOpacity, end: 1.0).animate(
        CurvedAnimation(parent: _controllerFadeIn, curve: Curves.ease));
    _enlarge = Tween(
            begin: startWidth, end: (MediaQuery.of(context).size.width - 8))
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
      path,
      height: MediaQuery.of(context).size.height - 200,
      width: MediaQuery.of(context).size.width - 8,
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
