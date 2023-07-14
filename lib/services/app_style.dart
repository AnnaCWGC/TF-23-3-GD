import 'package:flutter/material.dart';

/// This class `AppStyle` applies a unified theme across the application. 
class AppStyle {
  /// The main ThemeData object that can be used across the application.
  static final ThemeData theme = AppThemeData.themeData;
}

/// This class `AppStyleFont` is a collection of preset font sizes for texts in the app.
class AppStyleFont {
  static const double xxxlarge = 32;
  static const double xxlarge = 24;
  static const double xlarge = 20;
  static const double large = 18;
  static const double xxmedium = 16;
  static const double xmedium = 14;
  static const double medium = 12;
  static const double tiny = 8;
}

/// This class `AppStyleColor` provides a set of color presets for use within the app.
class AppStyleColor {
  static final Color colorBackground = Colors.white;
  static final Color colorPrimary = Color(0xff611d4f);
  static final Color colorSecondary = Color(0xfffa8cca);
  static final Color colorError = Color(0xffFF7070);
  static Color? colorDisable = Color(0xffadadad);
}

/// This class `AppThemeData` serves to encapsulate creation of ThemeData objects.
class AppThemeData {
  static final ThemeData themeData = ThemeData(
    backgroundColor: AppStyleColor.colorBackground,
    scaffoldBackgroundColor: AppStyleColor.colorBackground,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      actionsIconTheme: IconThemeData(
        color: AppStyleColor.colorPrimary,
      ),
      iconTheme: IconThemeData(
        color: AppStyleColor.colorPrimary,
      ),
      titleTextStyle: TextStyle(
        color: AppStyleColor.colorPrimary,
        fontWeight: FontWeight.bold,
        fontSize: AppStyleFont.large,
      ),
    ),
  );
}

/// This class `AppConstants` keeps device specific measurements like height and width.
class AppConstants {
  static double deviceHeight = 0;
  static double deviceWidth = 0;

  static double refHeight = 812;
  static double refWidth = 375;
}

/// Application level navigator key.
GlobalKey<NavigatorState>? navigatorKey = GlobalKey<NavigatorState>();
