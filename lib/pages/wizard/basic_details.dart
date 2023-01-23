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
  bool _isDateSelected = false, _birthDayHasError = false;
  int defaultHeight = 157;
  late String _height, _birthday;
  late DateTime _birthDate = DateTime.now();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _bithdayErrorText = "";
  //late Future<List<String>> _gendersList;

  @override
  void initState() {
    super.initState();
    //_gendersList = _getAllGenders();
    _height = widget.details.height < 0 ? "" : widget.details.height.toString();
    _heightIsEmpty = widget.details.height < 0;
    _birthday = widget.details.birthday;
    _isDateSelected = widget.details.birthday.isNotEmpty;
    if (_birthday.isNotEmpty) {
      List<String> pieces = _birthday.split('/');
      _birthDate = new DateTime(
          int.parse(pieces[2]), int.parse(pieces[1]), int.parse(pieces[0]));
    }
  }

  @override
  Widget build(BuildContext context) {
    final EdgeInsets _formFieldMargin = EdgeInsets.symmetric(vertical: 8.h);

    return Scaffold(
      appBar: AppBar(
        title: Text("Basics"),
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
                      GestureDetector(
                        onTap: () {
                          FocusScope.of(context).requestFocus(new FocusNode());
                          _showBirthdatePickerDialog(context);
                        },
                        child: _buildBirthdayWidget(_birthDayHasError),
                      ),
                      _gap(),
                      //GENDER
                      DropdownButtonFormField<String>(
                        value: widget.details.gender.isEmpty
                            ? null
                            : widget.details.gender,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onTap: () {
                          FocusScope.of(context).requestFocus(new FocusNode());
                        },
                        validator: (gender) => _validateGender(gender),
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
                        value: widget.details.sexuality.isEmpty
                            ? null
                            : widget.details.sexuality,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onTap: () {
                          FocusScope.of(context).requestFocus(new FocusNode());
                        },
                        validator: (sexuality) => _validateSexuality(sexuality),
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

  void _showHeightPickerDialog(BuildContext context) async {
    int pickedHeight = await showDialog(
        context: context,
        builder: (BuildContext context) => HeightPickerDialog(
              height: _height == "" ? defaultHeight : int.tryParse(_height)!,
            ));
    if (pickedHeight > 0) {
      setState(() {
        _heightIsEmpty = false;
        _heightHasError = false;
        _height = pickedHeight.toString();
      });
    }
  }

  Widget _buildHeightWidget(bool hasError) {
    if (hasError) {
      return InputDecorator(
        isEmpty: _heightIsEmpty,
        child: getHeightText(),
        decoration: InputDecoration(
          errorText: "your height is required",
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
        isEmpty: _heightIsEmpty,
        child: getHeightText(),
        decoration: InputDecoration(
          helperText: "This is shown on your profile.",
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

  Widget? getHeightText() {
    if (_height.isNotEmpty) {
      return Text(
        _height + " cm",
        style: TextStyle(fontSize: 16.sp),
      );
    }
    return null;
  }

  void _showBirthdatePickerDialog(BuildContext context) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: _birthDate,
      firstDate: new DateTime(1920),
      lastDate: new DateTime.now(),
    );
    if (pickedDate != null && pickedDate != _birthDate) {
      setState(() {
        _birthDate = pickedDate;
        _isDateSelected = true;
        _birthDayHasError = false;
        _birthday = "${_birthDate.day}/${_birthDate.month}/${_birthDate.year}";
      });
      _validateBirthday();
    }
  }

  Widget _buildBirthdayWidget(bool hasError) {
    if (hasError) {
      return InputDecorator(
        isEmpty: !_isDateSelected,
        child: getBirthdayText(),
        decoration: InputDecoration(
          errorText: _bithdayErrorText,
          labelText: "Birthday",
          contentPadding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 4.w),
          prefixIcon: Icon(
            Icons.edit_calendar,
            color: AppColors.soulPrimaryLight,
          ),
        ),
      );
    } else {
      return InputDecorator(
        isEmpty: !_isDateSelected,
        child: getBirthdayText(),
        decoration: InputDecoration(
          helperText: "Private, only used to determine your age.",
          labelText: "Birthday",
          contentPadding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 4.w),
          prefixIcon: Icon(
            Icons.edit_calendar,
            color: AppColors.soulPrimaryLight,
          ),
        ),
      );
    }
  }

  Widget? getBirthdayText() {
    if (_birthday.isNotEmpty) {
      return Text(
        _birthday,
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

  String? _validateGender(String? value) {
    return (value == null || value.isEmpty) ? "your gender is required" : null;
  }

  String? _validateSexuality(String? value) {
    return (value == null || value.isEmpty)
        ? "your sexuality is required"
        : null;
  }

  void _returnOrFail() {
    if (formIsValid()) {
      //save the formstate and all
      _formKey.currentState!.save();
      widget.details.height = int.tryParse(_height)!;
      widget.details.birthday = _birthday;
      Navigator.pop(context, widget.details);
    }
  }

  bool formIsValid() {
    bool form, height, bday; //mutual exclusivity
    form = _formKey.currentState!.validate();
    height = _validateHeight(_height);
    bday = _validateBirthday();
    return form && height && bday;
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

  bool _validateBirthday() {
    DateTime minDate =
        DateTime.now().subtract(const Duration(days: ((365 * 18) - 5)));
    if (_birthday.isEmpty) {
      setState(() {
        _bithdayErrorText = "your birthday is required";
        _birthDayHasError = true;
      });
      return false;
    } else if (_birthDate.isAfter(minDate)) {
      setState(() {
        _bithdayErrorText = "you are too young to join, must be 18+";
        _birthDayHasError = true;
      });
      return false;
    }
    return true;
  }

  @override
  void dispose() {
    //TODO: implement dispose
    super.dispose();
  }
}
