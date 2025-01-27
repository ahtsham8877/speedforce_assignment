import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speed_force/app/app_constant/app_colors.dart';

class AppThemes {
  static const String englishFontFamily = 'Kanit';
  static const String urduFontFamily = 'JNNR';

  static ThemeData getTheme(Brightness brightness) {
    bool isUrdu = Get.locale?.languageCode == 'ur';
    final backgroundColor =
        brightness == Brightness.light ? Colors.white : Colors.black;
    final surfaceColor =
        brightness == Brightness.light ? Colors.grey[100] : Colors.grey[800];

    // Define common colors

    // Define text themes
    final textTheme = TextTheme(
      bodyLarge: TextStyle(
        fontFamily: isUrdu ? urduFontFamily : englishFontFamily,
        fontSize: 18,
        color: brightness == Brightness.light ? Colors.black : Colors.white,
      ),
      bodyMedium: TextStyle(
        fontFamily: isUrdu ? urduFontFamily : englishFontFamily,
        fontSize: 16,
        color: brightness == Brightness.light ? Colors.black87 : Colors.white70,
      ),
      bodySmall: TextStyle(
        fontFamily: isUrdu ? urduFontFamily : englishFontFamily,
        fontSize: 14,
        color: brightness == Brightness.light ? Colors.black87 : Colors.white70,
      ),
      displayLarge: TextStyle(
        fontFamily: isUrdu ? urduFontFamily : englishFontFamily,
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: brightness == Brightness.light ? Colors.black : Colors.white,
      ),
      titleSmall: TextStyle(
        fontFamily: isUrdu ? urduFontFamily : englishFontFamily,
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        color: brightness == Brightness.light ? Colors.black87 : Colors.white70,
      ),
      titleMedium: TextStyle(
        fontFamily: isUrdu ? urduFontFamily : englishFontFamily,
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: brightness == Brightness.light ? Colors.black87 : Colors.white70,
      ),
    );

    // Define input decoration theme
    final inputDecorationTheme = InputDecorationTheme(
      filled: true,
      fillColor: surfaceColor,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: brightness == Brightness.light ? Colors.grey : Colors.white70,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColors.kPrimary, width: 2),
      ),
      labelStyle: TextStyle(
        fontFamily: isUrdu ? urduFontFamily : englishFontFamily,
        color: brightness == Brightness.light ? Colors.black : Colors.white70,
      ),
      hintStyle: TextStyle(
        fontFamily: isUrdu ? urduFontFamily : englishFontFamily,
        color: Colors.grey,
      ),
    );

    // Define button theme
    final buttonTheme = ButtonThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      buttonColor: AppColors.kPrimary,
      textTheme: ButtonTextTheme.primary,
    );

    // Define elevated button theme
    final elevatedButtonTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: AppColors.kPrimary,
        textStyle: TextStyle(
          fontFamily: isUrdu ? urduFontFamily : englishFontFamily,
          fontSize: 16,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );

    return ThemeData(
      brightness: brightness,
      primaryColor: AppColors.kPrimary,
      // accentColor: accentColor,
      // backgroundColor: backgroundColor,
      scaffoldBackgroundColor: backgroundColor,
      // surfaceColor: surfaceColor,
      // errorColor: errorColor,
      textTheme: textTheme,
      inputDecorationTheme: inputDecorationTheme,
      buttonTheme: buttonTheme,
      elevatedButtonTheme: elevatedButtonTheme,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.kPrimary,
        foregroundColor: Colors.white,
        elevation: 0,
        titleTextStyle: TextStyle(
          fontFamily: isUrdu ? urduFontFamily : englishFontFamily,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      cardTheme: CardTheme(
        color: surfaceColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 4,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.kPrimary,
        foregroundColor: Colors.white,
      ),
    );
  }
}
