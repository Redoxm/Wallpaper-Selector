// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';

class ActiveWallpaperSection extends StatelessWidget {
  final String imageAsset;
  final String category;
  final String selection;

  const ActiveWallpaperSection({
    super.key,
    required this.imageAsset,
    required this.category,
    required this.selection,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 80.w),
      padding: EdgeInsets.all(32.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Wallpaper Thumbnail
          Container(
            width: 117.77.w,
            height: 210.33.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(26.r),
              border: Border.all(color: AppColors.primary, width: 3),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(23.r),
              child: Image.asset(imageAsset, fit: BoxFit.cover),
            ),
          ),

          SizedBox(width: 32.w),

          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title with gradient
                ShaderMask(
                  shaderCallback: (bounds) =>
                      AppColors.primaryGradient.createShader(bounds),
                  child: Text(
                    'Your Active Wallpaper',
                    style: AppTextStyles.poppins(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                    ).copyWith(color: AppColors.white),
                  ),
                ),

                SizedBox(height: 8.h),

                // Subtitle
                Text(
                  'This wallpaper is currently set as your active background',
                  style: AppTextStyles.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textSecondary,
                  ),
                ),

                SizedBox(height: 24.h),

                // Category and Selection info
                Row(
                  children: [
                    Text(
                      'Category - ',
                      style: AppTextStyles.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    Text(
                      category,
                      style: AppTextStyles.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 8.h),

                Row(
                  children: [
                    Text(
                      'Selection - ',
                      style: AppTextStyles.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    Text(
                      selection,
                      style: AppTextStyles.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Action Icons
          Column(
            children: [
              _buildIconButton(Icons.share_outlined),
              SizedBox(height: 16.h),
              _buildIconButton(Icons.settings_outlined),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildIconButton(IconData icon) {
    return Container(
      width: 40.w,
      height: 40.h,
      decoration: BoxDecoration(
        color: AppColors.greyBackground,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Icon(icon, size: 20.sp, color: AppColors.textSecondary),
    );
  }
}
