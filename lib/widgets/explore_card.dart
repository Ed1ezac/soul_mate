import 'dart:math';
import 'package:flutter/material.dart';
import 'package:Soulmate_App/models/potential_match.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExploreCard extends StatefulWidget {
  final PotentialMatch potentialMatch;

  ExploreCard({
    required this.potentialMatch,
  });

  @override
  createState() => ExploreCardState();
}

class ExploreCardState extends State<ExploreCard> {
  @override
  Widget build(BuildContext context) {
    return _exploreCard(context);
  }

  Widget _exploreCard(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Wrap(
        //crossAxisAlignment: CrossAxisAlignment.start,
        clipBehavior: Clip.antiAlias,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(8.0)),
            child: imageArea(context),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setWidth(16.0),
            ),
            margin: EdgeInsets.only(top: ScreenUtil().setHeight(4.0)),
            child: Text(
              widget.potentialMatch.name +
                  (widget.potentialMatch.age == 0
                      ? ''
                      : ', ' + widget.potentialMatch.age.toString()),
              //textScaleFactor: heightFactor < 0.9 ? heightFactor : null,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setWidth(16.0),
            ),
            margin: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(3.0)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Social Introvert',
                    style: Theme.of(context).textTheme.bodyText2),
                Text(widget.potentialMatch.height.toString() + 'cm',
                    style: Theme.of(context).textTheme.bodyText2),
              ],
            ),
          ),
          Divider(
            indent: 16.0,
            height: 1,
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Container(
              margin: EdgeInsets.only(top: 4.h),
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
              ),
              child: Text(
                'Swiming, music, partying',
                style: Theme.of(context).textTheme.caption,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget imageArea(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        //image
        Image.asset(
          widget.potentialMatch.imageURI,
          height: 310.h,
          fit: BoxFit.cover,
        ),
        //scrim
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 80.h,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xCC000000),
                  Color(0x66000000),
                  Colors.transparent
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
        ),
        //distance
        Align(
          alignment: Alignment.bottomRight,
          child: Container(
            margin: EdgeInsets.only(right: 8.w, bottom: 8.0.h),
            alignment: Alignment.bottomRight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.person_pin_circle,
                  color: Colors.white,
                  size: 16.w,
                ),
                Text(
                  "200m",
                  style: TextStyle(color: Colors.white, fontSize: 11.sp),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
