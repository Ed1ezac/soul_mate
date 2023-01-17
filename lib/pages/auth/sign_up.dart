import 'package:Soulmate_App/utils/widget_utils.dart';
import 'package:flutter/material.dart';
import 'package:Soulmate_App/pages/auth/sign_in.dart';
import 'package:Soulmate_App/custom_icons_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../styles.dart';
import '../wizard/wizard_home.dart';

class SignUp extends StatefulWidget {
  SignUp(Key key) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return UserSignUp();
  }
}

class UserSignUp extends State<SignUp> {
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
    InputBorder focusedBorder = OutlineInputBorder(
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
                    //onChanged: ,
                    child: Column(
                      children: <Widget>[
                        //email
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
                            prefixIcon: Icon(
                              Icons.mail_outline,
                              color: AppColors.soulPrimary,
                            ),
                          ),
                        ),
                        //password
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
                            prefixIcon: Icon(
                              Icons.vpn_key,
                              color: AppColors.soulPrimary,
                            ),
                          ),
                        ),
                        //password confirm
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          obscureText: true,
                          style: TextStyle(color: Colors.white70),
                          decoration: InputDecoration(
                              helperText: "",
                              labelText: "confirm password",
                              labelStyle: labelStyle,
                              focusedBorder: focusedBorder,
                              enabledBorder: enabledBorder,
                              prefixIcon: Icon(
                                Icons.vpn_key,
                                color: AppColors.soulPrimary,
                              )),
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
                              "Register",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                            onPressed: () => _continueToProfileWizard(),
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
                            "Register with",
                            style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
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
                                    color: AppColors.soulPrimary,
                                  ),
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
                          "Already have an account? ",
                          style: TextStyle(
                            fontSize: 11.sp,
                            color: Colors.white70,
                          ),
                        ),
                        InkWell(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5.0)),
                          onTap: () => navigateToLogin(),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 4.w,
                              horizontal: 6.w,
                            ),
                            child: Text(
                              "LOGIN",
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

  //After auth verificaion/validation
  void _continueToProfileWizard() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProfileWizard(),
      ),
    );
  }

  void navigateToLogin() {
    Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: false,
        builder: (context) => SignIn(),
      ),
    );
  }

  bool validateFormFields() {
    return false;
  }

  @override
  void dispose() {
    //TODO: implement dispose
    super.dispose();
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
          'Sign Up',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 32.sp,
              color: Colors.white,
              fontWeight: FontWeight.w900),
        ),
      ),
    );
  }
}
