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
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Interests"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () => _popOrFail(),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: 24.w,
            vertical: 32.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 8.h, bottom: 16.h),
                child: Text(
                  "Tap to pick your interests.",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Form(
                child: GestureDetector(
                  onTap: () {
                    showInterestsPicker(context);
                  },
                  child: buildInterestsWidget(),
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
          contentPadding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 4.w),
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
          helperText: "These are shown on your profile.",
          labelText: "Interests",
          contentPadding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 4.w),
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
