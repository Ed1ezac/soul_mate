import 'package:Soulmate_App/widgets/slider_handler_decoration.dart';
import 'package:flutter/material.dart';
import 'package:another_xlider/another_xlider.dart';
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
  double maxAge = 75, maxHeight = 210, maxDistance = 20000;
  RangeValues _mHeightRange = RangeValues(140, 170);
  RangeValues _mAgeRange = RangeValues(20, 40);
  late double ageDisplayMin, ageDisplayMax;

  @override
  void initState() {
    super.initState();
    ageDisplayMin = _mAgeRange.start;
    ageDisplayMax = _mAgeRange.end;
  }

  @override
  Widget build(BuildContext context) {
    TextStyle labelStyle =
        TextStyle(fontSize: 12.sp, color: AppColors.soulPrimaryDark);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12.w)),
        color: Colors.grey[50], //.withOpacity(0.2), //Color(0xFFAAA9AD)
      ), //AppColors.soulPrimaryLight),
      height: 0.82.sh,
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Column(
        children: <Widget>[
          Container(
            //color: AppColors.soulPrimary,
            padding: EdgeInsets.only(
              top: 8.h,
              left: 8.h,
              right: 8.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Options",
                  style: TextStyle(
                    fontSize: 18.sp,
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
            padding: EdgeInsets.symmetric(horizontal: 16.w),
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
                        fontSize: 16.sp,
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
                      step: _mDistance > 10000 ? 1000 : 500,
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
                      labelsDistanceFromTrackBar: 40.h,
                      labels: [
                        FlutterSliderHatchMarkLabel(
                          percent: 0,
                          label: Text(
                            '500m',
                            style: TextStyle(
                                fontSize: 11.sp, color: Colors.grey[400]),
                          ),
                        ),
                        FlutterSliderHatchMarkLabel(
                          percent: 100,
                          label: Text(
                            (maxDistance ~/ 1000).toInt().toString() + 'km',
                            style: TextStyle(
                              fontSize: 11.sp,
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
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w800,
                    color: Colors.grey[700], //AppColors.soulAccentDark,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      height: 0.05.sh,
                      width: 0.25.sw,
                      margin: EdgeInsets.symmetric(
                        vertical: 16.sp,
                      ),
                      child: FlatButton(
                        color: _mSelectedGender == 0
                            ? AppColors.soulPrimary
                            : Colors.transparent,
                        child: Text(
                          "Men",
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: _mSelectedGender == 0
                                ? Colors.white
                                : Colors.grey[600],
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: _mSelectedGender == 0
                                ? AppColors.soulPrimaryDark
                                : Colors.grey.shade700,
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
                      height: 0.05.sh,
                      width: 0.25.sw,
                      child: FlatButton(
                        color: _mSelectedGender == 1
                            ? AppColors.soulPrimary
                            : Colors.transparent,
                        child: Text(
                          "Women",
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: _mSelectedGender == 1
                                ? Colors.white
                                : Colors.grey[600],
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: _mSelectedGender == 1
                                ? AppColors.soulPrimaryDark
                                : Colors.grey.shade700,
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
                      height: 0.05.sh,
                      width: 0.25.sw,
                      child: FlatButton(
                        color: _mSelectedGender == 2
                            ? AppColors.soulPrimary
                            : Colors.transparent,
                        child: Text(
                          "Both",
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: _mSelectedGender == 2
                                ? Colors.white
                                : Colors.grey[600],
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: _mSelectedGender == 2
                                ? AppColors.soulPrimaryDark
                                : Colors.grey.shade700,
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
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w800,
                        color: Colors.grey[700], //AppColors.soulAccentDark,
                      ),
                    ),
                    ageDisplayMin == ageDisplayMax
                        ? Text(
                            ageDisplayMin.toInt().toString() + " years",
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 16.sp,
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
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                  ],
                ),
                Container(
                  //padding: EdgeInsets.symmetric(vertical: 4.h),
                  child: FlutterSlider(
                    values: [ageDisplayMin, ageDisplayMax],
                    rangeSlider: true,
                    min: minAge,
                    max: maxAge,
                    minimumDistance: 3,
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
                      setState(() {
                        ageDisplayMin = mLowerVal;
                        ageDisplayMax = mHigherVal;
                      });
                    },
                  ),
                ),
                Divider(),
                //HEIGHT
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Height (cm)",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w800,
                        color: Colors.grey[700], //AppColors.soulAccentDark,
                      ),
                    ),
                  ],
                ),
                Container(
                  child: FlutterSlider(
                    values: [_mHeightRange.start, _mHeightRange.end],
                    rangeSlider: true,
                    min: minHeight,
                    max: maxHeight,
                    minimumDistance: 10,
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
            width: 0.5.sw,
            child: RaisedButton(
              color: AppColors.soulPrimary,
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Done",
                style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
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
