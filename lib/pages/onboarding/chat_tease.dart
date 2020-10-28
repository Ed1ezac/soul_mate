import "package:flutter/material.dart";
import 'package:soul_mate/pages/auth/sign_up.dart';
import 'package:soul_mate/pages/onboarding/animated_image.dart';
import 'package:soul_mate/styles.dart';

class ChatTease extends StatelessWidget {
  ChatTease({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.soulPrimary,
      body: Padding(
        padding: const EdgeInsets.only(bottom: 32.0),
        child: chatTeaseColumn(context),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.play_arrow),
        label: Text(
          'START',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
        ),
        onPressed: () {
          //
          Navigator.push(
            context,
            MaterialPageRoute(
              fullscreenDialog: false,
              builder: (context) => SignUp(key),
            ),
          );
        },
      ),
    );
  }

  Widget chatTeaseColumn(BuildContext context) {
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
                width: (MediaQuery.of(context).size.width - 32),
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
            padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
            child: Text(
              "Once you are matched, you can get to know your matched partner better by chatting with them.",
              style: TextStyle(
                fontSize: 18,
                decoration: TextDecoration.none,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
