import 'package:flutter/material.dart';
import 'package:Soulmate_App/utils/widget_utils.dart';

class ExploreCard extends StatefulWidget {
  final String imageURI;
  final String name;
  final int age, height;

  ExploreCard({this.imageURI, this.name, this.age, this.height});

  @override
  createState() => ExploreCardState();
}

class ExploreCardState extends State<ExploreCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
      width:
          (MediaQuery.of(context).size.width - screenAwareSizeH(32.0, context)),
      child: exploreCard(context),
    );
  }

  Widget exploreCard(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
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
              widget.name +
                  (widget.age == null ? '' : ', ' + widget.age.toString()),
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
                Text(widget.height.toString() + 'cm',
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
    );
  }

  Widget imageArea(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        //image
        Image.asset(
          widget.imageURI,
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
