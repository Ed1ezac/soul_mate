import 'package:Soulmate_App/models/potential_match.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:Soulmate_App/utils/widget_utils.dart';

class ExploreCard extends StatefulWidget {
  final int flag;
  final PotentialMatch potentialMatch;
  final double bottom, right, left, cardWidth, rotation, skew;
  final ValueChanged<PotentialMatch> dismissPotential;
  final ValueChanged<PotentialMatch> addToFavourites;

  ExploreCard({
    this.flag,
    this.left,
    this.skew,
    this.right,
    this.bottom,
    this.rotation,
    this.cardWidth,
    this.potentialMatch,
    this.addToFavourites,
    this.dismissPotential,
  });

  @override
  createState() => ExploreCardState();
}

class ExploreCardState extends State<ExploreCard> {
  @override
  Widget build(BuildContext context) {
    return new Positioned(
      bottom: screenAwareSizeV(32.0, context) + widget.bottom,
      right:
          widget.flag == 0 ? widget.right != 0.0 ? widget.right : null : null,
      left: widget.flag == 1 ? widget.right != 0.0 ? widget.right : null : null,
      child: new Dismissible(
        key: new Key(new Random().toString()),
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
              tag: "img",
              child: new GestureDetector(
                onTap: () {},
                //card
                child: _exploreCard(context),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _exploreCard(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
      width: (MediaQuery.of(context).size.width -
          screenAwareSizeH(80.0, context) +
          widget.cardWidth),
      child: Card(
        elevation: 4.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
              child: imageArea(context),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: screenAwareSizeH(16.0, context),
              ),
              margin: EdgeInsets.only(top: screenAwareSizeV(8.0, context)),
              child: Text(
                widget.potentialMatch.name +
                    (widget.potentialMatch.age == null
                        ? ''
                        : ', ' + widget.potentialMatch.age.toString()),
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: screenAwareSizeH(16.0, context),
              ),
              margin: EdgeInsets.only(top: screenAwareSizeV(8.0, context)),
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
              indent: 4.0,
            ),
            Container(
              margin: EdgeInsets.only(bottom: screenAwareSizeV(8.0, context)),
              padding: EdgeInsets.symmetric(
                horizontal: screenAwareSizeH(16.0, context),
              ),
              child: Text(
                'Swiming, music, partying',
                style: Theme.of(context).textTheme.caption,
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
          height: MediaQuery.of(context).size.height * 0.45,
          fit: BoxFit.cover,
        ),
        //scrim
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: screenAwareSizeV(100.0, context),
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
                right: screenAwareSizeH(8.0, context),
                bottom: screenAwareSizeV(8.0, context)),
            alignment: Alignment.bottomRight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.near_me,
                  color: Colors.white,
                  size: 16.0,
                ),
                Text(
                  "200m",
                  style: TextStyle(color: Colors.white, fontSize: 11.0),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
