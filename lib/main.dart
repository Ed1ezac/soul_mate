import 'package:Soulmate_App/widgets/custom_range_slider_thumb.dart';
import 'package:Soulmate_App/widgets/custom_slider_thumb.dart';
import 'package:flutter/material.dart';
import 'package:Soulmate_App/styles.dart';
import 'package:flutter/rendering.dart';
import 'package:Soulmate_App/utils/widget_utils.dart';
import 'package:Soulmate_App/pages/onboarding/on_boarding_carousel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //debugPaintSizeEnabled = true;
    return MaterialApp(
      title: 'Soulmate',
      theme: ThemeData(
        // This is the theme of your application.
        fontFamily: "Nunito",
        primaryColor: AppColors.soulPrimary,
        primaryColorDark: AppColors.soulPrimaryDark,
        accentColor: AppColors.soulAccent,
        cursorColor: AppColors.soulAccent,
        errorColor: AppColors.errorColor,
        textSelectionColor: AppColors.soulAccentLight,
        textSelectionHandleColor: AppColors.soulAccentDark,
        sliderTheme: SliderThemeData(
          overlayColor: AppColors.soulPrimaryLight.withOpacity(0.2),
          inactiveTrackColor: Colors.grey,
          activeTrackColor: AppColors.soulPrimary,
          trackHeight: 3.0,
          thumbShape: CustomSliderThumb(),
          rangeThumbShape: CustomRangeSliderThumb(),
          thumbColor: AppColors.soulAccentDark,
          valueIndicatorColor: AppColors.soulAccentDark,
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(),
          errorBorder: const OutlineInputBorder(
            borderSide:
                const BorderSide(color: AppColors.errorColor, width: 6.0),
          ),
        ),
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: OnBoardingCarousel(),
    );
  }
}
