import 'package:flutter/material.dart';
import 'package:Soulmate_App/utils/widget_utils.dart';
import 'package:Soulmate_App/pages/onboarding/animated_image.dart';
import 'package:Soulmate_App/styles.dart';

class ListTease extends StatelessWidget {
  ListTease({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return container(context);
  }

  Widget container(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.soulAccentLight,
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
                  bottom: false,
                  child: Container(
                    width: (MediaQuery.of(context).size.width -
                        screenAwareSizeH(32.0, context)),
                    child: Text(
                      'Match',
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
              child: AnimatedImage('assets/images/list_tease.svg'),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenAwareSizeH(16.0, context),
                  vertical: screenAwareSizeV(8.0, context),
                ),
                child: Text(
                  "Potential dates are suggested to you based on your " +
                      "interests and personality. It's a match when you like someone who liked you!",
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
