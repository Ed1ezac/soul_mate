import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soul_mate/models/user_basic_details.dart';
import 'package:soul_mate/models/form_progress_observer.dart';
import 'package:soul_mate/models/user_personality.dart';
import 'package:soul_mate/utils/widget_utils.dart';
import 'package:soul_mate/widgets/wizard_option.dart';

import '../../styles.dart';

class ProfileWizard extends StatefulWidget {
  @override
  WizardState createState() => WizardState();
}

class WizardState extends State<ProfileWizard> {
  UserBasicDetails details = UserBasicDetails();
  UserPersonality personality = UserPersonality();
  FormProgressObserver _observer;
  OptionState basicsState = OptionState.ACTIVE,
      personalityState = OptionState.INACTIVE,
      interestsState = OptionState.INACTIVE;

  @override
  initState() {
    super.initState();
    _observer = FormProgressObserver();
  }

  void updateParent(int updaterPosition) {
    switch (updaterPosition) {
      case 1:
        updateNextChild(updaterPosition);
        break;
      case 2:
        updateNextChild(updaterPosition);
        break;
      case 3:
        _showNextFab();
        break;
      default:
        throw Exception(
            "Invalid child index/position attempted to update parent.");
    }
  }

  void updateNextChild(int currentPosition) {
    int nextPosition = currentPosition + 1;
    switch (nextPosition) {
      case 2:
        if (personalityState != OptionState.COMPLETE) {
          personalityState = OptionState.ACTIVE;
          _observer.registerProgess();
        }
        break;
      case 3:
        if (interestsState != OptionState.COMPLETE) {
          interestsState = OptionState.ACTIVE;
          _observer.registerProgess();
        }
        break;
      default:
        throw Exception("Attempt to update child at invalid index/position.");
    }
  }

  void _showNextFab() {
    //onclick
    createUserProfile();
  }

  void createUserProfile() {
    //to create a profile we need to:

    //persistDataLocally();
    //createRecordOnFirebase();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FormProgressObserver>.value(
      value: _observer,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Align(
                alignment: Alignment.center,
                child: SafeArea(
                  child: Container(
                    margin: EdgeInsets.only(
                      top: screenAwareSizeV(32.0, context),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          width: screenAwareSizeH(75.0, context),
                          height: screenAwareSizeV(75.0, context),
                          margin: EdgeInsets.only(bottom: 8.0),
                          child: Icon(
                            Icons.person_add,
                            size: 70.0,
                            color: AppColors.soulPrimaryLight,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 8.0),
                          child: Text(
                            "Hi Eddie, help us find matches for you by" +
                                " creating your profile in just a few steps.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                color: AppColors.soulPrimaryLight,
                padding: EdgeInsets.symmetric(
                    vertical: screenAwareSizeV(8.0, context)),
                child: ListView(
                  //shrinkWrap: true,
                  padding: EdgeInsets.symmetric(
                      horizontal: screenAwareSizeH(8.0, context)),
                  children: <Widget>[
                    Consumer<FormProgressObserver>(
                      builder: (context, progressObserver, child) {
                        return WizardOption(
                          position: 1,
                          state: basicsState,
                          thisObject: details,
                          notifyParent: updateParent,
                          onStateChange: (state) => basicsState = state,
                          onObjectChange: (infoObject) => details = infoObject,
                        );
                      },
                    ),
                    Consumer<FormProgressObserver>(
                      builder: (context, progressObserver, child) {
                        return WizardOption(
                          position: 2,
                          state: personalityState,
                          thisObject: personality,
                          notifyParent: updateParent,
                          onStateChange: (state) => personalityState = state,
                          onObjectChange: (result) => personality = result,
                        );
                      },
                    ),
                    Consumer<FormProgressObserver>(
                      builder: (context, progressObserver, child) {
                        return WizardOption(
                          position: 3,
                          state: interestsState,
                          notifyParent: updateParent,
                          onStateChange: (state) => interestsState = state,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
