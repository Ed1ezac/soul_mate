import 'package:Soulmate_App/widgets/slider_handler_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:Soulmate_App/utils/widget_utils.dart';

import '../styles.dart';

class FilterDialog extends StatefulWidget {
  @override
  _FilterDialogState createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  double _mDistance = 5000;
  int _mSelectedGender = 1;
  double minAge = 18, minHeight = 80;
  double maxAge = 60, maxHeight = 210, maxDistance = 10000;
  RangeValues _mAgeRange = RangeValues(20, 30);
  RangeValues _mHeightRange = RangeValues(140, 170);
  double ageDisplayMin, ageDisplayMax;

  @override
  void initState() {
    super.initState();
    ageDisplayMin = _mAgeRange.start;
    ageDisplayMax = _mAgeRange.end;
  }

  @override
  Widget build(BuildContext context) {
    TextStyle labelStyle =
        TextStyle(fontSize: 13.0, color: AppColors.soulPrimaryDark);
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
          color: Colors.grey[50]), //AppColors.soulPrimaryLight),
      height: MediaQuery.of(context).size.height * 0.75,
      padding: EdgeInsets.symmetric(vertical: screenAwareSizeV(8.0, context)),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(
                vertical: screenAwareSizeV(8.0, context),
                horizontal: screenAwareSizeH(8.0, context)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Filter",
                  style: TextStyle(
                    fontSize: 18.0,
                    color: AppColors.soulAccentDark,
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
                vertical: screenAwareSizeV(8.0, context),
                horizontal: screenAwareSizeH(16.0, context)),
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
                        fontSize: 16.0,
                        fontWeight: FontWeight.w800,
                        color: AppColors.soulAccentDark,
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
                          FlutterSliderTooltipPositionOffset(top: 2.0),
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
                      activeTrackBarHeight: 4.0,
                      inactiveTrackBarHeight: 3.0,
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
                      labelsDistanceFromTrackBar:
                          screenAwareSizeV(40.0, context),
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
                    fontSize: 16.0,
                    fontWeight: FontWeight.w800,
                    color: AppColors.soulAccentDark,
                  ),
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      value: 0,
                      groupValue: _mSelectedGender,
                      activeColor: AppColors.soulPrimary,
                      onChanged: (val) {
                        setSelectedGender(val);
                      },
                    ),
                    Text(
                      "Men",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Radio(
                      value: 1,
                      groupValue: _mSelectedGender,
                      activeColor: AppColors.soulPrimary,
                      onChanged: (val) {
                        setSelectedGender(val);
                      },
                    ),
                    Text(
                      "Women",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Radio(
                      value: 3,
                      groupValue: _mSelectedGender,
                      activeColor: AppColors.soulPrimary,
                      onChanged: (val) {
                        setSelectedGender(val);
                      },
                    ),
                    Text(
                      "Both",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w600,
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
                        fontSize: 16.0,
                        fontWeight: FontWeight.w800,
                        color: AppColors.soulAccentDark,
                      ),
                    ),
                    ageDisplayMin == ageDisplayMax
                        ? Text(
                            ageDisplayMin.toInt().toString(),
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        : Text(
                            ageDisplayMin.toInt().toString() +
                                " - " +
                                ageDisplayMax.toInt().toString(),
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: screenAwareSizeV(8.0, context),
                      horizontal: screenAwareSizeH(8.0, context)),
                  child: FlutterSlider(
                    values: [_mAgeRange.start, _mAgeRange.end],
                    rangeSlider: true,
                    min: minAge,
                    max: maxAge,
                    step: FlutterSliderStep(step: 1),
                    tooltip: FlutterSliderTooltip(
                        alwaysShowTooltip: true,
                        positionOffset:
                            FlutterSliderTooltipPositionOffset(top: 2.0),
                        boxStyle: FlutterSliderTooltipBox(
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                          ),
                        ),
                        custom: (value) {
                          return Text(
                            value.toInt().toString() + " yrs",
                            style: labelStyle,
                          );
                        }),
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
                      activeTrackBarHeight: 4.0,
                      inactiveTrackBarHeight: 3.0,
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
                    onDragCompleted: (handlerIndex, mLowerVal, mHigherVal) {
                      _mAgeRange = new RangeValues(mLowerVal, mHigherVal);
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
                        fontSize: 16.0,
                        fontWeight: FontWeight.w800,
                        color: AppColors.soulAccentDark,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: screenAwareSizeV(8.0, context),
                      horizontal: screenAwareSizeH(8.0, context)),
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
                          FlutterSliderTooltipPositionOffset(top: 2.0),
                      boxStyle: FlutterSliderTooltipBox(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                        ),
                      ),
                      custom: (value) {
                        return Text(
                          value.toInt().toString() + " m",
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
                      activeTrackBarHeight: 4.0,
                      inactiveTrackBarHeight: 3.0,
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
                style: TextStyle(color: Colors.white),
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
