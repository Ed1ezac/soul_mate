import 'package:flutter/material.dart';
import 'package:soul_mate/pages/auth/sign_in.dart';
import 'package:soul_mate/custom_icons_icons.dart';
import 'package:soul_mate/pages/wizard/wizard_home.dart';
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
            padding: EdgeInsets.only(
              left: 8.0,
              right: 8.0,
            ),
            child: Column(
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
                        padding: const EdgeInsets.symmetric(
                            vertical: 0.0, horizontal: 32.0),
                        margin: const EdgeInsets.only(top: 8.0, bottom: 8.0),
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
                              )),
                        ),
                      ),

                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 0.0, horizontal: 32.0),
                        margin: const EdgeInsets.only(top: 8.0, bottom: 8.0),
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
                                  color: AppColors.soulPrimaryLight)),
                        ),
                      ),

                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 0.0, horizontal: 32.0),
                        margin: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                        height: formWidgetHeight,
                        //password confirm
                        child: TextFormField(
                          autovalidate: true,
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32.0, vertical: 0.0),
                        margin: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                        height: MediaQuery.of(context).size.height / 18,
                        width: MediaQuery.of(context).size.width - 16,
                        child: RaisedButton(
                          color: AppColors.soulPrimaryLight,
                          child: Text(
                            "Register",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () => _continueToProfileWizard(),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                        child: Text(
                          "~ OR ~",
                          style: TextStyle(color: Colors.white, fontSize: 14.0),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                        child: Text(
                          "Register with",
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            InkWell(
                              customBorder: CircleBorder(),
                              onTap: () {},
                              child: Container(
                                width: 55.0,
                                height: 55.0,
                                margin: EdgeInsets.symmetric(
                                    vertical: 12.0, horizontal: 8.0),
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
                                width: 55.0,
                                height: 55.0,
                                margin: EdgeInsets.symmetric(
                                    vertical: 12.0, horizontal: 8.0),
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
                //below form
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: const EdgeInsets.only(top: 48.0, bottom: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "already have an Account?",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        InkWell(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          onTap: () => navigateToLogin(),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 6.0, horizontal: 6.0),
                            child: Text(
                              "LOGIN",
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

  bool validateFormFields() {}

  @override
  void dispose() {
    //TODO: implement dispose
    super.dispose();
  }

  Widget headerText(BuildContext context) {
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width - 16,
        margin: EdgeInsets.fromLTRB(8.0, 64.0, 8.0, 42.0),
        child: Text(
          'Sign Up',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 32, color: Colors.white, fontWeight: FontWeight.w900),
        ),
      ),
    );
  }
}
