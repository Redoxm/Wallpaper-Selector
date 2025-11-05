// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../widgets/app_header.dart';
import '../widgets/category_card.dart';

class HomePageWithActive extends StatelessWidget {
  final String imageAsset;
  final String category;
  final String selection;

  const HomePageWithActive({
    super.key,
    required this.imageAsset,
    required this.category,
    required this.selection,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          const AppHeader(),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 80.w, vertical: 40.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildActiveWallpaperSection(),
                    SizedBox(height: 60.h),
                    _buildCategoriesSection(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActiveWallpaperSection() {
    return Container(
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
              //border: Border.all(color: AppColors.primary, width: 3),
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
                ShaderMask(
                  shaderCallback: (bounds) =>
                      AppColors.primaryGradient.createShader(bounds),
                  child: Text(
                    'Your Active Wallpaper',
                    style: AppTextStyles.poppins(
                      fontSize: 36,
                      fontWeight: FontWeight.w500,
                    ).copyWith(color: AppColors.white),
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  'This wallpaper is currently set as your active background',
                  style: AppTextStyles.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: AppColors.greyMedium,
                  ),
                ),
                SizedBox(height: 24.h),
                Row(
                  children: [
                    Text(
                      'Category - ',
                      style: AppTextStyles.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColors.greyMedium,
                      ),
                    ),
                    Text(
                      category,
                      style: AppTextStyles.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
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
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColors.greyMedium,
                      ),
                    ),
                    Text(
                      selection,
                      style: AppTextStyles.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Action Icons
          Row(
            children: [
              _buildIconButton(Icons.share_outlined),
              SizedBox(width: 16.w),
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

  Widget _buildCategoriesSection() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Categories',
              style: AppTextStyles.poppins(
                fontSize: 32.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.black,
              ),
            ),
            Text(
              'See All',
              style: AppTextStyles.poppins(
                fontSize: 24.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.greyMedium,
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 3,
          crossAxisSpacing: 24.w,
          mainAxisSpacing: 24.h,
          childAspectRatio: 435.33 / 290.71,
          children: [
            CategoryCard(
              title: 'Nature',
              description: 'Mountains, Forest and Landscapes',
              wallpaperCount: '3 wallpapers',
              imageAsset: 'assets/images/forest.jpg',
            ),
            CategoryCard(
              title: 'Abstract',
              description: 'Modern Geometric and artistic designs',
              wallpaperCount: '4 wallpapers',
              imageAsset: 'assets/images/sky.jpg',
            ),
            CategoryCard(
              title: 'Urban',
              description: 'Cities, architecture and street',
              wallpaperCount: '6 wallpapers',
              imageAsset: 'assets/images/cool.jpg',
            ),
            CategoryCard(
              title: 'Space',
              description: 'Cosmos, planets, and galaxies',
              wallpaperCount: '3 wallpapers',
              imageAsset: 'assets/images/space.jpg',
            ),
            CategoryCard(
              title: 'Minimalist',
              description: 'Clean, simple, and elegant',
              wallpaperCount: '8 wallpapers',
              imageAsset: 'assets/images/cup.jpg',
            ),
            CategoryCard(
              title: 'Animals',
              description: 'Wildlife and nature photography',
              wallpaperCount: '4 wallpapers',
              imageAsset: 'assets/images/fox.jpg',
            ),
          ],
        ),
      ],
    );
  }
}
