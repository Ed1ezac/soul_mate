import 'package:flutter/material.dart';
import 'package:Soulmate_App/utils/widget_utils.dart';

class ExploreCard extends StatefulWidget {
  @override
  createState() => ExploreCardState();
}

class ExploreCardState extends State<ExploreCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      width: (MediaQuery.of(context).size.height -
          screenAwareSizeH(32.0, context)),
      child: exploreCard(context),
    );
  }

  Widget exploreCard(BuildContext context) {
    return Card(
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.zero)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Stack(),
          ),
          Text(
            'Jessica',
            style: Theme.of(context).textTheme.headline6,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Social Introvert',
                  style: Theme.of(context).textTheme.bodyText2),
              Text('158cm', style: Theme.of(context).textTheme.bodyText2),
            ],
          ),
          Divider(),
          Text(
            'Swiming, music, partying',
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }

  Widget imageArea(BuildContext context) {
    return Stack(
      children: <Widget>[
        //image
        Image(),
        //scrim
        Container(),
        //distance
        Container(),
      ],
    );
  }
}
