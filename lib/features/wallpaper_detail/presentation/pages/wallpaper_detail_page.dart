import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../home/presentation/widgets/app_header.dart';
import '../../../favourites/presentation/provider/favourites_provider.dart';
import '../widgets/phone_mockup.dart';
import '../widgets/wallpaper_grid_item.dart';
import '../widgets/wallpaper_setup_dialog.dart';

class WallpaperDetailPage extends ConsumerStatefulWidget {
  final String category;

  const WallpaperDetailPage({super.key, required this.category});

  @override
  ConsumerState<WallpaperDetailPage> createState() =>
      _WallpaperDetailPageState();
}

class _WallpaperDetailPageState extends ConsumerState<WallpaperDetailPage> {
  bool _isGridView = true;
  int _selectedIndex = 0;

  // Sample wallpapers for the category
  final List<Map<String, dynamic>> _wallpapers = [
    {
      'name': 'Nature 1',
      'image': 'assets/images/flower.jpg',
      'tags': ['Nature', 'Ambiance', 'Flowers'],
    },
    {
      'name': 'Nature 2',
      'image': 'assets/images/montain.jpg',
      'tags': ['Nature', 'Mountains', 'Sky'],
    },
    {
      'name': 'Nature 3',
      'image': 'assets/images/trees.jpg',
      'tags': ['Nature', 'Forest', 'Sunset'],
    },
    {
      'name': 'Nature 4',
      'image': 'assets/images/cloud.jpg',
      'tags': ['Nature', 'Ocean', 'Waves'],
    },
    {
      'name': 'Nature 5',
      'image': 'assets/images/night.jpg',
      'tags': ['Nature', 'Lake', 'Trees'],
    },
    {
      'name': 'Nature 6',
      'image': 'assets/images/sea.jpg',
      'tags': ['Nature', 'Valley', 'River'],
    },
  ];

  @override
  Widget build(BuildContext context) {
    final selectedWallpaper = _wallpapers[_selectedIndex];

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          const AppHeader(),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 80.w, vertical: 40.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Left Side - Wallpaper Grid
                    Expanded(flex: 6, child: _buildLeftSide()),

                    SizedBox(width: 60.w),

                    // Right Side - Preview
                    Expanded(
                      flex: 4,
                      child: _buildRightSide(selectedWallpaper),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLeftSide() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Back Button
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () => context.pop(),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.arrow_back, size: 15.58.sp, color: AppColors.black),
                SizedBox(width: 8.w),
                Text(
                  'Back to Categories',
                  style: AppTextStyles.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: AppColors.greyMedium,
                  ),
                ),
              ],
            ),
          ),
        ),

        SizedBox(height: 32.h),

        // Category Title and Toggle
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.category,
              style: AppTextStyles.poppins(
                fontSize: 36,
                fontWeight: FontWeight.w600,
              ),
            ),
            Row(
              children: [
                _buildToggleButton(
                  icon: Icons.grid_view_rounded,
                  isActive: _isGridView,
                  onTap: () => setState(() => _isGridView = true),
                ),
                SizedBox(width: 10.w),
                _buildToggleButton(
                  icon: Icons.view_list_rounded,
                  isActive: !_isGridView,
                  onTap: () => setState(() => _isGridView = false),
                ),
              ],
            ),
          ],
        ),

        SizedBox(height: 24.h),

        // Wallpaper Grid
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 24.w,
            mainAxisSpacing: 24.h,
            childAspectRatio: 0.68,
          ),
          itemCount: _wallpapers.length,
          itemBuilder: (context, index) {
            final wallpaper = _wallpapers[index];
            return WallpaperGridItem(
              name: wallpaper['name'],
              imageAsset: wallpaper['image'],
              category: widget.category,
              isSelected: _selectedIndex == index,
              onTap: () => setState(() => _selectedIndex = index),
            );
          },
        ),
      ],
    );
  }

  Widget _buildRightSide(Map<String, dynamic> wallpaper) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Preview Title
        Text(
          'Preview',
          style: AppTextStyles.poppins(
            fontSize: 32,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
        ),

        SizedBox(height: 24.h),

        // Phone Mockup and Info in Row
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name',
                    style: AppTextStyles.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.greyMedium,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    wallpaper['name'],
                    style: AppTextStyles.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black,
                    ),
                  ),

                  SizedBox(height: 16.h),

                  // Tags
                  Text(
                    'Tags',
                    style: AppTextStyles.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.greyMedium,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Wrap(
                    spacing: 6.w,
                    runSpacing: 6.h,
                    children: (wallpaper['tags'] as List<String>).map((tag) {
                      return Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 5.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.greyBackground,
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                        child: Text(
                          tag,
                          style: AppTextStyles.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.black,
                          ),
                        ),
                      );
                    }).toList(),
                  ),

                  SizedBox(height: 16.h),

                  // Description
                  Text(
                    'Description',
                    style: AppTextStyles.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.greyMedium,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    'Discover the pure beauty of "Natural Essence" – your gateway to authentic, nature-inspired experiences. Let this unique collection elevate your senses and connect you with the unrefined al...',
                    style: AppTextStyles.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black,
                    ),
                  ),

                  SizedBox(height: 16.h),

                  // Action Icons
                  Row(
                    children: [
                      _buildActionIcon(Icons.share_outlined, () {}),
                      SizedBox(width: 8.w),
                      _buildActionIcon(Icons.edit_outlined, () {
                        _showWallpaperSetupDialog(context);
                      }),
                      SizedBox(width: 8.w),
                      _buildActionIcon(Icons.settings_outlined, () {}),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(width: 32.w),

            // Right - Phone Mockup
            PhoneMockup(imageAsset: wallpaper['image']),
          ],
        ),

        SizedBox(height: 32.h),

        // Action Buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer(
              builder: (context, ref, child) {
                final isFavorite = ref
                    .watch(favouritesProvider.notifier)
                    .isFavourite(wallpaper['image']);

                return OutlinedButton(
                  onPressed: () {
                    ref
                        .read(favouritesProvider.notifier)
                        .toggleFavourite(
                          wallpaper['name'],
                          wallpaper['image'],
                          widget.category,
                        );
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: isFavorite
                        ? Colors.red
                        : AppColors.textPrimary,
                    side: BorderSide(
                      color: isFavorite ? Colors.red : AppColors.border,
                      width: 1.5,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.w,
                      vertical: 14.h,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        size: 18.sp,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        isFavorite
                            ? 'Remove from Favorites'
                            : 'Save to Favorites',
                        style: AppTextStyles.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(width: 12.w),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                shadowColor: Colors.transparent,
                padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 14.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              child: Text(
                'Set as Wallpaper',
                style: AppTextStyles.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.white,
                ),
              ),
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
          width: 40.w,
          height: 40.h,
          decoration: BoxDecoration(
            color: isActive ? AppColors.primary : AppColors.greyBackground,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Icon(
            icon,
            size: 20.sp,
            color: isActive ? AppColors.white : AppColors.textSecondary,
          ),
        ),
      ),
    );
  }

  Widget _buildActionIcon(IconData icon, VoidCallback onTap) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 36.w,
          height: 36.h,
          decoration: BoxDecoration(
            color: AppColors.greyBackground,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Icon(icon, size: 18.sp, color: AppColors.textSecondary),
        ),
      ),
    );
  }

  void _showWallpaperSetupDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierColor: Colors.transparent,
      builder: (context) => const WallpaperSetupDialog(),
    );
  }
}
