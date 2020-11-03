import 'package:Soulmate_App/widgets/explore_card.dart';
import 'package:flutter/material.dart';

import '../../styles.dart';

class Explore extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ExploreState();
  }
}

class ExploreState extends State<Explore> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: GestureDetector(
            child: stackedCards(context),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            FlatButton(
              color: Colors.amber,
              onPressed: () {},
              child: Icon(
                Icons.clear,
                color: Colors.white,
              ),
            ),
            FlatButton(
              color: AppColors.soulPrimary,
              onPressed: () {},
              child: Icon(
                Icons.favorite_border,
                color: Colors.white,
              ),
            ),
            FlatButton(
              color: Colors.purple,
              onPressed: () {},
              child: Icon(
                Icons.thumb_up,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget stackedCards(BuildContext context) {
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.topCenter,
          child: ExploreCard(
            imageURI: "assets/images/blu_bg.jpg",
            name: "Jessica",
            height: 157,
            age: 23,
          ),
        ),
      ],
    );
  }
}
