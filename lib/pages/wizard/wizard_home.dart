import 'package:Soulmate_App/pages/app/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Soulmate_App/models/user.dart';
import 'package:Soulmate_App/models/form_progress_observer.dart';
import 'package:Soulmate_App/models/user_interests.dart';
import 'package:Soulmate_App/models/user_personality.dart';
import 'package:Soulmate_App/widgets/wizard_option.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../styles.dart';

class ProfileWizard extends StatefulWidget {
  @override
  WizardState createState() => WizardState();
}

class WizardState extends State<ProfileWizard>
    with SingleTickerProviderStateMixin {
  User details =
      User(name: "", birthday: "", sexuality: "", height: -1, gender: "");
  UserPersonality personality = UserPersonality(-1, -1);
  UserInterests interests = UserInterests(interests: []);
  late FormProgressObserver _observer;
  late AnimationController _fabFloatUpController;
  late Animation<double> _fabFloatUpAnimation;
  OptionState basicsState = OptionState.ACTIVE,
      personalityState = OptionState.INACTIVE, //
      interestsState = OptionState.INACTIVE;
  bool _isWizardComplete = false;

  late FloatingActionButton advanceButton;

  @override
  initState() {
    super.initState();
    _observer = FormProgressObserver();
    _fabFloatUpController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));
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
                      top: 32.h,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          width: 75.w,
                          height: 75.w,
                          margin: EdgeInsets.only(
                            bottom: 8.h,
                          ),
                          child: Icon(
                            Icons.person_add,
                            size: 70.w,
                            color: AppColors.soulPrimaryLight,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                            vertical: 8.h,
                            horizontal: 16.w,
                          ),
                          child: Text(
                            "Help us find a match for you by" +
                                " creating your profile in just a few steps.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20.sp,
                              color: Colors.black54,
                              fontWeight: FontWeight.w600,
                            ),
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
                  vertical: 8.h,
                ),
                child: ListView(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.w,
                  ),
                  children: <Widget>[
                    Consumer<FormProgressObserver>(
                      builder: (context, progressObserver, child) {
                        return WizardOption(
                          position: 1,
                          state: basicsState,
                          notifyParent: updateParent,
                          onStateChange: (state) => basicsState = state,
                          wizardObject: details,
                          onObjectChange: (infoObject) =>
                              details = infoObject as User,
                        );
                      },
                    ),
                    Consumer<FormProgressObserver>(
                      builder: (context, progressObserver, child) {
                        return WizardOption(
                          position: 2,
                          state: personalityState,
                          notifyParent: updateParent,
                          wizardObject: personality,
                          onStateChange: (state) => personalityState = state,
                          onObjectChange: (result) =>
                              personality = result as UserPersonality,
                        );
                      },
                    ),
                    Consumer<FormProgressObserver>(
                      builder: (context, progressObserver, child) {
                        return WizardOption(
                            position: 3,
                            state: interestsState,
                            notifyParent: updateParent,
                            wizardObject: interests,
                            onStateChange: (state) => interestsState = state,
                            onObjectChange: (result) =>
                                interests = result as UserInterests);
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

    Future.delayed(const Duration(milliseconds: 400), () {
      setState(() {
        _isWizardComplete = true;
      });
    });
  }

  Widget _showFab(BuildContext context) {
    _fabFloatUpAnimation = Tween<double>(
      begin: 1.sh,
      end: 1.sh - 56.h,
    ).animate(
      CurvedAnimation(parent: _fabFloatUpController, curve: Curves.ease),
    );

    return advanceFab();
    /*Transform(
      transform: Matrix4.translationValues(
        0,
        _fabFloatUpAnimation.value,
        0,
      ),
      child: advanceFab(),
    );
    */
  }

  Widget advanceFab() {
    return Container(
      margin: EdgeInsets.only(top: _fabFloatUpAnimation.value),
      child: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Home(),
            ),
          );
        },
        label: Text(
          "Create",
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  void createUserProfile() {
    //to create a profile we need to:
    //persistDataLocally();
    //createRecordOnServer();
  }

  @override
  void dispose() {
    super.dispose();
    _fabFloatUpController.dispose();
  }
}
