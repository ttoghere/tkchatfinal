import 'package:flutter/material.dart';

import 'color.dart';

class AppTheme {
  static const horizontalMargin = 16.0;
  static const radius = 10.0;

  static ThemeData light = ThemeData(
    scaffoldBackgroundColor: AppColor.scaffoldBackground,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    primaryColor: AppColor.accentColor,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: AppColor.accentColor,
      brightness: Brightness.light,
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(
        color: AppColor.primaryText,
      ),
      titleTextStyle: TextStyle(
        color: AppColor.primaryText,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      toolbarTextStyle: TextStyle(
        color: AppColor.primaryText,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColor.scaffoldBackground,
      unselectedLabelStyle: TextStyle(fontSize: 12),
      selectedLabelStyle: TextStyle(fontSize: 12),
      unselectedItemColor: Color(0xffA2A5B9),
      selectedItemColor: AppColor.accentColor,
    ),
    tabBarTheme: const TabBarTheme(
      indicatorSize: TabBarIndicatorSize.label,
      labelColor: AppColor.accentColor,
      unselectedLabelColor: AppColor.secondaryText,
    ),
  );
}
