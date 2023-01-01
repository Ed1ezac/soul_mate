import 'package:flutter/material.dart';
import 'package:Soulmate_App/styles.dart';
import '../../custom_icons_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Soulmate_App/models/user_basic_details.dart';
import 'package:Soulmate_App/widgets/height_picker_dialog.dart';

class BasicDetails extends StatefulWidget {
  final UserBasicDetails details;
  BasicDetails({required this.details});

  @override
  State<StatefulWidget> createState() {
    return BasicDetailsState();
  }
}

class BasicDetailsState extends State<BasicDetails> {
  bool _heightIsEmpty = true, _heightHasError = false, _shouldHideAge = false;
  late String _height;
  late Gender _gender;
  late Sexuality _sexuality;
  int defaultHeight = 157;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    if (!widget.details.isEmpty()) {
      _height = widget.details.height.toString();
      _gender = widget.details.gender;
      _sexuality = widget.details.sexuality;
      _shouldHideAge = widget.details.hideAge;
      _heightIsEmpty = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    //double screenHeight = (MediaQuery.of(context).size.height);
    final EdgeInsets _formFieldPadding = EdgeInsets.symmetric(
        vertical: 0.0, horizontal: ScreenUtil().setWidth(32.0));
    final EdgeInsets _formFieldMargin = EdgeInsets.only(
        top: ScreenUtil().setHeight(8.0), bottom: ScreenUtil().setHeight(8.0));

    return Scaffold(
      //backgroundColor: AppColor.soulPrimaryLight,
      appBar: AppBar(
        title: Text("Basics"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () => _returnORFail(),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              left: ScreenUtil().setWidth(8.0),
              right: ScreenUtil().setWidth(8.0),
              bottom: ScreenUtil().setHeight(16.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: _formFieldPadding,
                  margin: _formFieldMargin,
                  child: Text(
                    "Help us get to know you better! Don't worry, most of your " +
                        "basic details are private and never shared with anyone.",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: ScreenUtil().setSp(16.0),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      //SCREEN NAME
                      Container(
                        padding: _formFieldPadding,
                        margin: _formFieldMargin,
                        height: ScreenUtil().setHeight(96.0),
                        child: TextFormField(
                          autofocus: false,
                          initialValue: widget.details.name == null
                              ? ''
                              : widget.details.name,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (name) => _validateName(name!),
                          onSaved: (name) => {widget.details.name = name!},
                          decoration: InputDecoration(
                            helperMaxLines: 2,
                            helperText:
                                "People will see this when they look at your profile or interact with you.",
                            labelText: "Screen Name/Alias",
                            labelStyle: TextStyle(color: Colors.grey),
                            focusColor: AppColors.soulPrimary,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.soulPrimary, width: 2.0),
                            ),
                            prefixIcon: Icon(
                              Icons.person,
                              color: AppColors.soulPrimary,
                            ),
                          ),
                        ),
                      ),
                      //AGE
                      Container(
                        padding: _formFieldPadding,
                        margin: _formFieldMargin,
                        height: ScreenUtil().setHeight(96.0),
                        child: TextFormField(
                          autofocus: false,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          initialValue: widget.details.age == null
                              ? ''
                              : widget.details.age.toString(),
                          enableInteractiveSelection: false,
                          validator: (age) => _validateAge(age!),
                          onSaved: (age) =>
                              {widget.details.age = int.tryParse(age!)!},
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            helperMaxLines: 2,
                            helperText:
                                "Your age is shown beside your name on your profile. It is public by default.",
                            labelText: "Age",
                            labelStyle: TextStyle(color: Colors.grey),
                            focusColor: AppColors.soulPrimary,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.soulPrimary, width: 2.0),
                            ),
                            prefixIcon: Icon(
                              Icons.cake,
                              color: AppColors.soulPrimary,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: _formFieldPadding,
                        margin: EdgeInsets.only(
                            bottom: ScreenUtil().setHeight(10.0)),
                        height: ScreenUtil().setHeight(24.0),
                        child: Row(
                          children: <Widget>[
                            Checkbox(
                              value: _shouldHideAge,
                              onChanged: (bool? newValue) {
                                setState(() {
                                  _shouldHideAge = newValue!;
                                });
                              },
                            ),
                            Text(
                              "Make my age private.",
                            ),
                          ],
                        ),
                      ),
                      //GENDER
                      Container(
                        padding: _formFieldPadding,
                        margin: _formFieldMargin,
                        height: ScreenUtil().setHeight(90.0),
                        child: DropdownButtonFormField<Gender>(
                          value: _gender,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          onTap: () {
                            FocusScope.of(context)
                                .requestFocus(new FocusNode());
                          },
                          validator: (_gender) => _validateGender(_gender!),
                          onSaved: (_gender) =>
                              {widget.details.gender = _gender!},
                          decoration: InputDecoration(
                            helperText: "This is private.",
                            labelText: "Gender",
                            prefixIcon: Icon(
                              CustomIcons.transgender_alt, //puzzle_piece
                              color: AppColors.soulPrimary,
                            ),
                          ),
                          items: <DropdownMenuItem<Gender>>[
                            DropdownMenuItem(
                              value: Gender.Male,
                              child: Text("Male"),
                            ),
                            DropdownMenuItem(
                              value: Gender.Female,
                              child: Text("Female"),
                            ),
                            DropdownMenuItem(
                              value: Gender.Transgender,
                              child: Text("Transgender"),
                            ),
                            DropdownMenuItem(
                              value: Gender.GenderNeutral,
                              child: Text("Gender Neutral"),
                            ),
                          ],
                          onChanged: (Gender? value) {
                            setState(() {
                              _gender = value!;
                            });
                          },
                        ),
                      ),
                      //SEXUALITY
                      Container(
                        padding: _formFieldPadding,
                        margin: _formFieldMargin,
                        height: ScreenUtil().setHeight(90.0),
                        child: DropdownButtonFormField<Sexuality>(
                          value: _sexuality,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          onTap: () {
                            FocusScope.of(context)
                                .requestFocus(new FocusNode());
                          },
                          validator: (_sexuality) =>
                              _validateSexuality(_sexuality!),
                          onSaved: (_sexuality) =>
                              {widget.details.sexuality = _sexuality!},
                          decoration: InputDecoration(
                            helperText: "This is private.",
                            labelText: "Sexual Orientation",
                            prefixIcon: Icon(
                              Icons.group, //CustomIcons.puzzle_piece,
                              color: AppColors.soulPrimary,
                            ),
                          ),
                          items: <DropdownMenuItem<Sexuality>>[
                            DropdownMenuItem(
                              value: Sexuality.Heterosexual,
                              child: Text("Heterosexual"),
                            ),
                            DropdownMenuItem(
                              value: Sexuality.Homosexual,
                              child: Text("Homosexual"),
                            ),
                            DropdownMenuItem(
                              value: Sexuality.Bisexual,
                              child: Text("Bisexual"),
                            ),
                            DropdownMenuItem(
                              value: Sexuality.Other,
                              child: Text("Other"),
                            ),
                          ],
                          onChanged: (Sexuality? value) {
                            setState(() {
                              _sexuality = value!;
                            });
                          },
                        ),
                      ),
                      //HEIGHT
                      Container(
                        padding: _formFieldPadding,
                        margin: _formFieldMargin,
                        height: ScreenUtil().setHeight(96.0),
                        child: GestureDetector(
                            onTap: () {
                              FocusScope.of(context)
                                  .requestFocus(new FocusNode());
                              _showHeightPickerDialog(context);
                            },
                            child: _buildHeightWidget(_heightHasError)),
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

  Widget _buildHeightWidget(bool hasError) {
    if (hasError) {
      return InputDecorator(
        //style: TextStyle(color: Colors.black),
        //isFocused: heightFocused,
        isEmpty: _heightIsEmpty,
        child: getHeightText(),
        decoration: InputDecoration(
          errorText: "height is required",
          labelText: "Height",
          prefixIcon: Icon(
            Icons.format_line_spacing,
            color: AppColors.soulPrimary,
          ),
        ),
      );
    } else {
      return InputDecorator(
        //style: TextStyle(color: Colors.black),
        //isFocused: heightFocused,
        isEmpty: _heightIsEmpty,
        child: getHeightText(),
        decoration: InputDecoration(
          helperMaxLines: 2,
          helperText: "This is shown publicly on your profile.",
          labelText: "Height",
          prefixIcon: Icon(
            Icons.format_line_spacing,
            color: AppColors.soulPrimary,
          ),
        ),
      );
    }
  }

  void _showHeightPickerDialog(BuildContext context) async {
    int pickedHeight = await showDialog(
        context: context,
        builder: (BuildContext context) => HeightPickerDialog(
              height: _height == null ? defaultHeight : int.tryParse(_height)!,
            ));
    if (pickedHeight != null) {
      setState(() {
        _heightIsEmpty = false;
        _height = pickedHeight.toString();
      });
    }
  }

  Widget? getHeightText() {
    if (_height != null) {
      return Text(
        _height + " cm",
        style: TextStyle(fontSize: ScreenUtil().setSp(16.0)),
      );
    }
    return null;
  }

  String? _validateName(String value) {
    if (value.isEmpty) return "screen name is required";
    if (value.length > 40) return "screen name is too long";
    return value.length < 3 ? "screen name is too short" : null;
  }

  String? _validateAge(String value) {
    //valid number, larger than 18, lower than 100
    if (value.isEmpty) return "your age is required";
    int valueAsInteger = int.tryParse(value)!;
    if (valueAsInteger == null) {
      return "invalid input for age. Enter numbers only.";
    } else if (valueAsInteger < 18) {
      return "you are too young to join, must be 18+";
    } else if (valueAsInteger > 100) {
      return "sorry, you are too old to join";
    }
    return null;
  }

  String? _validateGender(Gender value) {
    return (value == null) ? "your gender is required" : null;
  }

  String? _validateSexuality(Sexuality value) {
    return (value == null) ? "your sexuality is required" : null;
  }

  void _returnORFail() {
    if (formIsValid()) {
      //save the formstate and all
      _formKey.currentState!.save();
      widget.details.height = int.tryParse(_height)!;
      widget.details.hideAge = _shouldHideAge;
      Navigator.pop(context, widget.details);
    }
  }

  bool formIsValid() {
    bool form, height; //mutual exclusivity
    form = _formKey.currentState!.validate();
    height = _validateHeight(_height);
    return form && height;
  }

  bool _validateHeight(String value) {
    if (value == null || value.isEmpty) {
      setState(() {
        _heightHasError = true;
      });
      return false;
    } else if (_heightHasError) {
      setState(() {
        _heightHasError = false;
      });
    }
    return true;
  }

  @override
  void dispose() {
    //TODO: implement dispose
    super.dispose();
  }
}
