import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Soulmate_App/models/user_basic_details.dart';
import 'package:Soulmate_App/models/form_progress_observer.dart';
import 'package:Soulmate_App/models/user_habits_and_interests.dart';
import 'package:Soulmate_App/models/user_personality.dart';
import 'package:Soulmate_App/utils/widget_utils.dart';
import 'package:Soulmate_App/widgets/wizard_option.dart';
import '../../styles.dart';

class ProfileWizard extends StatefulWidget {
  @override
  WizardState createState() => WizardState();
}

class WizardState extends State<ProfileWizard>
    with SingleTickerProviderStateMixin {
  UserBasicDetails details = UserBasicDetails();
  UserPersonality personality = UserPersonality();
  UserHabitsAndInterests habitsAndInterests = UserHabitsAndInterests();
  FormProgressObserver _observer;
  AnimationController _fabFloatUpController;
  Animation<double> _fabFloatUpAnimation;
  OptionState basicsState = OptionState.COMPLETE, //OptionState.ACTIVE
      personalityState = OptionState.COMPLETE, //OptionState.INACTIVE
      interestsState = OptionState.ACTIVE;
  bool _isWizardComplete = false;

  FloatingActionButton advanceButton;

  @override
  initState() {
    super.initState();
    _observer = FormProgressObserver();
    _fabFloatUpController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));

    _fabFloatUpController.forward();
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
                            thisObject: habitsAndInterests,
                            onStateChange: (state) => interestsState = state,
                            onObjectChange: (result) =>
                                habitsAndInterests = result);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: _isWizardComplete ? _showFab(context) : null,
      ),
    );
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
        _flagProfileCreationComplete();
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

  void _flagProfileCreationComplete() {
    _observer.registerProgess();

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _isWizardComplete = true;
      });
    });
  }

  Widget _showFab(BuildContext context) {
    _fabFloatUpAnimation = Tween<double>(
      begin:
          MediaQuery.of(context).size.height + screenAwareSizeV(56.0, context),
      end: 0.0,
    ).animate(
      CurvedAnimation(parent: _fabFloatUpController, curve: Curves.bounceInOut),
    );

    // return SlideTransition(
    //   position: Offset(0.0, _fabFloatUpAnimation.value),
    //   child: advanceFab(),
    // );

    // return Transform.translate(
    //   offset: _fabFloatUpAnimation.value,
    //   child: advanceButton,
    // );

    return Transform(
      transform:
          Matrix4.translationValues(0.0, _fabFloatUpAnimation.value, 0.0),
      child: advanceFab(),
    );
  }

  Widget advanceFab() {
    return Container(
      child: FloatingActionButton.extended(
        onPressed: () {},
        label: Text("Create"),
      ),
    );
  }

  void createUserProfile() {
    //to create a profile we need to:

    //persistDataLocally();
    //createRecordOnFirebase();
  }

  @override
  void dispose() {
    super.dispose();
    _fabFloatUpController.dispose();
  }
}
