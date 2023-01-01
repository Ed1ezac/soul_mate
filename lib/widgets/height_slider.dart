import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../styles.dart';

class HeightSlider extends StatelessWidget {
  final int height;

  const HeightSlider({Key? key, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(12.0)),
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
            height: ScreenUtil().setHeight(2.0),
            decoration: BoxDecoration(
                color:
                    i.isEven ? AppColors.soulAccentLight : Colors.transparent),
          ),
        ),
      ),
    );
  }
}

class SliderCircle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(28.0),
      height: ScreenUtil().setWidth(28.0),
      decoration: BoxDecoration(
        color: AppColors.soulAccentLight,
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.unfold_more,
        color: Colors.white,
        size: ScreenUtil().setWidth(18.0),
      ),
    );
  }
}

class SliderLabel extends StatelessWidget {
  final int height;
  const SliderLabel({Key? key, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: ScreenUtil().setWidth(4.0),
        bottom: ScreenUtil().setHeight(2.0),
      ),
      child: Text(
        "$height",
        style: TextStyle(
          fontSize: ScreenUtil().setSp(14.0),
          color: AppColors.soulAccentLight,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
