import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextStyle poppins({
    required double fontSize,
    required FontWeight fontWeight,
    Color? color,
  }) {
    return GoogleFonts.poppins(
      fontSize: fontSize.sp,
      fontWeight: fontWeight,
      color: color ?? AppColors.textPrimary,
    );
  }

  static TextStyle heading1 = poppins(
    fontSize: 32,
    fontWeight: FontWeight.w700,
  );
  static TextStyle heading2 = poppins(
    fontSize: 24,
    fontWeight: FontWeight.w700,
  );
  static TextStyle heading3 = poppins(
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );
  static TextStyle bodyLarge = poppins(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
  static TextStyle bodyMedium = poppins(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
  static TextStyle bodySmall = poppins(
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );
  static TextStyle button = poppins(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textWhite,
  );
  static TextStyle caption = poppins(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
  );
}
