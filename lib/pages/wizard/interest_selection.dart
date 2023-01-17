import 'package:flutter/material.dart';
import 'package:Soulmate_App/models/user_interests.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Soulmate_App/widgets/interests_picker.dart';
import '../../styles.dart';

class InterestSelection extends StatefulWidget {
  final UserInterests interests;

  InterestSelection(this.interests);

  @override
  _InterestSelectionState createState() => _InterestSelectionState();
}

class _InterestSelectionState extends State<InterestSelection> {
  List<String> _pickedInterests = [];
  bool _interestsIsEmpty = true, _interestsHasError = false;
  late String interestsErrorText;

  @override
  initState() {
    super.initState();
    if (!widget.interests.isEmpty()) {
      _pickedInterests.addAll(widget.interests.interests);
      _interestsIsEmpty = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final EdgeInsets _formFieldPadding = EdgeInsets.symmetric(
        vertical: 0.0, horizontal: ScreenUtil().setWidth(32.0));
    final EdgeInsets _formFieldMargin = EdgeInsets.only(
        top: ScreenUtil().setHeight(8.0), bottom: ScreenUtil().setHeight(16.0));

    return Scaffold(
      appBar: AppBar(
        title: Text("Your Interests"),
        backgroundColor: AppColors.soulPrimary,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () => _popOrFail(),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(left: 8.w, right: 8.w, bottom: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: _formFieldPadding,
                margin: _formFieldMargin,
                child: Text(
                  "Your interests are shown on your profile.",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Form(
                child: Container(
                  padding: _formFieldPadding,
                  margin: _formFieldMargin,
                  child: GestureDetector(
                    onTap: () {
                      showInterestsPicker(context);
                    },
                    child: buildInterestsWidget(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _popOrFail() {
    if (_formIsValid()) {
      widget.interests.interests = _pickedInterests;
      //pop!
      Navigator.pop(context, widget.interests);
    } else {
      //display errors
      setState(() {});
    }
  }

  bool _formIsValid() {
    bool isValid = true;
    if (_pickedInterests.isEmpty) {
      isValid = false;
      _interestsHasError = true;
      interestsErrorText = "you need to pick some interests.";
    } else if (_pickedInterests.length < 6) {
      isValid = false;
      _interestsHasError = true;
      interestsErrorText = "you must pick at least 6 interests.";
    }

    return isValid;
  }

  Widget buildInterestsWidget() {
    if (_interestsHasError) {
      return InputDecorator(
        isEmpty: _interestsIsEmpty,
        child: _getInterestsText(),
        decoration: InputDecoration(
          errorText: interestsErrorText,
          labelText: "Interests",
          contentPadding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 4.w),
          prefixIcon: Icon(
            Icons.beach_access,
            color: AppColors.soulPrimary,
          ),
        ),
      );
    } else {
      return InputDecorator(
        isEmpty: _interestsIsEmpty,
        child: _getInterestsText(),
        decoration: InputDecoration(
          helperMaxLines: 2,
          helperText: "Shown on your profile. Choose 6",
          labelText: "Interests",
          prefixIcon: Icon(
            Icons.beach_access,
            color: AppColors.soulPrimary,
          ),
        ),
      );
    }
  }

  Widget? _getInterestsText() {
    if (_pickedInterests.isNotEmpty) {
      String items = "";
      for (int i = 0; i < _pickedInterests.length; i++) {
        items += i != _pickedInterests.length - 1
            ? _pickedInterests[i] + ", "
            : _pickedInterests[i];
      }
      return Text(
        items,
        style: TextStyle(fontSize: 16.sp),
      );
    }

    return null;
  }

  //------Dialogs
  /*void showHabitsPicker(BuildContext context) async {
    bool hasItems = await showDialog(
        context: context,
        builder: (context) => HabitPicker(pickedHabits: _pickedHabits));

    if (hasItems != null) {
      setState(() {
        _habitsIsEmpty = !hasItems;
      });
    }
  }*/

  void showInterestsPicker(BuildContext context) async {
    bool hasItems = await showDialog(
        context: context,
        builder: (context) =>
            InterestsPicker(pickedInterests: _pickedInterests));

    if (hasItems) {
      setState(() {
        _interestsIsEmpty = !hasItems;
      });
    }
  }
  //-
}
