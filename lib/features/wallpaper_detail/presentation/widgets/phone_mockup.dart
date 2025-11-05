// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';

class PhoneMockup extends StatelessWidget {
  final String imageAsset;

  const PhoneMockup({super.key, required this.imageAsset});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 258.04.w,
      height: 524.99.h,
      decoration: BoxDecoration(
        color: AppColors.black,
        borderRadius: BorderRadius.circular(50.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.3),
            blurRadius: 40,
            spreadRadius: 0,
            offset: const Offset(0, 15),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Phone Screen - Image fills completely
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.all(10.w),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(42.r),
                child: Image.asset(imageAsset, fit: BoxFit.cover),
              ),
            ),
          ),

          // Dynamic Island / Notch (Modern iPhone style)
          Positioned(
            top: 16.h,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: 100.w,
                height: 28.h,
                decoration: BoxDecoration(
                  color: AppColors.black,
                  borderRadius: BorderRadius.circular(18.r),
                ),
              ),
            ),
          ),

          // Home Indicator (bottom bar)
          Positioned(
            bottom: 10.h,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: 110.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: AppColors.white.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
