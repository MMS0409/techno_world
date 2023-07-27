import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'colors/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.white,
        statusBarBrightness: Brightness.dark,
      ),
    ),
  );

  static ThemeData myTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.c_111015,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedIconTheme: IconThemeData(
        size: 30
      ),
      backgroundColor: Colors.yellow,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black54,
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      titleTextStyle: const TextStyle(
      fontWeight: FontWeight.w600,
      color: Colors.white,
      fontFamily: "Montserrat"
      ),
      backgroundColor: AppColors.c_111015,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.c_111015,
        statusBarBrightness: Brightness.light,
      ),
    ),
  );
}
