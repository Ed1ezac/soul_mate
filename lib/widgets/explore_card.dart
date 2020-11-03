import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:Soulmate_App/utils/widget_utils.dart';

class ExploreCard extends StatefulWidget {
  @override
  createState() => ExploreCardState();
}

class ExploreCardState extends State<ExploreCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 1.5,
      width:
          (MediaQuery.of(context).size.width - screenAwareSizeH(16.0, context)),
      child: exploreCard(context),
    );
  }

  Widget exploreCard(BuildContext context) {
    return Card(
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.zero)),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: imageArea(context),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: screenAwareSizeH(16.0, context),
              ),
              margin: EdgeInsets.only(top: screenAwareSizeV(8.0, context)),
              child: Text(
                'Jessica, 23',
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
                  Text('158cm', style: Theme.of(context).textTheme.bodyText2),
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
      alignment: Alignment.center,
      children: <Widget>[
        //image
        Container(
          child: AspectRatio(
            aspectRatio: 5 / 6,
            child: Image(
              image: AssetImage("assets/images/girl_avatar.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        //scrim
        Align(
          alignment: Alignment.bottomRight,
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
            //height: screenAwareSizeV(50.0, context),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Transform.rotate(
                    angle: math.pi / 4,
                    child: Icon(
                      Icons.navigation,
                      color: Colors.white,
                      size: 16.0,
                    )),
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
