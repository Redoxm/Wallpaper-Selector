// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../home/presentation/widgets/app_header.dart';
import '../provider/favourites_provider.dart';
import '../widgets/favourite_wallpaper_card.dart';

class FavouritesPage extends ConsumerWidget {
  const FavouritesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favourites = ref.watch(favouritesProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          const AppHeader(),
          Expanded(
            child: favourites.isEmpty
                ? _buildEmptyState(context)
                : _buildFavouritesGrid(context, ref, favourites),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 80.w, vertical: 40.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title with gradient
            ShaderMask(
              shaderCallback: (bounds) =>
                  AppColors.primaryGradient.createShader(bounds),
              child: Text(
                'Saved Wallpapers',
                style: AppTextStyles.poppins(
                  fontSize: 60,
                  fontWeight: FontWeight.w500,
                ).copyWith(color: AppColors.white),
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'Your saved wallpapers collection',
              style: AppTextStyles.poppins(
                fontSize: 24,
                fontWeight: FontWeight.w400,
                color: AppColors.grey,
              ),
            ),
            SizedBox(height: 120.h),

            // Center the empty state content
            Center(
              child: Column(
                children: [
                  // Empty Icon
                  Icon(
                    Icons.image_not_supported_outlined,
                    size: 150.sp,
                    color: AppColors.textSecondary.withOpacity(0.3),
                  ),
                  SizedBox(height: 24.h),

                  // Empty Message
                  Text(
                    'No Saved Wallpapers',
                    style: AppTextStyles.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: AppColors.grey,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    'Start saving your favorite wallpapers to see them here',
                    style: AppTextStyles.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.grey,
                    ),
                  ),
                  SizedBox(height: 28.h),

                  // Browse Button
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () => context.go('/browse'),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 32.w,
                          vertical: 14.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(21.r),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primary.withOpacity(0.3),
                              blurRadius: 12,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Text(
                          'Browse Wallpapers',
                          style: AppTextStyles.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFavouritesGrid(
    BuildContext context,
    WidgetRef ref,
    List<FavouriteWallpaper> favourites,
  ) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 80.w, vertical: 40.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title Section with gradient
            ShaderMask(
              shaderCallback: (bounds) =>
                  AppColors.primaryGradient.createShader(bounds),
              child: Text(
                'Saved Wallpapers',
                style: AppTextStyles.poppins(
                  fontSize: 60,
                  fontWeight: FontWeight.w500,
                ).copyWith(color: AppColors.white),
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'Your saved wallpapers collection',
              style: AppTextStyles.poppins(
                fontSize: 24,
                fontWeight: FontWeight.w400,
                color: AppColors.grey,
              ),
            ),
            SizedBox(height: 40.h),

            // Grid
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 6,
                crossAxisSpacing: 24.w,
                mainAxisSpacing: 24.h,
                childAspectRatio: 0.75,
              ),
              itemCount: favourites.length,
              itemBuilder: (context, index) {
                final wallpaper = favourites[index];
                return FavouriteWallpaperCard(
                  name: wallpaper.name,
                  imageAsset: wallpaper.imageAsset,
                  category: wallpaper.category,
                  onTap: () {
                    context.go('/wallpaper/${wallpaper.category}');
                  },
                  onRemove: () {
                    ref
                        .read(favouritesProvider.notifier)
                        .removeFavourite(wallpaper.imageAsset);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
