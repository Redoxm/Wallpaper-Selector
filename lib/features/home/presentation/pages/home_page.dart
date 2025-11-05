import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../widgets/app_header.dart';
import '../widgets/category_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                    _buildHeroSection(),
                    SizedBox(height: 60.h),
                    _buildCategoriesSection(context),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeroSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShaderMask(
          shaderCallback: (bounds) =>
              AppColors.primaryGradient.createShader(bounds),
          child: Text(
            'Discover Beautiful Wallpapers',
            style: AppTextStyles.poppins(
              fontSize: 60,
              fontWeight: FontWeight.w500,
            ).copyWith(color: AppColors.white),
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          'Discover curated collections of stunning wallpapers. Browse by\ncategory, preview in full-screen, and set your favorites.',
          style: AppTextStyles.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: AppColors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildCategoriesSection(BuildContext context) {
    final categories = [
      {
        'title': 'Nature',
        'desc': 'Mountains, Forest and Landscapes',
        'count': '3 wallpapers',
        'image': 'assets/images/forest.jpg',
      },
      {
        'title': 'Abstract',
        'desc': 'Modern Geometric and artistic designs',
        'count': '4 wallpapers',
        'image': 'assets/images/sky.jpg',
      },
      {
        'title': 'Urban',
        'desc': 'Cities, architecture and street',
        'count': '6 wallpapers',
        'image': 'assets/images/cool.jpg',
      },
      {
        'title': 'Space',
        'desc': 'Cosmos, planets, and galaxies',
        'count': '3 wallpapers',
        'image': 'assets/images/space.jpg',
      },
      {
        'title': 'Minimalist',
        'desc': 'Clean, simple, and elegant',
        'count': '8 wallpapers',
        'image': 'assets/images/cup.jpg',
      },
      {
        'title': 'Animals',
        'desc': 'Wildlife and nature photography',
        'count': '4 wallpapers',
        'image': 'assets/images/fox.jpg',
      },
    ];

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Categories',
              style: AppTextStyles.poppins(
                fontSize: 32,
                fontWeight: FontWeight.w500,
                color: AppColors.textPrimary,
              ),
            ),
            Text(
              'See All',
              style: AppTextStyles.poppins(
                fontSize: 24,
                fontWeight: FontWeight.w400,
                color: AppColors.greyMedium,
              ),
            ),
          ],
        ),
        SizedBox(height: 32.h),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 24.w,
            mainAxisSpacing: 24.h,
            childAspectRatio: 435.33 / 290.71,
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final cat = categories[index];
            return GestureDetector(
              onTap: () {
                context.push(
                  '/home-active',
                  extra: {
                    'image': cat['image']!,
                    'category': cat['title']!,
                    'selection': 'Wallpaper 5',
                  },
                );
              },
              child: CategoryCard(
                title: cat['title']!,
                description: cat['desc']!,
                wallpaperCount: cat['count']!,
                imageAsset: cat['image']!,
              ),
            );
          },
        ),
      ],
    );
  }
}
