import "package:flutter/material.dart";
import 'package:Soulmate_App/styles.dart';
import 'package:Soulmate_App/pages/auth/sign_up.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Soulmate_App/pages/onboarding/animated_image.dart';

class ChatTease extends StatelessWidget {
  ChatTease({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.soulPrimary,
      body: Padding(
        padding: EdgeInsets.only(bottom: ScreenUtil().setWidth(32.0)),
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
                      'Chat',
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.visible,
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
              child: AnimatedImage('assets/images/chat_tease.svg'),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: ScreenUtil().setWidth(16.0),
                  vertical: ScreenUtil().setHeight(8.0),
                ),
                child: Text(
                  "Once you are matched, you can get to know your matched partner better by chatting with them.",
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(20),
                    decoration: TextDecoration.none,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.play_arrow),
        label: Text(
          'START',
          style: TextStyle(
              fontSize: ScreenUtil().setSp(16), fontWeight: FontWeight.w900),
        ),
        onPressed: () {
          //
          Navigator.push(
            context,
            MaterialPageRoute(
              fullscreenDialog: false,
              builder: (context) => SignUp(UniqueKey()),
            ),
          );
        },
      ),
    );
  }

  /*Widget chatTeaseColumn(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Align(
            alignment: Alignment.topCenter,
            child: SafeArea(
              bottom: false,
              child: Container(
                width: (ScreenUtil().screenWidth - ScreenUtil().setWidth(32.0)),
                child: Text(
                  'Chat',
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
          child: AnimatedImage('assets/images/chat_tease.svg'),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setWidth(16.0),
              vertical: ScreenUtil().setHeight(8.0),
            ),
            child: Text(
              "Once you are matched, you can get to know your matched partner better by chatting with them.",
              style: TextStyle(
                fontSize: ScreenUtil().setSp(20),
                decoration: TextDecoration.none,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }*/
}
