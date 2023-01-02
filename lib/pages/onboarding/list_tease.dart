import 'package:flutter/material.dart';
import 'package:Soulmate_App/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Soulmate_App/pages/onboarding/animated_image.dart';

class ListTease extends StatelessWidget {
  ListTease({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return container(context);
  }

  Widget container(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.soulAccentLight,
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
                  bottom: false,
                  child: Container(
                    width: (ScreenUtil().screenWidth -
                        ScreenUtil().setWidth(32.0)),
                    child: Text(
                      'Match',
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
              child: AnimatedImage('assets/images/list_tease.svg'),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: ScreenUtil().setWidth(16.0),
                  vertical: ScreenUtil().setHeight(8.0),
                ),
                child: Text(
                  "Potential partners will be suggested to you. " +
                      "It's a match when you like someone who liked you!",
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
