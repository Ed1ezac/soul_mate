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
          width: 2.0),
    );
    InputBorder enabledBorder = const OutlineInputBorder(
      borderSide:
          const BorderSide(color: AppColors.soulPrimaryLight, width: 0.0),
    );
    return Scaffold(
      backgroundColor: AppColors.soulPrimary,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setWidth(8.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    //Top header
                    headerText(context),
                    //form
                    Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: ScreenUtil().setWidth(32.0),
                            ),
                            margin: EdgeInsets.symmetric(
                              vertical: ScreenUtil().setHeight(8.0),
                            ),
                            height: ScreenUtil().setHeight(76.0),
                            child: TextFormField(
                              autofocus: false,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              style: TextStyle(color: Colors.white70),
                              decoration: InputDecoration(
                                helperText: "",
                                labelText: "email",
                                labelStyle: labelStyle,
                                focusedBorder: focusedBorder,
                                enabledBorder: enabledBorder,
                                prefixIcon: Icon(
                                  Icons.mail_outline,
                                  color: AppColors.soulPrimaryLight,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: ScreenUtil().setWidth(32.0),
                            ),
                            margin: EdgeInsets.symmetric(
                              vertical: ScreenUtil().setHeight(8.0),
                            ),
                            height: ScreenUtil().setHeight(76.0),
                            //password
                            child: TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              obscureText: true,
                              style: TextStyle(color: Colors.white70),
                              decoration: InputDecoration(
                                helperText: "",
                                labelText: "password",
                                labelStyle: labelStyle,
                                focusedBorder: focusedBorder,
                                enabledBorder: enabledBorder,
                                prefixIcon: Icon(Icons.vpn_key,
                                    color: AppColors.soulPrimaryLight),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: ScreenUtil().setWidth(32.0),
                            ),
                            margin: EdgeInsets.symmetric(
                              vertical: ScreenUtil().setHeight(8.0),
                            ),
                            height: ScreenUtil().setHeight(44.0),
                            width: ScreenUtil().screenWidth - 16,
                            child: RaisedButton(
                              color: AppColors.soulPrimaryLight,
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: ScreenUtil().setSp(18.0),
                                    fontWeight: FontWeight.bold),
                              ),
                              onPressed: () => navigateToDrawingArea(),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                              vertical: ScreenUtil().setHeight(8.0),
                            ),
                            child: Text(
                              "OR",
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: ScreenUtil().setSp(12.0)),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                              vertical: ScreenUtil().setHeight(8.0),
                            ),
                            child: Text(
                              "Login with",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: ScreenUtil().setSp(16.0),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                              vertical: ScreenUtil().setHeight(8.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                InkWell(
                                  customBorder: CircleBorder(),
                                  onTap: () {},
                                  child: Container(
                                    width: ScreenUtil().setWidth(50.0),
                                    height: ScreenUtil().setWidth(50.0),
                                    margin: EdgeInsets.symmetric(
                                      vertical: ScreenUtil().setHeight(12.0),
                                      horizontal: ScreenUtil().setWidth(8.0),
                                    ),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColors.soulPrimaryLight),
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
                                    width: ScreenUtil().setWidth(50.0),
                                    height: ScreenUtil().setWidth(50.0),
                                    margin: EdgeInsets.symmetric(
                                      vertical: ScreenUtil().setHeight(12.0),
                                      horizontal: ScreenUtil().setWidth(8.0),
                                    ),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColors.soulPrimaryLight),
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
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: ScreenUtil().setHeight(64.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "don't have an account?",
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(11.0),
                          color: Colors.white70,
                        ),
                      ),
                      InkWell(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        onTap: () => navigateToSignUp(context),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: ScreenUtil().setHeight(6.0),
                            horizontal: ScreenUtil().setWidth(6.0),
                          ),
                          child: Text(
                            "REGISTER",
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(11.0),
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
        width: ScreenUtil().screenWidth - ScreenUtil().setWidth(16.0),
        margin: EdgeInsets.fromLTRB(
          ScreenUtil().setWidth(8.0),
          ScreenUtil().setHeight(80.0),
          ScreenUtil().setWidth(8.0),
          ScreenUtil().setHeight(40.0),
        ),
        child: Text(
          'Sign In',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: ScreenUtil().setSp(32),
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
