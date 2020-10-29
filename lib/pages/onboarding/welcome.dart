import 'package:Soulmate_App/utils/widget_utils.dart';
import 'package:flutter/material.dart';
import 'package:Soulmate_App/pages/onboarding/animated_image.dart';
import 'package:Soulmate_App/styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return container(context);
  }

  Widget container(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.soulPrimaryLight,
      //body
      body: Padding(
        padding: EdgeInsets.only(bottom: screenAwareSizeV(32.0, context)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.topCenter,
                child: SafeArea(
                  child: Container(
                    width: (MediaQuery.of(context).size.width -
                        screenAwareSizeH(32.0, context)),
                    child: Text(
                      'Soulmate',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: "Delafield",
                          fontSize: 56.0,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Positioned(
                    top: 0.0,
                    child: _AnimatedHeartWidget(),
                  ),
                  Positioned(
                    top: screenAwareSizeV(5.0, context),
                    child: AnimatedImage(
                        'assets/images/couple_intro.svg'), //const _CoupleImage(),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: screenAwareSizeH(16.0, context),
                    vertical: screenAwareSizeV(8.0, context)),
                child: Text(
                  "Welcome to Soulmate. Your journey to find love begins here, we hope it ends here.",
                  style: TextStyle(
                    fontSize: 18,
                    decoration: TextDecoration.none,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*class _CoupleImage extends StatelessWidget {
  const _CoupleImage({
    Key key,
  }) : super(key: key);

  final String assetURI = 'assets/images/couple_intro.svg';

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetURI,
      height: MediaQuery.of(context).size.height - 200, //850,
      width: MediaQuery.of(context).size.width - 8, //600,
      semanticsLabel: 'couple image',
    );
  }
}*/

class _AnimatedHeartWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AnimatedHeartState();
  }
}

class _AnimatedHeartState extends State<_AnimatedHeartWidget>
    with TickerProviderStateMixin {
  AnimationController _controllerFloatUp;
  AnimationController _controllerGrowSize;
  Animation<double> _animationFloatUp;
  Animation<double> _animationGrowSize;

  @override
  void initState() {
    super.initState();
    _controllerFloatUp =
        AnimationController(duration: Duration(seconds: 4), vsync: this);
    _controllerGrowSize =
        AnimationController(duration: Duration(seconds: 3), vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    double _heartHeight = MediaQuery.of(context).size.height / 2;
    double _heartWidth = MediaQuery.of(context).size.width / 1.5;
    double _heartStartLocation = MediaQuery.of(context).size.height / 5;

    _animationFloatUp = Tween(begin: _heartStartLocation, end: 0.0).animate(
        CurvedAnimation(
            parent: _controllerFloatUp, curve: Curves.fastOutSlowIn));
    _animationGrowSize = Tween(begin: 80.0, end: _heartWidth).animate(
        CurvedAnimation(
            parent: _controllerGrowSize, curve: Curves.elasticInOut));

    _controllerFloatUp.forward();
    _controllerGrowSize.forward();

    return AnimatedBuilder(
      animation: _animationFloatUp,
      builder: (context, child) {
        return Container(
          child: child,
          margin: EdgeInsets.only(top: _animationFloatUp.value),
          width: _animationGrowSize.value,
        );
      },
      child: SvgPicture.asset(
        'assets/images/heart.svg',
        height: _heartHeight,
        width: _heartWidth,
      ),
    );
  }

  @override
  void dispose() {
    _controllerFloatUp.dispose();
    _controllerGrowSize.dispose();
    super.dispose();
  }
}
