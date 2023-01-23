import 'package:Soulmate_App/models/potential_match.dart';
import 'package:Soulmate_App/widgets/explore_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../styles.dart';
import '../../widgets/card_stack.dart';

class Explore extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ExploreState();
  }
}

class ExploreState extends State<Explore> with TickerProviderStateMixin {
  List<PotentialMatch> items = [];
  List<PotentialMatch> selectedItems = [];
  var itemsLength;

  @override
  void initState() {
    super.initState();

    items
      ..add(new PotentialMatch("assets/images/blu_bg.jpg", "Jessica", 23, 158,
          introversion: 0, interests: []))
      ..add(new PotentialMatch(
          "assets/images/girl_avatar.jpg", "Candy", 26, 161,
          introversion: 0, interests: []))
      ..add(new PotentialMatch("assets/images/blu_bg.jpg", "Mindy", 29, 184,
          introversion: 0, interests: []))
      ..add(new PotentialMatch(
          "assets/images/girl_avatar.jpg", "Tamayo", 32, 191,
          introversion: 0, interests: []))
      ..add(new PotentialMatch("assets/images/blu_bg.jpg", "Flo", 20, 121,
          introversion: 0, interests: []))
      ..add(new PotentialMatch(
          "assets/images/girl_avatar.jpg", "Janet", 28, 189,
          introversion: 0, interests: []))
      ..add(new PotentialMatch(
          "assets/images/girl_avatar.jpg", "Tilly", 32, 191,
          introversion: 0, interests: []))
      ..add(new PotentialMatch("assets/images/blu_bg.jpg", "Fenty", 32, 121,
          introversion: 0, interests: []))
      ..add(new PotentialMatch("assets/images/girl_avatar.jpg", "May", 22, 149,
          introversion: 0, interests: []))
      ..add(new PotentialMatch("assets/images/blu_bg.jpg", "Palesa", 18, 153,
          introversion: 0, interests: []));
  }

  @override
  Widget build(BuildContext context) {
    CardController controller; //Use to programmatically trigger swipe.
    itemsLength = items.length;
    //TODO - Column Flex
    return items.length > 0
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 0.67.sh,
                child: new CardStack(
                  swipeUp: true,
                  swipeDown: true,
                  orientation: AmassOrientation.bottom,
                  cardCount: items.length,
                  maxStackNum: 5,
                  swipeEdge: 4.0,
                  maxWidth: 1.sw < 600 ? 0.92.sw : 380.w,
                  maxHeight: 1.sh < 900 ? 0.6.sh : 424.h,
                  minWidth: 1.sw < 600 ? 0.85.sw : 360.w,
                  minHeight: 1.sh < 900 ? 0.59.sh : 410.h,
                  potentials: items,
                  cardBuilder: (context, index) =>
                      ExploreCard(potentialMatch: items[index]),
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
              interactionButtonRow(context),
            ],
          )
        : Center(
            child: Text(
              "Nobody found :(",
              style: new TextStyle(color: Colors.black, fontSize: 24.0),
            ),
          );
  }

  Widget interactionButtonRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //reverse
        Container(
          padding: EdgeInsets.all(8.w),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(100.w)),
            ),
            child: Icon(
              Icons.replay_rounded,
              color: AppColors.soulPrimaryLight,
              size: 24.w,
            ),
          ),
        ),
        //pass
        Container(
          padding: EdgeInsets.all(8.w),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(100.w)),
            ),
            child: InkWell(
              child: Icon(
                Icons.thumb_down_rounded,
                color: AppColors.soulPrimaryLight,
                size: 32.w,
              ),
              onTap: () {},
            ),
          ),
        ),
        //crush!
        Container(
          padding: EdgeInsets.all(8.w),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(100.w)),
            ),
            child: InkWell(
              child: Icon(
                Icons.favorite,
                color: AppColors.soulPrimaryLight,
                size: 48.w,
              ),
              onTap: () {},
            ),
          ),
        ),
        //like
        Container(
          padding: EdgeInsets.all(8.w),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(100.w)),
            ),
            child: InkWell(
              child: Icon(
                Icons.thumb_up_rounded,
                color: AppColors.soulPrimaryLight,
                size: 32.w,
              ),
              onTap: () {},
            ),
          ),
        ),
        //
      ],
    );
  }

  void onDisssmissPressed() {
    //use the controller here
  }

  void onCrushPressed() {}

  void onLikePressed() {}

  void _addToFaves() {}
  dismissPotential(PotentialMatch match) {
    setState(() {
      items.remove(match);
    });
  }

  addToFavourites(PotentialMatch match) {
    setState(() {
      items.remove(match);
      selectedItems.add(match);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}
