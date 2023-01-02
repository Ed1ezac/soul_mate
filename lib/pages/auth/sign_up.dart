import 'package:Soulmate_App/utils/widget_utils.dart';
import 'package:flutter/material.dart';
import 'package:Soulmate_App/pages/auth/sign_in.dart';
import 'package:Soulmate_App/custom_icons_icons.dart';
import 'package:Soulmate_App/widgets/DRAWING_AREA.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../styles.dart';

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
                      //onChanged: ,
                      child: Column(
                        children: <Widget>[
                          //email
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: ScreenUtil().setWidth(32.0),
                            ),
                            margin: EdgeInsets.symmetric(
                              vertical: ScreenUtil().setHeight(5.0),
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
                                  )),
                            ),
                          ),

                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: ScreenUtil().setWidth(32.0),
                            ),
                            margin: EdgeInsets.symmetric(
                              vertical: ScreenUtil().setHeight(5.0),
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
                                      color: AppColors.soulPrimaryLight)),
                            ),
                          ),

                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: ScreenUtil().setWidth(32.0),
                            ),
                            margin: EdgeInsets.symmetric(
                              vertical: ScreenUtil().setHeight(5.0),
                            ),
                            height: ScreenUtil().setHeight(76.0),
                            //password confirm
                            child: TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              obscureText: true,
                              style: TextStyle(color: Colors.white70),
                              cursorColor: AppColors.soulAccent,
                              decoration: InputDecoration(
                                  helperText: "",
                                  labelText: "confirm password",
                                  labelStyle: labelStyle,
                                  focusedBorder: focusedBorder,
                                  enabledBorder: enabledBorder,
                                  prefixIcon: Icon(Icons.vpn_key,
                                      color: AppColors.soulPrimaryLight)),
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
                                "Register",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: ScreenUtil().setSp(18.0),
                                    fontWeight: FontWeight.bold),
                              ),
                              onPressed: () => _continueToProfileWizard(),
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
                              "Register with",
                              style: TextStyle(
                                  fontSize: ScreenUtil().setSp(16.0),
                                  color: Colors.white,
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
                                      vertical: screenAwareSizeV(12.0, context),
                                      horizontal:
                                          screenAwareSizeH(8.0, context),
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
                                      vertical: screenAwareSizeV(12.0, context),
                                      horizontal:
                                          screenAwareSizeH(8.0, context),
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
                //below form
                Container(
                  margin: EdgeInsets.only(
                    top: ScreenUtil().setHeight(16.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "already have an account?",
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(11.0),
                          color: Colors.white70,
                        ),
                      ),
                      InkWell(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        onTap: () => navigateToLogin(),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: ScreenUtil().setHeight(6.0),
                            horizontal: ScreenUtil().setWidth(6.0),
                          ),
                          child: Text(
                            "LOGIN",
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

  void _continueToProfileWizard() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DrawingArea(), //ProfileWizard(),
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
        width: ScreenUtil().screenWidth - ScreenUtil().setWidth(16.0),
        margin: EdgeInsets.fromLTRB(
          ScreenUtil().setWidth(8.0),
          ScreenUtil().setHeight(64.0),
          ScreenUtil().setWidth(8.0),
          ScreenUtil().setHeight(42.0),
        ),
        child: Text(
          'Sign Up',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: ScreenUtil().setSp(32),
              color: Colors.white,
              fontWeight: FontWeight.w900),
        ),
      ),
    );
  }
}
