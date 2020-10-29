import 'package:Soulmate_App/utils/widget_utils.dart';
import 'package:flutter/material.dart';
import 'package:Soulmate_App/custom_icons_icons.dart';
import 'package:Soulmate_App/pages/app/home.dart';
import '../../styles.dart';

class SignIn extends StatefulWidget {
  @override
  UserSignIn createState() => UserSignIn();
}

class UserSignIn extends State<SignIn> {
  bool _formChanged = false;
  bool _isDefaultFlag = false;
  FocusNode focusNode;

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
    double formWidgetHeight = (MediaQuery.of(context).size.height / 11);
    return Scaffold(
      backgroundColor: AppColors.soulPrimary,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenAwareSizeH(8.0, context),
            ),
            child: Column(
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
                          horizontal: screenAwareSizeH(32.0, context),
                        ),
                        margin: EdgeInsets.symmetric(
                          vertical: screenAwareSizeV(8.0, context),
                        ),
                        height: formWidgetHeight,
                        child: TextFormField(
                          autofocus: false,
                          autovalidate: true,
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
                          horizontal: screenAwareSizeH(32.0, context),
                        ),
                        margin: EdgeInsets.symmetric(
                          vertical: screenAwareSizeV(8.0, context),
                        ),
                        height: formWidgetHeight,
                        //password
                        child: TextFormField(
                          autovalidate: true,
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
                          horizontal: screenAwareSizeH(32.0, context),
                        ),
                        margin: EdgeInsets.symmetric(
                          vertical: screenAwareSizeV(8.0, context),
                        ),
                        height: MediaQuery.of(context).size.height / 18,
                        width: MediaQuery.of(context).size.width - 16,
                        child: RaisedButton(
                          color: AppColors.soulPrimaryLight,
                          child: Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () => navigateToDrawingArea(),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: screenAwareSizeV(8.0, context),
                        ),
                        child: Text(
                          "~ OR ~",
                          style: TextStyle(color: Colors.white, fontSize: 14.0),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: screenAwareSizeV(8.0, context),
                        ),
                        child: Text(
                          "Login with",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: screenAwareSizeV(8.0, context),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            InkWell(
                              customBorder: CircleBorder(),
                              onTap: () {},
                              child: Container(
                                width: screenAwareSizeH(55.0, context),
                                height: screenAwareSizeV(55.0, context),
                                margin: EdgeInsets.symmetric(
                                  vertical: screenAwareSizeV(12.0, context),
                                  horizontal: screenAwareSizeH(8.0, context),
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
                                width: screenAwareSizeH(55.0, context),
                                height: screenAwareSizeV(55.0, context),
                                margin: EdgeInsets.symmetric(
                                  vertical: screenAwareSizeV(12.0, context),
                                  horizontal: screenAwareSizeH(8.0, context),
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
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      margin: EdgeInsets.only(
                        bottom: screenAwareSizeV(8.0, context),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "don't have an Account?",
                            style: TextStyle(color: Colors.white),
                          ),
                          InkWell(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            onTap: () => navigateToSignUp(context),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                vertical: screenAwareSizeV(6.0, context),
                                horizontal: screenAwareSizeH(6.0, context),
                              ),
                              child: Text(
                                "REGISTER",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
        width:
            MediaQuery.of(context).size.width - screenAwareSizeH(16.0, context),
        margin: EdgeInsets.fromLTRB(
          screenAwareSizeH(8.0, context),
          screenAwareSizeV(80.0, context),
          screenAwareSizeH(8.0, context),
          screenAwareSizeH(40.0, context),
        ),
        child: Text(
          'Sign In',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 32, color: Colors.white, fontWeight: FontWeight.w900),
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
