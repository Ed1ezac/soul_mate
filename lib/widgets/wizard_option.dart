import 'package:flutter/material.dart';
import 'package:Soulmate_App/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Soulmate_App/pages/wizard/basic_details.dart';
import 'package:Soulmate_App/widgets/wizard_option_drawing.dart';
import 'package:Soulmate_App/pages/wizard/personality_details.dart';
import 'package:Soulmate_App/pages/wizard/interest_selection.dart';

class WizardOption extends StatefulWidget {
  final int position;
  final OptionState state;
  final Function(int) notifyParent;
  final ValueChanged<Object> onObjectChange;
  final ValueChanged<OptionState> onStateChange;
  final dynamic wizardObject;
  final double _activeElevation = 9.0,
      _completeElevation = 4.0,
      _inactiveElevation = 2.0;

  WizardOption({
    required this.notifyParent,
    required this.onStateChange,
    required this.onObjectChange,
    required this.position,
    required this.wizardObject,
    this.state = OptionState.INACTIVE,
  });

  @override
  WizardOptionState createState() => WizardOptionState();
}

class WizardOptionState extends State<WizardOption>
    with TickerProviderStateMixin {
  late Animation<double> _heightAnimation;
  late Animation<double> _paddingAnimation;
  late double startElevation, endElevation;
  late Animation<double> _elevationAnimation;
  late AnimationController _elevationAnimationController;
  late double _widgetHeight;

  @override
  void initState() {
    super.initState();
    _widgetHeight = 110.h;
    configureAnimations();
  }

  @override
  Widget build(BuildContext context) {
    return optionCard(context);
  }

  void configureAnimations() {
    _elevationAnimationController = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    );
    determineElevationParams();
    _elevationAnimation =
        Tween(begin: startElevation, end: endElevation).animate(
      CurvedAnimation(
        parent: _elevationAnimationController,
        curve: Interval(
          0.0,
          0.75,
          curve: Curves.elasticIn,
        ),
      ),
    );
    _heightAnimation = Tween(
      begin: 110.h,
      end: 120.h,
    ).animate(
      CurvedAnimation(
        parent: _elevationAnimationController,
        curve: Interval(
          0.7,
          1.0,
          curve: Curves.easeIn,
        ),
      ),
    );
    _paddingAnimation = Tween(
      begin: 8.w,
      end: 0.0,
    ).animate(
      CurvedAnimation(
        parent: _elevationAnimationController,
        curve: Interval(
          0.8,
          1.0,
          curve: Curves.easeIn,
        ),
      ),
    );

    if (widget.state == OptionState.COMPLETE) {
      _elevationAnimationController.reverse();
    } else {
      _elevationAnimationController.forward();
    }
  }

  void determineElevationParams() {
    switch (widget.state) {
      case OptionState.ACTIVE:
        startElevation = 3.0;
        endElevation = widget._activeElevation;
        break;
      case OptionState.INACTIVE:
        startElevation = 3.0;
        endElevation = widget._inactiveElevation;
        break;
      case OptionState.COMPLETE:
        startElevation = widget._activeElevation;
        endElevation = widget._completeElevation;
        break;
    }
  }

//=============================================================================
  Widget optionCard(BuildContext context) {
    return AnimatedBuilder(
      animation: _elevationAnimationController,
      builder: (context, child) {
        return Container(
          padding: widget.state == OptionState.ACTIVE
              ? EdgeInsets.symmetric(horizontal: _paddingAnimation.value)
              : EdgeInsets.symmetric(horizontal: 8.0),
          margin: _getWidgetMargin(),
          height: widget.state == OptionState.ACTIVE
              ? _heightAnimation.value
              : _widgetHeight,
          child: compactOptionCard(),
        );
      },
    );
  }

  EdgeInsets _getWidgetMargin() {
    if (widget.position == 1) {
      return EdgeInsets.only(top: 8.h);
    } else {
      return EdgeInsets.only(top: 16.h);
    }
  }

  Widget compactOptionCard() {
    final overlap = 20.w; //widget.state == OptionState.COMPLETE
    //? ScreenUtil().setWidth(20.w)
    //: ScreenUtil().setWidth(20.0);
    final items = [
      mainCard(),
      Container(
          height: widget.state == OptionState.COMPLETE ? 54.w : 52.w, //53
          width: widget.state == OptionState.COMPLETE ? 53.w : 48.w, //56
          child: widget.state == OptionState.COMPLETE
              ? circleWithIcon()
              : circleWithNumber()),
    ];

    List<Widget> stackLayers = List<Widget>.generate(items.length, (index) {
      return Padding(
        padding: EdgeInsets.fromLTRB(
            index < 1 ? (1 + index.toDouble()) * overlap : 0, 0, 0, 0),
        child: items[index],
      );
    });

    return Stack(alignment: Alignment.centerLeft, children: stackLayers);
  }

  Widget circleWithNumber() {
    return Card(
      shape: CircleBorder(),
      child: Center(
        child: Text(
          widget.position.toString(),
          style: TextStyle(
              color: widget.state == OptionState.ACTIVE
                  ? (AppColors.soulPrimary)
                  : Colors.grey,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget circleWithIcon() {
    return Card(
      color: AppColors.soulAccentDark,
      shape: CircleBorder(),
      child: Center(
        child: Icon(Icons.check, size: 18.w, color: Colors.white),
      ),
    );
  }

  Widget mainCard() {
    return Card(
      elevation: _elevationAnimation.value, //getOptionElevation(),
      shape: widget.state == OptionState.COMPLETE
          ? WizardOptionBorder(
              borderWidth: 2.0,
              borderColor: AppColors.soulAccentDark,
              colored: true)
          : WizardOptionBorder(),
      child: Container(
        padding: EdgeInsets.fromLTRB(36.w, 16.w, 16.w, 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  getOptionTitle(), //title
                  style: TextStyle(
                      fontSize: 18.sp,
                      color: getOptionTextColor(),
                      fontWeight: FontWeight.w600),
                ),
                getOptionAction(widget.state), //ation
              ],
            ),
            Text(
              getOptionSubText(), //subtext
              style: TextStyle(
                color: getOptionTextColor(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color getOptionTextColor() {
    switch (widget.state) {
      case OptionState.ACTIVE:
        return Colors.black;
      case OptionState.COMPLETE:
        return AppColors.soulAccentDark;
      case OptionState.INACTIVE:
        return Colors.grey;
      default:
        throw new Exception("invalid state for this option.");
    }
  }

  double getOptionElevation() {
    switch (widget.state) {
      case OptionState.ACTIVE:
        return widget._activeElevation;
      case OptionState.COMPLETE:
        return widget._completeElevation;
      case OptionState.INACTIVE:
        return widget._inactiveElevation;
      default:
        throw new Exception("invalid state for this option.");
    }
  }

  String getOptionTitle() {
    switch (widget.position) {
      case 1:
        return "Basics";
      case 2:
        return "Personality";
      case 3:
        return "Interests";
      default:
        return "";
    }
  }

  String getOptionSubText() {
    switch (widget.position) {
      case 1:
        return "Basic details about you";
      case 2:
        return "The type of person you are";
      case 3:
        return "Things you find interesting";
      default:
        return "";
    }
  }

  Widget getOptionAction(OptionState state) {
    switch (state) {
      case OptionState.ACTIVE:
      case OptionState.COMPLETE:
        return InkWell(
          borderRadius: BorderRadius.all(Radius.circular(5.w)),
          onTap: () => executeAction(),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 6.w, horizontal: 6.w),
            child: Text(
              state == OptionState.ACTIVE ? "Start" : "Edit",
              style: TextStyle(
                  fontSize: 14.sp,
                  color: state == OptionState.ACTIVE
                      ? AppColors.soulPrimaryDark
                      : AppColors.soulAccent,
                  fontWeight: FontWeight.w600),
            ),
          ),
        );
      case OptionState.INACTIVE:
        return Icon(Icons.lock, size: 16.w, color: Colors.grey);
      default:
        throw new Exception("invalid state for this option.");
    }
  }

  void executeAction() {
    switch (widget.position) {
      case 1:
        openForm(
          BasicDetails(
            details: widget.wizardObject,
          ),
        );
        break;
      case 2:
        openForm(
          PersonalityDetails(
            personality: widget.wizardObject,
          ),
        );
        break;
      case 3:
        openForm(InterestSelection(widget.wizardObject));
        break;
      default:
        throw new Exception("invalid index for this option.");
    }
  }

  void openForm(Widget formPage) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => formPage,
      ),
    );

    if (result != null) {
      _markWidgetAsCompleted(result);
    }
  }

  void _markWidgetAsCompleted(dynamic result) {
    widget.onObjectChange(result);
    widget.onStateChange(OptionState.COMPLETE);
    widget.notifyParent(widget.position);
  }

  @override
  void dispose() {
    _elevationAnimationController.dispose();
    super.dispose();
  }
}

enum OptionState { ACTIVE, INACTIVE, COMPLETE }
