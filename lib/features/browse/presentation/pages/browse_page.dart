// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../home/presentation/widgets/app_header.dart';
import '../../../home/presentation/widgets/category_card.dart';
import '../widgets/category_list_item.dart';

class BrowsePage extends StatefulWidget {
  const BrowsePage({super.key});

  @override
  State<BrowsePage> createState() => _BrowsePageState();
}

class _BrowsePageState extends State<BrowsePage> {
  bool _isGridView = true; // true = grid, false = list

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
                    _buildHeader(),
                    SizedBox(height: 40.h),
                    _isGridView ? _buildGridView() : _buildListView(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShaderMask(
              shaderCallback: (bounds) =>
                  AppColors.primaryGradient.createShader(bounds),
              child: Text(
                'Browse Categories',
                style: AppTextStyles.poppins(
                  fontSize: 60,
                  fontWeight: FontWeight.w500,
                ).copyWith(color: AppColors.white),
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'Explore our curated collections of stunning wallpapers',
              style: AppTextStyles.poppins(
                fontSize: 24,
                fontWeight: FontWeight.w400,
                color: AppColors.grey,
              ),
            ),
          ],
        ),
        // Toggle Buttons
        Row(
          children: [
            _buildToggleButton(
              icon: Icons.grid_view_rounded,
              isActive: _isGridView,
              onTap: () => setState(() => _isGridView = true),
            ),
            SizedBox(width: 12.w),
            _buildToggleButton(
              icon: Icons.view_list_rounded,
              isActive: !_isGridView,
              onTap: () => setState(() => _isGridView = false),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildToggleButton({
    required IconData icon,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 26.94.w,
          height: 26.94.h,
          decoration: BoxDecoration(
            color: isActive
                ? AppColors.primary.withOpacity(0.1)
                : AppColors.greyBackground,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Icon(
            icon,
            size: 20.sp,
            color: isActive ? AppColors.primary : AppColors.greyLight,
          ),
        ),
      ),
    );
  }

  Widget _buildGridView() {
    return GridView.builder(
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
          onTap: () => context.push('/wallpaper/${cat['title']}'),
          child: CategoryCard(
            title: cat['title']!,
            description: cat['desc']!,
            wallpaperCount: cat['count']!,
            imageAsset: cat['image']!,
          ),
        );
      },
    );
  }

  Widget _buildListView() {
    return Column(
      children: categories.map((cat) {
        return CategoryListItem(
          title: cat['title']!,
          description: cat['desc']!,
          wallpaperCount: cat['count']!,
          imageAsset: cat['image']!,
          onTap: () {
            // Handle tap
          },
        );
      }).toList(),
    );
  }
}
