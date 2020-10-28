import 'package:flutter/material.dart';
import 'package:soul_mate/pages/onboarding/animated_image.dart';
import 'package:soul_mate/styles.dart';

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
        padding: const EdgeInsets.only(bottom: 32.0),
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
                    width: (MediaQuery.of(context).size.width - 32),
                    child: Text(
                      'Timeline',
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
                padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                child: Text(
                  "Potential dates are suggested to you based on your " +
                      "interests and personality. You can show interest on someone by swiping up or to the right. " +
                      "It's a match when you swipe someone who swiped you!",
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
