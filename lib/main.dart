import 'package:flutter/material.dart';
import 'package:Soulmate_App/styles.dart';
import 'package:flutter/services.dart';
//import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Soulmate_App/pages/onboarding/on_boarding_carousel.dart';

void main() {
  //WidgetsFlutterBinding.ensureInitialized();

  //localProvider = LocalEventProvider(sqflite.databaseFactory);
  //await localProvider.ready;
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
          colorScheme: ColorScheme(
            brightness: Brightness.light,
            primary: AppColors.soulPrimary,
            onPrimary: Colors.white,
            secondary: AppColors.soulAccent,
            onSecondary: Colors.white,
            error: AppColors.errorColor,
            onError: Colors.white,
            background: Colors.grey.shade50,
            onBackground: Colors.black54,
            surface: Colors.white,
            onSurface: Colors.black54,
          ),
          toggleableActiveColor: AppColors.soulAccent,
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: AppColors.soulAccent,
            selectionHandleColor: AppColors.soulAccentDark,
            selectionColor: AppColors.soulAccentLight,
          ),
          inputDecorationTheme: InputDecorationTheme(
            helperMaxLines: 2,
            labelStyle: TextStyle(color: Colors.grey),
            border: OutlineInputBorder(),
            contentPadding:
                EdgeInsets.symmetric(vertical: 18.h, horizontal: 4.w),
            errorStyle: TextStyle(color: AppColors.errorColor),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 0.4),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.soulPrimary, width: 1.6),
            ),
            errorBorder: const OutlineInputBorder(
              borderSide:
                  const BorderSide(color: AppColors.errorColor, width: 2.0),
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
