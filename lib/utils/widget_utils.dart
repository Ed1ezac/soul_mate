import 'package:flutter/material.dart';
//this utility class...

//this is the pixel hieght of:
//my Huawei Y6-2019
const double baseHeight = 885.1;
const baseWidth = 408.5;

double screenAwareSizeV(double size, BuildContext context) {
  return size * MediaQuery.of(context).size.height / baseHeight;
}

double screenAwareSizeH(double size, BuildContext context) {
  return size * MediaQuery.of(context).size.width / baseWidth;
}

////--------
double marginBottomAdapted(BuildContext context) =>
    screenAwareSizeV(marginBottom, context);

double marginTopAdapted(BuildContext context) =>
    screenAwareSizeV(marginTop, context);

double circleSizeAdapted(BuildContext context) =>
    screenAwareSizeV(circleSize, context);

const double circleSize = 32.0;
const double marginBottom = 16.0;
const double marginTop = 29.0;
const double selectedLabelFontSize = 14.0;
const double labelsFontSize = 13.0;
