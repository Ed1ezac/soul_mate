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
        padding: EdgeInsets.only(bottom: 32.h),
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
                    width: (1.sw - 32.w),
                    child: Text(
                      'Match',
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
              child: AnimatedImage('assets/images/list_tease.svg'),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 8.h,
                ),
                child: Text(
                  "Potential partners will be suggested to you. " +
                      "It's a match when you like someone who liked you!",
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
