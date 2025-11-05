import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color primary = Color(0xFFFBB03B);
  static const Color secondary = Color(0xFFEC0C43);
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color grey = Color(0xFF575757);
  static const Color greyLight = Color(0xFFCFCFCF);
  static const Color greyBackground = Color(0xFFF5F5F5);
  static const Color greyMedium = Color(0xFF808080);

  static const Color textPrimary = black;
  static const Color textSecondary = grey;
  static const Color textTertiary = greyMedium;
  static const Color textWhite = white;

  static const Color background = white;
  static const Color backgroundGrey = greyBackground;
  static const Color border = greyLight;

  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [primary, secondary],
  );
}
