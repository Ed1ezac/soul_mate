import 'package:flutter/material.dart';
import 'package:Soulmate_App/custom_icons_icons.dart';
import 'package:Soulmate_App/pages/app/home.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../styles.dart';

class SignIn extends StatefulWidget {
  @override
  UserSignIn createState() => UserSignIn();
}

class UserSignIn extends State<SignIn> {
  bool _formChanged = false;
  bool _isDefaultFlag = false;
  late FocusNode focusNode;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle labelStyle = TextStyle(color: Colors.white70);
    InputBorder focusedBorder = const OutlineInputBorder(
      borderSide: const BorderSide(
          color: Colors.white70, //AppColor.soulPrimaryLight,
          width: 1.6),
    );
    InputBorder enabledBorder = const OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.soulPrimary, width: 0.4),
    );
    return Scaffold(
      backgroundColor: AppColors.soulPrimaryLight,
      body: SafeArea(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 32.w,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  //Top header
                  headerText(context),
                  //form
                  Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          autofocus: false,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          style: TextStyle(color: Colors.white70),
                          decoration: InputDecoration(
                            helperText: "",
                            labelText: "email",
                            labelStyle: labelStyle,
                            focusedBorder: focusedBorder,
                            enabledBorder: enabledBorder,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 18.h, horizontal: 4.w),
                            prefixIcon: Icon(
                              Icons.mail_outline,
                              color: AppColors.soulPrimary,
                            ),
                          ),
                        ),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          obscureText: true,
                          style: TextStyle(color: Colors.white70),
                          decoration: InputDecoration(
                            helperText: "",
                            labelText: "password",
                            labelStyle: labelStyle,
                            focusedBorder: focusedBorder,
                            enabledBorder: enabledBorder,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 18.h, horizontal: 4.w),
                            prefixIcon: Icon(Icons.vpn_key,
                                color: AppColors.soulPrimary),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                            vertical: 8.h,
                          ),
                          height: 48.h,
                          width: 1.sw,
                          child: RaisedButton(
                            color: AppColors.soulPrimary,
                            child: Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onPressed: () => navigateToDrawingArea(),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                            vertical: 8.h,
                          ),
                          child: Text(
                            "OR",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            bottom: 8.h,
                          ),
                          child: Text(
                            "Login with",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                            vertical: 8.h,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              InkWell(
                                customBorder: CircleBorder(),
                                onTap: () {},
                                child: Container(
                                  width: 50.w,
                                  height: 50.w,
                                  margin: EdgeInsets.symmetric(
                                    vertical: 12.h,
                                    horizontal: 8.w,
                                  ),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.soulPrimary,
                                  ),
                                  child: Icon(
                                    CustomIcons.facebook_f,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              InkWell(
                                customBorder: CircleBorder(),
                                onTap: () {},
                                child: Container(
                                  width: 50.w,
                                  height: 50.w,
                                  margin: EdgeInsets.symmetric(
                                    vertical: 12.h,
                                    horizontal: 8.w,
                                  ),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.soulPrimary),
                                  child: Icon(
                                    CustomIcons.twitter,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  //below form
                  Container(
                    margin: EdgeInsets.only(
                      top: 16.h,
                      bottom: 4.h,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Don't have an account?",
                          style: TextStyle(
                            fontSize: 11.sp,
                            color: Colors.white70,
                          ),
                        ),
                        InkWell(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5.0)),
                          onTap: () => navigateToSignUp(context),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 4.w,
                              horizontal: 6.w,
                            ),
                            child: Text(
                              "REGISTER",
                              style: TextStyle(
                                fontSize: 11.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void navigateToDrawingArea() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Home(),
      ),
    );
  }

  void navigateToSignUp(BuildContext context) {
    Navigator.pop(context);
  }

  Widget headerText(BuildContext context) {
    return SafeArea(
      child: Container(
        width: 1.sw - 16.w,
        margin: EdgeInsets.fromLTRB(
          8.w,
          8.h,
          8.w,
          48.h,
        ),
        child: Text(
          'Sign In',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 32.sp,
              color: Colors.white,
              fontWeight: FontWeight.w900),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
