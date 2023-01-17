import 'package:flutter/material.dart';
import 'package:Soulmate_App/styles.dart';
import '../../custom_icons_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Soulmate_App/models/user.dart';
import 'package:Soulmate_App/widgets/height_picker_dialog.dart';

class BasicDetails extends StatefulWidget {
  final User details;
  BasicDetails({required this.details});

  @override
  State<StatefulWidget> createState() {
    return BasicDetailsState();
  }
}

class BasicDetailsState extends State<BasicDetails> {
  bool _heightIsEmpty = true, _heightHasError = false;
  late String _height;
  int defaultHeight = 157;
  bool isDateSelected = false;
  DateTime birthDate = DateTime.now();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  //late Future<List<String>> _gendersList;

  @override
  void initState() {
    super.initState();
    //_gendersList = _getAllGenders();
    _height = widget.details.height.toString();
    _heightIsEmpty = widget.details.isEmpty();
  }

  @override
  Widget build(BuildContext context) {
    final EdgeInsets _formFieldMargin = EdgeInsets.symmetric(vertical: 8.h);

    return Scaffold(
      //backgroundColor: AppColor.soulPrimaryLight,
      appBar: AppBar(
        title: Text("Basics"),
        backgroundColor: AppColors.soulPrimary,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () => _returnOrFail(),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 24.w,
              vertical: 12.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  //padding: _formFieldPadding,
                  margin: _formFieldMargin,
                  child: Text(
                    "Most of your " +
                        "basic details are private and never shared with anyone.",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                _gap(),
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      //SCREEN NAME
                      TextFormField(
                        autofocus: false,
                        initialValue: widget.details.name,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (name) => _validateName(name!),
                        onSaved: (name) => {widget.details.name = name!},
                        decoration: InputDecoration(
                          helperText:
                              "People will see this when they look at your profile or interact with you.",
                          labelText: "Screen Name/Alias",
                          prefixIcon: Icon(
                            Icons.person,
                            color: AppColors.soulPrimaryLight,
                          ),
                        ),
                      ),
                      _gap(),
                      //Birthday / AGE
                      TextFormField(
                        autofocus: false,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        initialValue: widget.details.age == 0
                            ? ''
                            : widget.details.age.toString(),
                        enableInteractiveSelection: false,
                        validator: (age) => _validateAge(age!),
                        onSaved: (age) =>
                            {widget.details.age = int.tryParse(age!)!},
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          helperText:
                              "Your age is shown beside your name on your profile. It is public by default.",
                          labelText: "Age",
                          prefixIcon: Icon(
                            Icons.cake,
                            color: AppColors.soulPrimaryLight,
                          ),
                        ),
                      ),
                      /*Container(
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
                      ),*/
                      _gap(),
                      //GENDER
                      DropdownButtonFormField<String>(
                        value: widget.details.gender,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onTap: () {
                          FocusScope.of(context).requestFocus(new FocusNode());
                        },
                        validator: (gender) => _validateGender(gender!),
                        onSaved: (gender) => {widget.details.gender = gender!},
                        decoration: InputDecoration(
                          helperText: "This is private.",
                          labelText: "Gender",
                          prefixIcon: Icon(
                            CustomIcons.transgender_alt, //puzzle_piece
                            color: AppColors.soulPrimaryLight,
                          ),
                        ),
                        items: <DropdownMenuItem<String>>[
                          DropdownMenuItem(
                            value: "Male",
                            child: Text("Male"),
                          ),
                          DropdownMenuItem(
                            value: "Female",
                            child: Text("Female"),
                          ),
                          DropdownMenuItem(
                            value: "Transgender",
                            child: Text("Transgender"),
                          ),
                          DropdownMenuItem(
                            value: "Gender Neutral",
                            child: Text("Gender Neutral"),
                          ),
                        ],
                        onChanged: (String? value) {
                          setState(() {
                            widget.details.gender = value!;
                          });
                        },
                      ),
                      _gap(),
                      //SEXUALITY
                      DropdownButtonFormField<String>(
                        value: widget.details.sexuality,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onTap: () {
                          FocusScope.of(context).requestFocus(new FocusNode());
                        },
                        validator: (sexuality) =>
                            _validateSexuality(sexuality!),
                        onSaved: (sexuality) =>
                            {widget.details.sexuality = sexuality!},
                        decoration: InputDecoration(
                          helperText: "This is private.",
                          labelText: "Sexual Orientation",
                          prefixIcon: Icon(
                            Icons.group, //CustomIcons.puzzle_piece,
                            color: AppColors.soulPrimaryLight,
                          ),
                        ),
                        items: <DropdownMenuItem<String>>[
                          DropdownMenuItem(
                            value: "Heterosexual",
                            child: Text("Heterosexual"),
                          ),
                          DropdownMenuItem(
                            value: "Homosexual",
                            child: Text("Homosexual"),
                          ),
                          DropdownMenuItem(
                            value: "Bisexual",
                            child: Text("Bisexual"),
                          ),
                          DropdownMenuItem(
                            value: "Other",
                            child: Text("Other"),
                          ),
                        ],
                        onChanged: (String? value) {
                          setState(() {
                            widget.details.sexuality = value!;
                          });
                        },
                      ),
                      _gap(),
                      //HEIGHT
                      GestureDetector(
                        onTap: () {
                          FocusScope.of(context).requestFocus(new FocusNode());
                          _showHeightPickerDialog(context);
                        },
                        child: _buildHeightWidget(_heightHasError),
                      ),
                      _gap(),
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

  /*Future<List<String>> _getAllGenders() async {
    //List<Map<String, Object?>> raw = await localProvider.getEventTypes();
    //return List.generate(raw.length, (index) => EventType.fromMap(raw[index]));
  }*/

  Widget _gap() {
    return SizedBox(
      height: 32.h,
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
          contentPadding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 4.w),
          prefixIcon: Icon(
            Icons.format_line_spacing,
            color: AppColors.soulPrimaryLight,
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
          helperText: "This is shown publicly on your profile.",
          labelText: "Height",
          contentPadding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 4.w),
          prefixIcon: Icon(
            Icons.format_line_spacing,
            color: AppColors.soulPrimaryLight,
          ),
        ),
      );
    }
  }

  Widget _buildBirthDateWidget() {
    return GestureDetector(
      child: Container(),
      onTap: () async {
        final pickedDate = await showDatePicker(
          context: context,
          initialDate: new DateTime.now(),
          firstDate: new DateTime(1920),
          lastDate: new DateTime(2100),
        );
        if (pickedDate != null && pickedDate != birthDate) {
          setState(() {
            birthDate = pickedDate;
            isDateSelected = true;
            //
            String birthDateString =
                "${birthDate.day}/${birthDate.month}/${birthDate.year}";
          });
        }
      },
    );
  }

  void _showHeightPickerDialog(BuildContext context) async {
    int pickedHeight = await showDialog(
        context: context,
        builder: (BuildContext context) => HeightPickerDialog(
              height: _height == "0" ? defaultHeight : int.tryParse(_height)!,
            ));
    if (pickedHeight != null) {
      setState(() {
        _heightIsEmpty = false;
        _height = pickedHeight.toString();
      });
    }
  }

  Widget? getHeightText() {
    if (!widget.details.isEmpty() || !(_height == "0")) {
      return Text(
        _height + " cm",
        style: TextStyle(fontSize: 16.sp),
      );
    }
    return null;
  }

  String? _validateName(String value) {
    if (value.isEmpty) return "A name is required";
    if (value.length > 40) return "Name is too long";
    return value.length < 3 ? "Name is too short" : null;
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

  String? _validateGender(String value) {
    return (value.isEmpty) ? "your gender is required" : null;
  }

  String? _validateSexuality(String value) {
    return (value.isEmpty) ? "your sexuality is required" : null;
  }

  void _returnOrFail() {
    if (formIsValid()) {
      //save the formstate and all
      _formKey.currentState!.save();
      widget.details.height = int.tryParse(_height)!;

      print("${widget.details.name}");

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
    if (value == "0" || value.isEmpty) {
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
