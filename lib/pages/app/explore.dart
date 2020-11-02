import 'package:Soulmate_App/widgets/explore_card.dart';
import 'package:flutter/material.dart';

class Explore extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ExploreState();
  }
}

class ExploreState extends State<Explore> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ExploreCard(),
    );
  }
}
