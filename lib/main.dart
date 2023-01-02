import 'package:flutter/material.dart';
import 'package:Soulmate_App/styles.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Soulmate_App/pages/onboarding/on_boarding_carousel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //debugPaintSizeEnabled = true;
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return ScreenUtilInit(
      designSize: Size(393, 698.1), //Sam-density = dp:393x698
      builder: (BuildContext context, child) => MaterialApp(
        title: 'Soulmate',
        theme: ThemeData(
          //theme of the app.
          fontFamily: "Nunito",
          primaryColor: AppColors.soulPrimary,
          primaryColorDark: AppColors.soulPrimaryDark,
          accentColor: AppColors.soulAccent,
          errorColor: AppColors.errorColor,
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: AppColors.soulAccent,
            selectionHandleColor: AppColors.soulAccentDark,
            selectionColor: AppColors.soulAccentLight,
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
      ),
    );
  }
}
