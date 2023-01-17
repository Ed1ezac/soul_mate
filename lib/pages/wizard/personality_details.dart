import 'package:flutter/material.dart';
import 'package:Soulmate_App/models/user_personality.dart';
import 'package:Soulmate_App/utils/user_personality_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../styles.dart';

class PersonalityDetails extends StatefulWidget {
  final UserPersonality personality;
  PersonalityDetails({required this.personality});

  @override
  PersonalityDetailsState createState() => PersonalityDetailsState();
}

class PersonalityDetailsState extends State<PersonalityDetails> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  late int selectedExtroversion = 1;
  late int selectedLoveExpression;
  bool isExtrovert = false;
  String extroversion = "introvert";
  late String errorMessage;

  @override
  void initState() {
    super.initState();
    if (!widget.personality.isEmpty()) {
      selectedExtroversion = widget.personality.extroversion;
      selectedLoveExpression = widget.personality.loveExpression;

      if (selectedExtroversion == 2) {
        isExtrovert = true;
        extroversion = "extrovert";
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Personality"),
        backgroundColor: AppColors.soulPrimary,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () => _returnOrFail(context),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(vertical: 16.h),
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(
                        top: 8.h, bottom: 8.h, left: 32.w, right: 16.w),
                    child: Text(
                      "Your personality is modelled using two aspects, your" +
                          " Introversion/Extroversion and your Affection Trait. The first aspect" +
                          " is shown on your profile while the second can only be seen" +
                          " by your matches. Please choose the option that closely describes you.",
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.w600),
                    ),
                  ),
                  RadioListTile(
                    value: PersonalityUtils.INTROVERT,
                    groupValue: selectedExtroversion,
                    title: Text("Introvert"),
                    subtitle: Text(
                        "Introverts are people who usually prefer time alone and few friends."),
                    onChanged: (val) {
                      setSelectedRadioTile(val, 1);
                    },
                    activeColor: AppColors.soulPrimary,
                    selected: !isExtrovert,
                  ),
                  Divider(
                    indent: 32.w,
                  ),
                  RadioListTile(
                    value: PersonalityUtils.EXTROVERT,
                    groupValue: selectedExtroversion,
                    title: Text("Extrovert"),
                    subtitle: Text(
                        "Exroverts are the opposite of introvets and usually prefer socializing and numerous friends."),
                    onChanged: (val) {
                      setSelectedRadioTile(val, 1);
                    },
                    activeColor: AppColors.soulPrimary,
                    selected: isExtrovert,
                  ),
                  Divider(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.symmetric(horizontal: 32.w),
                        child: Text(
                          "Affection Trait",
                          style: TextStyle(
                              fontSize: 18.sp, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: 32.w, right: 16.w, bottom: 8.h),
                        child: Text(
                          "An affection trait is the way someone prefers to receive and show their love. Out of" +
                              " the five traits, one is always more dominant for each individual. Knowing" +
                              " yours and your date's trait can help create a stronger bond.",
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Theme.of(context).hintColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  RadioListTile(
                    value: PersonalityUtils.GIFTING,
                    groupValue: selectedLoveExpression,
                    title: Text(PersonalityUtils.GIFTING_TITLE),
                    subtitle: Text(PersonalityUtils.GIFTING_TIP),
                    onChanged: (val) {
                      setSelectedRadioTile(val, 2);
                    },
                    activeColor: AppColors.soulPrimary,
                    selected:
                        selectedLoveExpression == PersonalityUtils.GIFTING,
                  ),
                  Divider(
                    indent: 32.w,
                  ),
                  RadioListTile(
                    value: PersonalityUtils.HELPFULNESS,
                    groupValue: selectedLoveExpression,
                    title: Text(PersonalityUtils.HELPFULNESS_TITLE),
                    subtitle: Text(PersonalityUtils.HELPFULNESS_TIP),
                    onChanged: (val) {
                      setSelectedRadioTile(val, 2);
                    },
                    activeColor: AppColors.soulPrimary,
                    selected:
                        selectedLoveExpression == PersonalityUtils.HELPFULNESS,
                  ),
                  Divider(
                    indent: 32.w,
                  ),
                  RadioListTile(
                    value: PersonalityUtils.VERBAL_AFFECTION,
                    groupValue: selectedLoveExpression,
                    title: Text(PersonalityUtils.VERBAL_AFFECTION_TITLE),
                    subtitle: Text(PersonalityUtils.VERBAL_AFFECTION_TIP),
                    onChanged: (val) {
                      setSelectedRadioTile(val, 2);
                    },
                    activeColor: AppColors.soulPrimary,
                    selected: selectedLoveExpression ==
                        PersonalityUtils.VERBAL_AFFECTION,
                  ),
                  Divider(
                    indent: 32.w,
                  ),
                  RadioListTile(
                    value: PersonalityUtils.BODILY_AFFECTION,
                    groupValue: selectedLoveExpression,
                    title: Text(PersonalityUtils.BODILY_AFFECTION_TITLE),
                    subtitle: Text(PersonalityUtils.BODILY_AFFECTION_TIP),
                    onChanged: (val) {
                      setSelectedRadioTile(val, 2);
                    },
                    activeColor: AppColors.soulPrimary,
                    selected: selectedLoveExpression ==
                        PersonalityUtils.BODILY_AFFECTION,
                  ),
                  Divider(
                    indent: 32.w,
                  ),
                  RadioListTile(
                    value: PersonalityUtils.PRIORITIZING_TIME,
                    groupValue: selectedLoveExpression,
                    title: Text(PersonalityUtils.PRIORITIZING_TIME_TITLE),
                    subtitle: Text(PersonalityUtils.PRIORITIZING_TIME_TIP),
                    onChanged: (val) {
                      setSelectedRadioTile(val, 2);
                    },
                    activeColor: AppColors.soulPrimary,
                    selected: selectedLoveExpression ==
                        PersonalityUtils.PRIORITIZING_TIME,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void setSelectedRadioTile(val, int group) {
    switch (group) {
      case 1:
        setState(() {
          selectedExtroversion = val;
          extroversion = val == 1 ? "introvert" : "extrovert";
          isExtrovert = !(val == 1);
        });
        break;
      case 2:
        setState(() {
          selectedLoveExpression = val;
        });
        break;
      default:
        throw Exception(
            "Attempt to update radio selection using invalid group no.");
    }
  }

  void _returnOrFail(BuildContext context) {
    if (_isValid(context)) {
      widget.personality.extroversion = selectedExtroversion;
      widget.personality.loveExpression = selectedLoveExpression;
      Navigator.pop(context, widget.personality);
    } else {
      _showErrorSnackbar(context);
    }
  }

  bool _isValid(BuildContext context) {
    bool isValid = true;
    if (selectedLoveExpression < 0) {
      errorMessage = "please select an affection trait";
      isValid = false;
    }
    return isValid;
  }

  void _showErrorSnackbar(BuildContext context) {
    final snackbar = SnackBar(
      content: Text(errorMessage),
      backgroundColor: Theme.of(context).errorColor,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}
