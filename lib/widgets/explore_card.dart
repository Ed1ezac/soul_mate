import 'dart:math';
import 'package:flutter/material.dart';
import 'package:Soulmate_App/models/potential_match.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExploreCard extends StatefulWidget {
  final int flag;
  final PotentialMatch potentialMatch;
  final double bottom, right, left, cardHeight, cardWidth, rotation, skew;
  final ValueChanged<PotentialMatch> dismissPotential;
  final ValueChanged<PotentialMatch> addToFavourites;

  static const double maxHeight = 408.0, maxWidth = 352.0;
  static const double minHeight = 244.8, minWidth = 211.2;

  ExploreCard({
    required this.flag,
    required this.left,
    required this.skew,
    required this.right,
    required this.bottom,
    required this.rotation,
    required this.potentialMatch,
    required this.addToFavourites,
    required this.dismissPotential,
    this.cardWidth = maxWidth,
    this.cardHeight = maxHeight,
  });

  @override
  createState() => ExploreCardState();
}

class ExploreCardState extends State<ExploreCard> {
  @override
  Widget build(BuildContext context) {
    return new Dismissible(
      key: UniqueKey(), //new Key(new Random().toString()),
      crossAxisEndOffset: -0.15,
      onResize: () {},
      onDismissed: (DismissDirection direction) {
        if (direction == DismissDirection.endToStart)
          widget.dismissPotential(widget.potentialMatch);
        else
          widget.addToFavourites(widget.potentialMatch);
      },
      //transform
      child: new Transform(
        alignment:
            widget.flag == 0 ? Alignment.bottomRight : Alignment.bottomLeft,
        transform: new Matrix4.skewX(widget.skew),
        child: new RotationTransition(
          turns: new AlwaysStoppedAnimation(widget.flag == 0
              ? widget.rotation / 360
              : -widget.rotation / 360),
          child: new Hero(
            tag: "img" + widget.cardWidth.toString(),
            child: new GestureDetector(
              onTap: () {},
              //card
              child: _exploreCard(context),
            ),
          ),
        ),
      ),
    );
  }

  Widget _exploreCard(BuildContext context) {
    double heightFactor = (widget.cardHeight / ExploreCard.maxHeight);
    return SizedBox(
      width: ScreenUtil().setWidth(widget.cardWidth),
      height: ScreenUtil().setHeight(widget.cardHeight),
      child: Card(
        elevation: 4.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
        child: Wrap(
          //crossAxisAlignment: CrossAxisAlignment.start,
          clipBehavior: Clip.antiAlias,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
              child: imageArea(context),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: ScreenUtil().setWidth(16.0),
              ),
              margin: EdgeInsets.only(top: ScreenUtil().setHeight(4.0)),
              child: Text(
                widget.potentialMatch.name +
                    (widget.potentialMatch.age == null
                        ? ''
                        : ', ' + widget.potentialMatch.age.toString()),
                textScaleFactor: heightFactor < 0.9 ? heightFactor : null,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: ScreenUtil().setWidth(16.0),
              ),
              margin:
                  EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(3.0)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Social Introvert',
                      textScaleFactor:
                          heightFactor < 0.93 ? heightFactor : null,
                      style: Theme.of(context).textTheme.bodyText2),
                  Text(widget.potentialMatch.height.toString() + 'cm',
                      textScaleFactor:
                          heightFactor < 0.93 ? heightFactor : null,
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
                margin: EdgeInsets.only(top: ScreenUtil().setHeight(4.0)),
                padding: EdgeInsets.symmetric(
                  horizontal: ScreenUtil().setWidth(16.0),
                ),
                child: Text(
                  'Swiming, music, partying',
                  textScaleFactor: heightFactor < 0.93 ? heightFactor : null,
                  style: Theme.of(context).textTheme.caption,
                ),
              ),
            ),
          ],
        ),
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
          height: ScreenUtil().setHeight(widget.cardHeight *
              0.7451), //magic number=ratio of cardheight to imageheight
          fit: BoxFit.cover,
        ),
        //scrim
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: ScreenUtil().setHeight(80.0),
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
            margin: EdgeInsets.only(
                right: ScreenUtil().setWidth(8.0),
                bottom: ScreenUtil().setHeight(8.0)),
            alignment: Alignment.bottomRight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.near_me,
                  color: Colors.white,
                  size: ScreenUtil().setWidth(16.0),
                ),
                Text(
                  "200m",
                  style: TextStyle(
                      color: Colors.white, fontSize: ScreenUtil().setSp(11.0)),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
