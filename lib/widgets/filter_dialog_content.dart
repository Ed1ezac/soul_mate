import 'package:Soulmate_App/utils/widget_utils.dart';
import 'package:flutter/material.dart';

import '../styles.dart';

class FilterDialog extends StatefulWidget {
  @override
  _FilterDialogState createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  double _mDistance = 2500;
  int _mSelectedGender = 1;
  double minAge = 18, minHeight = 80;
  double maxAge = 70, maxHeight = 210;
  RangeValues _mAgeRange = RangeValues(20, 30);
  RangeValues _mHeightRange = RangeValues(150, 170);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      width: MediaQuery.of(context).size.width * 0.75,
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
                horizontal: screenAwareSizeH(8.0, context)),
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
                    Text(
                      _mDistance.toString() + "m",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                        color: AppColors.soulAccentDark,
                      ),
                    ),
                  ],
                ),
                Container(
                  child: Slider(
                    divisions: 2000,
                    min: 500,
                    max: 25000,
                    value: _mDistance,
                    onChanged: (double value) {
                      setState(() {
                        _mDistance = value;
                      });
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: screenAwareSizeV(8.0, context),
                      horizontal: screenAwareSizeH(8.0, context)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "500m",
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Text(
                        "25km",
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
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
                    Text("Men"),
                    Radio(
                      value: 1,
                      groupValue: _mSelectedGender,
                      activeColor: AppColors.soulPrimary,
                      onChanged: (val) {
                        setSelectedGender(val);
                      },
                    ),
                    Text("Women"),
                    Radio(
                      value: 3,
                      groupValue: _mSelectedGender,
                      activeColor: AppColors.soulPrimary,
                      onChanged: (val) {
                        setSelectedGender(val);
                      },
                    ),
                    Text("Both"),
                  ],
                ),
                Divider(),
                //AGE
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Age",
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
                  child: RangeSlider(
                    min: minAge,
                    max: maxAge,
                    values: _mAgeRange,
                    onChanged: (values) {
                      _mAgeRange = values;
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
                  child: RangeSlider(
                    min: minHeight,
                    max: maxHeight,
                    values: _mHeightRange,
                    onChanged: (values) {
                      _mHeightRange = values;
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.height * 0.3,
            child: RaisedButton(
              onPressed: () {},
              child: Text("Done"),
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
