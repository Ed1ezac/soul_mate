import 'package:flutter/material.dart';
import 'package:Soulmate_App/widgets/card_stack.dart';
import 'package:Soulmate_App/models/potential_match.dart';

class DrawingArea extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DrawingAreaState();
  }
}

class DrawingAreaState extends State<DrawingArea> {
  //int height = 700;
  List<PotentialMatch> _items = [
    PotentialMatch("assets/images/blu_bg.jpg", "Jessica", 23, 158,
        introversion: 0, interests: []),
    PotentialMatch("assets/images/girl_avatar.jpg", "Candy", 26, 161,
        introversion: 0, interests: []),
    PotentialMatch("assets/images/blu_bg.jpg", "Mindy", 29, 184,
        introversion: 0, interests: []),
    PotentialMatch("assets/images/girl_avatar.jpg", "Tamayo", 32, 191,
        introversion: 0, interests: []),
    PotentialMatch("assets/images/blu_bg.jpg", "Flo", 20, 121,
        introversion: 0, interests: []),
    PotentialMatch("assets/images/girl_avatar.jpg", "Janet", 28, 189,
        introversion: 0, interests: [])
  ];

  @override
  void initState() {
    super.initState();
    //height = widget.height ?? 170;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      body: SafeArea(
        child: Center(
          child: CardStack(potentials: _items),
        ),
      ),
    );
  }
}
