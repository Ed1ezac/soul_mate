import 'package:flutter/material.dart';
import 'package:Soulmate_App/styles.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Soulmate_App/pages/onboarding/animated_image.dart';

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
        padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(32.0)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.topCenter,
                child: SafeArea(
                  child: Container(
                    width: (ScreenUtil().screenWidth -
                        ScreenUtil().setWidth(32.0)),
                    child: Text(
                      'Soulmate',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: "Delafield",
                          fontSize: ScreenUtil().setSp(56.0),
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
                    top: 5.0,
                    child: _AnimatedHeartWidget(),
                  ),
                  Positioned(
                    top: 0.0,
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
                    horizontal: ScreenUtil().setWidth(16.0),
                    vertical: ScreenUtil().setHeight(8.0)),
                child: Text(
                  "Welcome to Soulmate. Your journey to find love begins here, we hope it ends here.",
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(19),
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
  late AnimationController _controllerFloatUp;
  late AnimationController _controllerGrowSize;
  late Animation<double> _animationFloatUp;
  late Animation<double> _animationGrowSize;

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
    double _heartHeight = ScreenUtil().screenHeight / 3;
    double _heartWidth = ScreenUtil().screenHeight / 1.8;
    double _heartStartLocation = ScreenUtil().screenHeight / 5;

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
