import 'package:flutter/material.dart';
import 'package:Soulmate_App/widgets/explore_card.dart';
import 'package:Soulmate_App/widgets/card_stack.dart';
import 'package:Soulmate_App/models/potential_match.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        introversion: 0, interests: []),
    PotentialMatch("assets/images/girl_avatar.jpg", "Tilly", 32, 191,
        introversion: 0, interests: []),
    PotentialMatch("assets/images/blu_bg.jpg", "Fenty", 32, 121,
        introversion: 0, interests: []),
    PotentialMatch("assets/images/girl_avatar.jpg", "May", 22, 149,
        introversion: 0, interests: []),
    PotentialMatch("assets/images/blu_bg.jpg", "Palesa", 18, 153,
        introversion: 0, interests: [])
  ];

  @override
  void initState() {
    super.initState();
    //height = widget.height ?? 170;
  }

  @override
  Widget build(BuildContext context) {
    CardController controller; //Use to programmatically trigger swipe.

    return Scaffold(
      backgroundColor: Colors.green[100],
      body: SafeArea(
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.85,
            child: new CardStack(
              swipeUp: true,
              swipeDown: true,
              orientation: AmassOrientation.bottom,
              cardCount: _items.length,
              maxStackNum: 5,
              swipeEdge: 4.0,
              maxWidth: 1.sw < 600 ? 0.92.sw : 380.w,
              maxHeight: 1.sh < 900 ? 0.6.sh : 424.h,
              minWidth: 1.sw < 600 ? 0.85.sw : 360.w,
              minHeight: 1.sh < 900 ? 0.59.sh : 410.h,
              potentials: _items,
              cardBuilder: (context, index) =>
                  ExploreCard(potentialMatch: _items[index]),
              cardController: controller = CardController(),
              swipeUpdateCallback:
                  (DragUpdateDetails details, Alignment align) {
                /// Get swiping card's alignment
                if (align.x < 0) {
                  //Card is LEFT swiping
                } else if (align.x > 0) {
                  //Card is RIGHT swiping
                }
              },
              swipeCompleteCallback:
                  (CardSwipeOrientation orientation, int index) {
                /// Get orientation & index of swiped card!
              },
            ),
          ),
        ),
      ),
    );
  }
}
