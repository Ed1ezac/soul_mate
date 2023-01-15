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
        padding: EdgeInsets.only(bottom: 32.0.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.topCenter,
                child: SafeArea(
                  child: Container(
                    width: (1.sw - 32.w),
                    child: Text(
                      'Soulmate',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: "Delafield",
                          fontSize: 56.sp,
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
                    child: AnimatedImage('assets/images/couple_intro.svg'),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                child: Text(
                  "Welcome to Soulmate. Your journey to find love begins here, we hope it ends here.",
                  style: TextStyle(
                    fontSize: 20.sp,
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
    double _heartHeight = 1.sw < 600 ? (3 * 1.sw / 5) : 480;
    double _heartWidth = 1.sw < 600 ? (3 * 1.sw / 5) : 480;
    double _heartStartLocation = 1.sh / 5;

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
