import 'package:Soulmate_App/widgets/slider_handler_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles.dart';

class FilterDialog extends StatefulWidget {
  @override
  _FilterDialogState createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  double _mDistance = 3000;
  int _mSelectedGender = 1;
  double minAge = 18, minHeight = 80;
  double maxAge = 48, maxHeight = 210, maxDistance = 10000;
  RangeValues _mHeightRange = RangeValues(140, 170);
  RangeValues _mAgeRange = RangeValues(20, 30);
  late double ageDisplayMin, ageDisplayMax;

  @override
  void initState() {
    super.initState();
    ageDisplayMin = _mAgeRange.start;
    ageDisplayMax = _mAgeRange.end;
  }

  @override
  Widget build(BuildContext context) {
    TextStyle labelStyle = TextStyle(
        fontSize: ScreenUtil().setSp(13.0), color: AppColors.soulPrimaryDark);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(14.0)),
        color: Colors.grey[50], //.withOpacity(0.2), //Color(0xFFAAA9AD)
      ), //AppColors.soulPrimaryLight),
      height: MediaQuery.of(context).size.height * 0.74,
      padding: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(8.0)),
      child: Column(
        children: <Widget>[
          Container(
            //color: AppColors.soulPrimary,
            padding: EdgeInsets.only(
              top: ScreenUtil().setHeight(8.0),
              left: ScreenUtil().setHeight(8.0),
              right: ScreenUtil().setHeight(8.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Filter",
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(18.0),
                    color: Colors.grey[700], //AppColors.soulAccentDark,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 2.0,
          ),
          Container(
            padding: EdgeInsets.symmetric(
                //vertical: screenAwareSizeV(8.0, context),
                horizontal: ScreenUtil().setWidth(16.0)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //DISTANCE
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Distance",
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(16.0),
                        fontWeight: FontWeight.w800,
                        color: Colors.grey[700], //AppColors.soulAccentDark,
                      ),
                    ),
                  ],
                ),
                Container(
                  child: FlutterSlider(
                    values: [_mDistance],
                    min: 500,
                    max: maxDistance,
                    handler: FlutterSliderHandler(
                      decoration: BoxDecoration(),
                      child: Container(
                        decoration: SliderHandlerDecoration(),
                      ),
                    ),
                    tooltip: FlutterSliderTooltip(
                      alwaysShowTooltip: true,
                      textStyle: labelStyle,
                      positionOffset:
                          FlutterSliderTooltipPositionOffset(top: 8.0),
                      boxStyle: FlutterSliderTooltipBox(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                        ),
                      ),
                      custom: (value) {
                        String displayVal = "";
                        if (value < 1000) {
                          displayVal = value.toInt().toString() + " m";
                        } else {
                          displayVal = value % 1000 > 0
                              ? (value / 1000).toString() + " km"
                              : (value / 1000).toInt().toString() + " km";
                        }
                        return Text(
                          displayVal,
                          style: labelStyle,
                        );
                      },
                    ),
                    step: FlutterSliderStep(
                      step: 500,
                    ),
                    trackBar: FlutterSliderTrackBar(
                      activeTrackBarHeight: 3.0,
                      inactiveTrackBarHeight: 2.0,
                      activeTrackBar: BoxDecoration(
                        color: AppColors.soulPrimary,
                      ),
                      inactiveTrackBar: BoxDecoration(
                        color: Colors.grey[400],
                      ),
                    ),
                    hatchMark: FlutterSliderHatchMark(
                      density: 0.5,
                      displayLines: false,
                      linesDistanceFromTrackBar: 8.0,
                      labelsDistanceFromTrackBar: ScreenUtil().setHeight(40.0),
                      labels: [
                        FlutterSliderHatchMarkLabel(
                          percent: 0,
                          label: Text(
                            '500m',
                            style: TextStyle(color: Colors.grey[400]),
                          ),
                        ),
                        FlutterSliderHatchMarkLabel(
                          percent: 100,
                          label: Text(
                            (maxDistance ~/ 1000).toInt().toString() + 'km',
                            style: TextStyle(
                              color: Colors.grey[400],
                            ),
                          ),
                        ),
                      ],
                    ),
                    onDragCompleted: (handlerIndex, mLowerValue, mHigherValue) {
                      setState(() {
                        _mDistance = mLowerValue;
                      });
                    },
                  ),
                ),
                Divider(),
                //Gender
                Text(
                  "Interested in",
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(16.0),
                    fontWeight: FontWeight.w800,
                    color: Colors.grey[700], //AppColors.soulAccentDark,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width * 0.25,
                      margin: EdgeInsets.symmetric(
                        vertical: ScreenUtil().setHeight(16.0),
                      ),
                      child: FlatButton(
                        color: _mSelectedGender == 0
                            ? AppColors.soulPrimary
                            : Colors.transparent,
                        child: Text(
                          "Men",
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(15.0),
                            color: _mSelectedGender == 0
                                ? Colors.white
                                : Colors.grey[600],
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1.0,
                            color: _mSelectedGender == 0
                                ? AppColors.soulPrimaryDark
                                : Colors.grey.shade700,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        onPressed: () {
                          setState(() {
                            _mSelectedGender = 0;
                          });
                        },
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: FlatButton(
                        color: _mSelectedGender == 1
                            ? AppColors.soulPrimary
                            : Colors.transparent,
                        child: Text(
                          "Women",
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(15.0),
                            color: _mSelectedGender == 1
                                ? Colors.white
                                : Colors.grey[600],
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1.0,
                            color: _mSelectedGender == 1
                                ? AppColors.soulPrimaryDark
                                : Colors.grey.shade700,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        onPressed: () {
                          setState(() {
                            _mSelectedGender = 1;
                          });
                        },
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: FlatButton(
                        color: _mSelectedGender == 2
                            ? AppColors.soulPrimary
                            : Colors.transparent,
                        child: Text(
                          "Both",
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(15.0),
                            color: _mSelectedGender == 2
                                ? Colors.white
                                : Colors.grey[600],
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1.0,
                            color: _mSelectedGender == 2
                                ? AppColors.soulPrimaryDark
                                : Colors.grey.shade700,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        onPressed: () {
                          setState(() {
                            _mSelectedGender = 2;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Divider(),
                //AGE
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Age",
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(16.0),
                        fontWeight: FontWeight.w800,
                        color: Colors.grey[700], //AppColors.soulAccentDark,
                      ),
                    ),
                    ageDisplayMin == ageDisplayMax
                        ? Text(
                            ageDisplayMin.toInt().toString() + " years",
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: ScreenUtil().setSp(15.0),
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        : Text(
                            ageDisplayMin.toInt().toString() +
                                " - " +
                                ageDisplayMax.toInt().toString() +
                                " years",
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: ScreenUtil().setSp(15.0),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: ScreenUtil().setHeight(8.0),
                      horizontal: ScreenUtil().setWidth(8.0)),
                  child: FlutterSlider(
                    values: [ageDisplayMin, ageDisplayMax],
                    rangeSlider: true,
                    min: minAge,
                    max: maxAge,
                    step: FlutterSliderStep(step: 1),
                    tooltip: FlutterSliderTooltip(
                      alwaysShowTooltip: true,
                      textStyle: labelStyle,
                      positionOffset:
                          FlutterSliderTooltipPositionOffset(top: 8.0),
                      boxStyle: FlutterSliderTooltipBox(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                        ),
                      ),
                      custom: (value) {
                        return Text(
                          value.toInt().toString(),
                          style: labelStyle,
                        );
                      },
                    ),
                    handler: FlutterSliderHandler(
                      decoration: BoxDecoration(),
                      child: Container(
                        decoration: SliderHandlerDecoration(),
                      ),
                    ),
                    rightHandler: FlutterSliderHandler(
                      decoration: BoxDecoration(),
                      child: Container(
                        decoration: SliderHandlerDecoration(),
                      ),
                    ),
                    trackBar: FlutterSliderTrackBar(
                      activeTrackBarHeight: 3.0,
                      inactiveTrackBarHeight: 2.0,
                      activeTrackBar: BoxDecoration(
                        color: AppColors.soulPrimary,
                      ),
                      inactiveTrackBar: BoxDecoration(
                        color: Colors.grey[400],
                      ),
                    ),
                    onDragging: (handlerIndex, mLowerVal, mHigherVal) {
                      ageDisplayMin = mLowerVal;
                      ageDisplayMax = mHigherVal;
                      setState(() {});
                    },
                  ),
                ),
                Divider(),
                //HEIGHT
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Height",
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(16.0),
                        fontWeight: FontWeight.w800,
                        color: Colors.grey[700], //AppColors.soulAccentDark,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: ScreenUtil().setHeight(8.0),
                      horizontal: ScreenUtil().setWidth(8.0)),
                  child: FlutterSlider(
                    values: [_mHeightRange.start, _mHeightRange.end],
                    rangeSlider: true,
                    min: minHeight,
                    max: maxHeight,
                    minimumDistance: 20,
                    step: FlutterSliderStep(step: 1),
                    tooltip: FlutterSliderTooltip(
                      alwaysShowTooltip: true,
                      textStyle: labelStyle,
                      positionOffset:
                          FlutterSliderTooltipPositionOffset(top: 8.0),
                      boxStyle: FlutterSliderTooltipBox(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                        ),
                      ),
                      custom: (value) {
                        return Text(
                          value.toInt().toString() + " cm",
                          style: labelStyle,
                        );
                      },
                    ),
                    handler: FlutterSliderHandler(
                      decoration: BoxDecoration(),
                      child: Container(
                        decoration: SliderHandlerDecoration(),
                      ),
                    ),
                    rightHandler: FlutterSliderHandler(
                      decoration: BoxDecoration(),
                      child: Container(
                        decoration: SliderHandlerDecoration(),
                      ),
                    ),
                    trackBar: FlutterSliderTrackBar(
                      activeTrackBarHeight: 3.0,
                      inactiveTrackBarHeight: 2.0,
                      activeTrackBar: BoxDecoration(
                        color: AppColors.soulPrimary,
                      ),
                      inactiveTrackBar: BoxDecoration(
                        color: Colors.grey[400],
                      ),
                    ),
                    onDragCompleted: (handlerIndex, mLowerVal, mHigherVal) {
                      setState(() {
                        _mHeightRange = new RangeValues(mLowerVal, mHigherVal);
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.height * 0.3,
            child: RaisedButton(
              color: AppColors.soulPrimary,
              onPressed: () {},
              child: Text(
                "Done",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void setSelectedGender(int val) {
    setState(() {
      _mSelectedGender = val;
    });
  }
} //build
