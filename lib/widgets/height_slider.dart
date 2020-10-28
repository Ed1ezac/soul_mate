import 'package:flutter/material.dart';
import 'package:soul_mate/utils/widget_utils.dart';
import '../styles.dart';

class HeightSlider extends StatelessWidget {
  final int height;

  const HeightSlider({Key key, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Container(
        margin: EdgeInsets.only(
            left: screenAwareSizeH(12.0, context),
            right: screenAwareSizeH(12.0, context)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SliderLabel(height: height),
            Row(
              children: <Widget>[
                SliderCircle(),
                Expanded(child: SliderLine()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SliderLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: List.generate(
          40,
          (i) => Expanded(
                child: Container(
                  height: 2.0,
                  decoration: BoxDecoration(
                      color: i.isEven
                          ? AppColors.soulAccentLight
                          : Colors.transparent),
                ),
              )),
    );
  }
}

class SliderCircle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: circleSizeAdapted(context),
      height: circleSizeAdapted(context),
      decoration: BoxDecoration(
        color: AppColors.soulAccentLight,
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.unfold_more,
        color: Colors.white,
        size: 0.6 * circleSizeAdapted(context),
      ),
    );
  }
}

class SliderLabel extends StatelessWidget {
  final int height;

  const SliderLabel({Key key, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: screenAwareSizeV(4.0, context),
        bottom: screenAwareSizeV(2.0, context),
      ),
      child: Text(
        "$height",
        style: TextStyle(
          fontSize: selectedLabelFontSize,
          color: AppColors.soulAccentLight,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
