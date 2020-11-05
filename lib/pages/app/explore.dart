import 'package:Soulmate_App/models/potential_match.dart';
import 'package:Soulmate_App/utils/widget_utils.dart';
import 'package:Soulmate_App/widgets/explore_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

import '../../styles.dart';

class Explore extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ExploreState();
  }
}

class ExploreState extends State<Explore> with TickerProviderStateMixin {
  int flag = 0;
  AnimationController _slideController;
  Animation<double> slide;
  Animation<double> rotate;
  Animation<double> bottom;
  List<PotentialMatch> items = [];
  List<PotentialMatch> selectedItems = [];
  var itemsLength;

  @override
  void initState() {
    super.initState();

    _slideController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));

    rotate = new Tween<double>(
      begin: -0.0,
      end: -40.0,
    ).animate(
      new CurvedAnimation(
        parent: _slideController,
        curve: Curves.ease,
      ),
    );
    rotate.addListener(() {
      setState(() {
        if (rotate.isCompleted) {
          var i = items.removeLast();
          items.insert(0, i);
          _slideController.reset();
        }
      });
    });

    slide = new Tween<double>(
      begin: 0.0,
      end: 400.0,
    ).animate(
      new CurvedAnimation(
        parent: _slideController,
        curve: Curves.ease,
      ),
    );

    bottom = new Tween<double>(
      begin: 0.0,
      end: 100.0,
    ).animate(
      new CurvedAnimation(
        parent: _slideController,
        curve: Curves.ease,
      ),
    );

    items
      ..add(new PotentialMatch("assets/images/blu_bg.jpg", "Jessica", 23, 158))
      ..add(
          new PotentialMatch("assets/images/girl_avatar.jpg", "Candy", 26, 161))
      ..add(new PotentialMatch("assets/images/blu_bg.jpg", "Mindy", 29, 184))
      ..add(new PotentialMatch(
          "assets/images/girl_avatar.jpg", "Tamayo", 32, 191))
      ..add(new PotentialMatch("assets/images/blu_bg.jpg", "Flo", 20, 121))
      ..add(new PotentialMatch(
          "assets/images/girl_avatar.jpg", "Janet", 28, 189));
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 0.4;
    itemsLength = items.length;

    return itemsLength > 0
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: stackedCards(context),
              ),
              Padding(
                padding:
                    EdgeInsets.only(bottom: screenAwareSizeV(16.0, context)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Card(
                      elevation: 4.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: InkWell(
                        customBorder: CircleBorder(),
                        onTap: () => onDisssmissPressed(),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Icon(
                            Icons.clear,
                            size: 24.0,
                            color: AppColors.soulPrimary,
                          ),
                        ),
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.only(
                          bottom: screenAwareSizeV(16.0, context)),
                      elevation: 6.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80.0),
                      ),
                      child: InkWell(
                        customBorder: CircleBorder(),
                        onTap: () => onCrushPressed(),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Icon(
                            Icons.whatshot,
                            size: 32.0,
                            color: Colors.amber,
                          ),
                        ),
                      ),
                    ),
                    Card(
                      elevation: 4.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: InkWell(
                        customBorder: CircleBorder(),
                        onTap: () => onLikePressed(),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Icon(
                            Icons.favorite,
                            size: 24.0,
                            color: AppColors.soulPrimary,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        : Center(
            child: Text(
              "Nobody left :(",
              style: new TextStyle(color: Colors.black, fontSize: 24.0),
            ),
          );
  }

  void onDisssmissPressed() {
    swipeLeft();
  }

  void onCrushPressed() {
    swipeRight();
  }

  void onLikePressed() {
    swipeRight();
  }

  Widget stackedCards(BuildContext context) {
    double initialBottom = 0.0;
    double backCardPosition = initialBottom + (itemsLength - 1) * 10 + 10;
    double backCardWidth = -9.0;
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: items.map((item) {
        if (items.indexOf(item) == itemsLength - 1) {
          return ExploreCard(
            potentialMatch: item,
            bottom: bottom.value,
            right: slide.value,
            left: 0.0,
            cardWidth: backCardWidth + 9,
            rotation: rotate.value,
            skew: rotate.value < -10 ? 0.1 : 0.0,
            addToFavourites: addToFavourites,
            dismissPotential: dismissPotential,
            flag: flag,
          );
        } else {
          backCardPosition = backCardPosition - 10;
          backCardWidth = backCardWidth + 9;

          return ExploreCard(
            potentialMatch: item,
            bottom: backCardPosition,
            right: 0.0,
            left: 0.0,
            cardWidth: backCardWidth,
            rotation: 0.0,
            skew: 0.0,
          );
        }
      }).toList(),
    );
  }

  Future<Null> _swipeAnimation() async {
    try {
      await _slideController.forward();
    } on TickerCanceled {}
  }

  //TODO--make
  dismissPotential(PotentialMatch match) {
    setState(() {
      items.remove(match);
    });
  }

  addToFavourites(PotentialMatch match) {
    setState(() {
      items.remove(match);
      selectedItems.add(match);
      //items.insert(items.length - 1, null);
    });
  }

  swipeLeft() {
    if (flag == 1)
      setState(() {
        flag = 0;
      });

    _swipeAnimation();
  }

  swipeRight() {
    if (flag == 0)
      setState(() {
        flag = 1;
      });

    _swipeAnimation();
  }

  @override
  void dispose() {
    _slideController.dispose();
    super.dispose();
  }
}
