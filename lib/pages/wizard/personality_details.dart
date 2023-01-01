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
  late int selectedExtroversion = 1, selectedExtroversionType;
  late int selectedLoveExpression;
  bool isExtrovert = false;
  String extroversion = "introvert";
  late String errorMessage;

  @override
  void initState() {
    super.initState();
    if (!widget.personality.isEmpty()) {
      selectedExtroversion = widget.personality.extroversion;
      selectedExtroversionType = widget.personality.extroversionType;
      selectedLoveExpression = widget.personality.loveExpression;

      if (selectedExtroversion % 2 == 0) {
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
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () => _returnORFail(context),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(
                    vertical: ScreenUtil().setHeight(16.0)),
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(
                        top: ScreenUtil().setHeight(8.0),
                        bottom: ScreenUtil().setHeight(8.0),
                        left: ScreenUtil().setWidth(32.0),
                        right: ScreenUtil().setWidth(16.0)),
                    child: Text(
                      "Your personality is modelled using two aspects, your intro/extro-version and your love" +
                          " expression. The first aspect is shown publicly on your profile while the second can only" +
                          " be seen by your matches. While you may possess traits asscociated with most options, you" +
                          " are required to choose the one option that closely describes you.",
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(16.0),
                          fontWeight: FontWeight.w700),
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
                    indent: ScreenUtil().setWidth(32.0),
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
                  Divider(
                    indent: ScreenUtil().setWidth(32.0),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: ScreenUtil().setWidth(32.0)),
                    child: Text(
                      "Type of $extroversion",
                      style: TextStyle(
                          fontSize: (18.0), fontWeight: FontWeight.w600),
                    ),
                  ),
                  isExtrovert
                      ? extrovertTypeRadioGroup()
                      : introvertTypeRadioGroup(),
                  Divider(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.symmetric(
                            horizontal: ScreenUtil().setWidth(32.0)),
                        child: Text(
                          "Love Expression",
                          style: TextStyle(
                              fontSize: ScreenUtil().setSp(18.0),
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: ScreenUtil().setWidth(32.0),
                            right: ScreenUtil().setWidth(16.0),
                            bottom: ScreenUtil().setHeight(8.0)),
                        child: Text(
                          "A love expression is the way someone expresses love. Out of the five expressions," +
                              " one is always more dominant for each individual. Learning yours and your" +
                              " partner's love expression can help create a stronger bond in your relationship.",
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(15.0),
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
                      setSelectedRadioTile(val, 3);
                    },
                    activeColor: AppColors.soulPrimary,
                    selected:
                        selectedLoveExpression == PersonalityUtils.GIFTING,
                  ),
                  Divider(
                    indent: ScreenUtil().setWidth(32.0),
                  ),
                  RadioListTile(
                    value: PersonalityUtils.HELPFULNESS,
                    groupValue: selectedLoveExpression,
                    title: Text(PersonalityUtils.HELPFULNESS_TITLE),
                    subtitle: Text(PersonalityUtils.HELPFULNESS_TIP),
                    onChanged: (val) {
                      setSelectedRadioTile(val, 3);
                    },
                    activeColor: AppColors.soulPrimary,
                    selected:
                        selectedLoveExpression == PersonalityUtils.HELPFULNESS,
                  ),
                  Divider(
                    indent: ScreenUtil().setWidth(32.0),
                  ),
                  RadioListTile(
                    value: PersonalityUtils.VERBAL_AFFECTION,
                    groupValue: selectedLoveExpression,
                    title: Text(PersonalityUtils.VERBAL_AFFECTION_TITLE),
                    subtitle: Text(PersonalityUtils.VERBAL_AFFECTION_TIP),
                    onChanged: (val) {
                      setSelectedRadioTile(val, 3);
                    },
                    activeColor: AppColors.soulPrimary,
                    selected: selectedLoveExpression ==
                        PersonalityUtils.VERBAL_AFFECTION,
                  ),
                  Divider(
                    indent: ScreenUtil().setWidth(32.0),
                  ),
                  RadioListTile(
                    value: PersonalityUtils.BODILY_AFFECTION,
                    groupValue: selectedLoveExpression,
                    title: Text(PersonalityUtils.BODILY_AFFECTION_TITLE),
                    subtitle: Text(PersonalityUtils.BODILY_AFFECTION_TIP),
                    onChanged: (val) {
                      setSelectedRadioTile(val, 3);
                    },
                    activeColor: AppColors.soulPrimary,
                    selected: selectedLoveExpression ==
                        PersonalityUtils.BODILY_AFFECTION,
                  ),
                  Divider(
                    indent: ScreenUtil().setWidth(32.0),
                  ),
                  RadioListTile(
                    value: PersonalityUtils.PRIORITIZING_TIME,
                    groupValue: selectedLoveExpression,
                    title: Text(PersonalityUtils.PRIORITIZING_TIME_TITLE),
                    subtitle: Text(PersonalityUtils.PRIORITIZING_TIME_TIP),
                    onChanged: (val) {
                      setSelectedRadioTile(val, 3);
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
          selectedExtroversionType = val;
        });
        break;
      case 3:
        setState(() {
          selectedLoveExpression = val;
        });
        break;
    }
  }

  Widget introvertTypeRadioGroup() {
    return Container(
      margin: EdgeInsets.only(left: ScreenUtil().setWidth(56.0)),
      child: Column(
        children: <Widget>[
          RadioListTile(
            value: PersonalityUtils.SOCIAL_INTROVERT,
            groupValue: selectedExtroversionType,
            title: Text(PersonalityUtils.SOCIAL_INTROVERT_TITLE),
            subtitle: Text(PersonalityUtils.SOCIAL_INTROVERT_TIP),
            onChanged: (val) {
              setSelectedRadioTile(val, 2);
            },
            activeColor: AppColors.soulPrimary,
            selected:
                selectedExtroversionType == PersonalityUtils.SOCIAL_INTROVERT,
          ),
          Divider(
            indent: ScreenUtil().setWidth(64.0),
          ),
          RadioListTile(
            value: PersonalityUtils.THINKING_INTROVERT,
            groupValue: selectedExtroversionType,
            title: Text(PersonalityUtils.THINKING_INTROVERT_TITLE),
            subtitle: Text(PersonalityUtils.THINKING_INTROVERT_TIP),
            onChanged: (val) {
              setSelectedRadioTile(val, 2);
            },
            activeColor: AppColors.soulPrimary,
            selected:
                selectedExtroversionType == PersonalityUtils.THINKING_INTROVERT,
          ),
          Divider(
            indent: ScreenUtil().setWidth(64.0),
          ),
          RadioListTile(
            value: PersonalityUtils.ANXIOUS_INTROVERT,
            groupValue: selectedExtroversionType,
            title: Text(PersonalityUtils.ANXIOUS_INTROVERT_TITLE),
            subtitle: Text(PersonalityUtils.ANXIOUS_INTROVERT_TIP),
            onChanged: (val) {
              setSelectedRadioTile(val, 2);
            },
            activeColor: AppColors.soulPrimary,
            selected:
                selectedExtroversionType == PersonalityUtils.ANXIOUS_INTROVERT,
          ),
          Divider(
            indent: ScreenUtil().setWidth(64.0),
          ),
          RadioListTile(
            value: PersonalityUtils.RESTRAINED_INTROVERT,
            groupValue: selectedExtroversionType,
            title: Text(PersonalityUtils.RESTRAINED_INTROVERT_TITLE),
            subtitle: Text(PersonalityUtils.RESTRAINED_INTROVERT_TIP),
            onChanged: (val) {
              setSelectedRadioTile(val, 2);
            },
            activeColor: AppColors.soulPrimary,
            selected: selectedExtroversionType ==
                PersonalityUtils.RESTRAINED_INTROVERT,
          ),
        ],
      ),
    );
  }

  Widget extrovertTypeRadioGroup() {
    return Container(
      margin: EdgeInsets.only(left: ScreenUtil().setWidth(56.0)),
      child: Column(
        children: <Widget>[
          RadioListTile(
            value: PersonalityUtils.EXTROVERTED_FEELER,
            groupValue: selectedExtroversionType,
            title: Text(PersonalityUtils.EXTROVERTED_FEELER_TITLE),
            subtitle: Text(PersonalityUtils.EXTROVERTED_FEELER_TIP),
            onChanged: (val) {
              setSelectedRadioTile(val, 2);
            },
            activeColor: AppColors.soulPrimary,
            selected:
                selectedExtroversionType == PersonalityUtils.EXTROVERTED_FEELER,
          ),
          Divider(
            indent: ScreenUtil().setWidth(64.0),
          ),
          RadioListTile(
            value: PersonalityUtils.EXTROVERTED_SENSORS,
            groupValue: selectedExtroversionType,
            title: Text(PersonalityUtils.EXTROVERTED_SENSORS_TITLE),
            subtitle: Text(PersonalityUtils.EXTROVERTED_SENSORS_TIP),
            onChanged: (val) {
              setSelectedRadioTile(val, 2);
            },
            activeColor: AppColors.soulPrimary,
            selected: selectedExtroversionType ==
                PersonalityUtils.EXTROVERTED_SENSORS,
          ),
          Divider(
            indent: ScreenUtil().setWidth(64.0),
          ),
          RadioListTile(
            value: PersonalityUtils.EXTROVERTED_THINKERS,
            groupValue: selectedExtroversionType,
            title: Text(PersonalityUtils.EXTROVERTED_THINKERS_TITLE),
            subtitle: Text(PersonalityUtils.EXTROVERTED_THINKERS_TIP),
            onChanged: (val) {
              setSelectedRadioTile(val, 2);
            },
            activeColor: AppColors.soulPrimary,
            selected: selectedExtroversionType ==
                PersonalityUtils.EXTROVERTED_THINKERS,
          ),
          Divider(
            indent: ScreenUtil().setWidth(64.0),
          ),
          RadioListTile(
            value: PersonalityUtils.EXTROVERTED_INTUITORS,
            groupValue: selectedExtroversionType,
            title: Text(PersonalityUtils.EXTROVERTED_INTUITORS_TITLE),
            subtitle: Text(PersonalityUtils.EXTROVERTED_INTUITORS_TIP),
            onChanged: (val) {
              setSelectedRadioTile(val, 2);
            },
            activeColor: AppColors.soulPrimary,
            selected: selectedExtroversionType ==
                PersonalityUtils.EXTROVERTED_INTUITORS,
          ),
        ],
      ),
    );
  }

  void _returnORFail(BuildContext context) {
    if (_isValid(context)) {
      widget.personality.extroversion = selectedExtroversion;
      widget.personality.extroversionType = selectedExtroversionType;
      widget.personality.loveExpression = selectedLoveExpression;
      Navigator.pop(context, widget.personality);
    } else {
      _showErrorSnackbar(context);
    }
  }

  bool _isValid(BuildContext context) {
    bool isValid = true;

    if (selectedExtroversionType == null) {
      //setError
      errorMessage = "select a type of introvert/extrovert";
      isValid = false;
    } else if (isExtrovert && (selectedExtroversionType % 2 != 0)) {
      //extro selected intro-type
      errorMessage = "select a type of extrovert";
      isValid = false;
    } else if (!isExtrovert && (selectedExtroversionType % 2 != 1)) {
      //introvert selected extro-type
      errorMessage = "select a type of introvert";
      isValid = false;
    }
    if (selectedLoveExpression == null) {
      if (!isValid) {
        errorMessage = errorMessage + "\nselect a love expression";
      } else {
        errorMessage = "select a love expression";
        isValid = false;
      }
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
