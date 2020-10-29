import 'package:flutter/material.dart';
import 'package:Soulmate_App/styles.dart';
import 'package:Soulmate_App/utils/widget_utils.dart';
import 'package:Soulmate_App/pages/wizard/basic_details.dart';
import 'package:Soulmate_App/widgets/wizard_option_drawing.dart';
import 'package:Soulmate_App/pages/wizard/personality_details.dart';
import 'package:Soulmate_App/pages/wizard/habits_and_interests.dart';

class WizardOption extends StatefulWidget {
  final int position;
  final OptionState state;
  final Object thisObject;
  final Function(int) notifyParent;
  final ValueChanged<Object> onObjectChange;
  final ValueChanged<OptionState> onStateChange;
  final double _activeElevation = 9.0,
      _completeElevation = 4.0,
      _inactiveElevation = 2.0;

  WizardOption({
    this.thisObject,
    this.notifyParent,
    this.onStateChange,
    this.onObjectChange,
    @required this.position,
    this.state = OptionState.INACTIVE,
  });

  @override
  WizardOptionState createState() => WizardOptionState();
}

class WizardOptionState extends State<WizardOption>
    with TickerProviderStateMixin {
  Animation<double> _heightAnimation;
  Animation<double> _paddingAnimation;
  double startElevation, endElevation;
  Animation<double> _elevationAnimation;
  AnimationController _elevationAnimationController;
  double _widgetHeight; //= screenAwareSizeV(140.0, context);

  @override
  void dispose() {
    _elevationAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _widgetHeight = screenAwareSizeV(140.0, context);
    configureAnimations();
    return optionCard(context);
  }

  void configureAnimations() {
    _elevationAnimationController = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    );
    determineElevationParams();
    _elevationAnimation = Tween(begin: startElevation, end: endElevation)
        .animate(CurvedAnimation(
            parent: _elevationAnimationController,
            curve: Interval(0.0, 0.75, curve: Curves.elasticIn)));
    _heightAnimation = Tween(
            begin: screenAwareSizeV(140.0, context),
            end: screenAwareSizeV(155.0, context))
        .animate(CurvedAnimation(
            parent: _elevationAnimationController,
            curve: Interval(0.7, 1.0, curve: Curves.easeIn)));
    _paddingAnimation = Tween(
            begin: screenAwareSizeH(8.0, context),
            end: screenAwareSizeH(0.0, context))
        .animate(CurvedAnimation(
            parent: _elevationAnimationController,
            curve: Interval(0.8, 1.0, curve: Curves.easeIn)));

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
      return EdgeInsets.only(top: screenAwareSizeV(8.0, context));
    } else {
      return EdgeInsets.only(top: screenAwareSizeV(16.0, context));
    }
  }

  Widget compactOptionCard() {
    final overlap = widget.state == OptionState.COMPLETE
        ? screenAwareSizeH(23.0, context)
        : screenAwareSizeH(24.0, context);
    final items = [
      mainCard(),
      Container(
          height: widget.state == OptionState.COMPLETE
              ? screenAwareSizeV(55.0, context)
              : screenAwareSizeV(53.0, context), //53
          width: widget.state == OptionState.COMPLETE
              ? screenAwareSizeH(55.0, context)
              : screenAwareSizeH(56.0, context), //56
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
              fontSize: 18.0,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget circleWithIcon() {
    return Card(
      color: AppColors.soulAccentDark,
      shape: CircleBorder(), //(side: BorderSide(color: Colors.grey)),
      //elevation: _activeElevation,
      child: Center(
        child: Icon(Icons.check, size: 18.0, color: Colors.white),
      ),
    );
  }

  Widget mainCard() {
    /*if (widget.state == OptionState.ACTIVE) {
      _widgetHeight = 150.0;
    }*/
    return Card(
      elevation: _elevationAnimation.value, //getOptionElevation(),
      shape: widget.state == OptionState.COMPLETE
          ? WizardOptionBorder(
              borderWidth: 2.0,
              borderColor: AppColors.soulAccentDark,
              colored: true)
          : WizardOptionBorder(),
      child: Container(
        padding: EdgeInsets.fromLTRB(
            screenAwareSizeH(36.0, context),
            screenAwareSizeV(16.0, context),
            screenAwareSizeH(16.0, context),
            screenAwareSizeH(16.0, context)),
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
                      fontSize: 18.0,
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
        return Colors.grey[400];
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
        return "Habits & Interests";
      default:
        return "";
    }
  }

  String getOptionSubText() {
    switch (widget.position) {
      case 1:
        return "Basic details about you";
      case 2:
        return "The kind of person you are";
      case 3:
        return "Things you find interesting";
      default:
        return "";
    }
  }

  Widget getOptionAction(OptionState state) {
    switch (state) {
      case OptionState.ACTIVE:
        return InkWell(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          onTap: () => executeAction(),
          child: Container(
            padding: EdgeInsets.symmetric(
                vertical: screenAwareSizeV(6.0, context),
                horizontal: screenAwareSizeH(6.0, context)),
            child: Text(
              "Start",
              style: TextStyle(
                  fontSize: 14.0,
                  color: AppColors.soulPrimaryDark,
                  fontWeight: FontWeight.w600),
            ),
          ),
        );
      case OptionState.COMPLETE:
        return InkWell(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          onTap: () => executeAction(),
          child: Container(
            padding: EdgeInsets.symmetric(
                vertical: screenAwareSizeV(6.0, context),
                horizontal: screenAwareSizeH(6.0, context)),
            child: Text(
              "Edit",
              style: TextStyle(
                  fontSize: 14.0,
                  color: AppColors.soulAccent,
                  fontWeight: FontWeight.w600),
            ),
          ),
        );
      case OptionState.INACTIVE:
        return Icon(Icons.lock, size: 18.0, color: Colors.grey);
      default:
        throw new Exception("invalid state for this option.");
    }
  }

  void executeAction() {
    switch (widget.position) {
      case 1:
        openBasicsForm();
        break;
      case 2:
        openPersonalityForm();
        break;
      case 3:
        openInterestsForm();
        break;
      default:
        throw new Exception("invalid index for this option.");
    }
  }

  void openBasicsForm() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => BasicDetails(
          details: widget.thisObject,
        ),
      ),
    );

    if (result != null) {
      widget.onObjectChange(result);
      widget.onStateChange(OptionState.COMPLETE);
      widget.notifyParent(widget.position);
    }
  }

  void openPersonalityForm() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => PersonalityDetails(
          personality: widget.thisObject,
        ),
      ),
    );

    if (result != null) {
      widget.onObjectChange(result);
      widget.onStateChange(OptionState.COMPLETE);
      widget.notifyParent(widget.position);
    }
  }

  void openInterestsForm() {
    Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => HabitsAndInterests(),
      ),
    );
  }
}

enum OptionState { ACTIVE, INACTIVE, COMPLETE }
