// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../favourites/presentation/provider/favourites_provider.dart';

class WallpaperGridItem extends ConsumerStatefulWidget {
  final String name;
  final String imageAsset;
  final String category;
  final bool isSelected;
  final VoidCallback onTap;

  const WallpaperGridItem({
    super.key,
    required this.name,
    required this.imageAsset,
    required this.category,
    required this.isSelected,
    required this.onTap,
  });

  @override
  ConsumerState<WallpaperGridItem> createState() => _WallpaperGridItemState();
}

class _WallpaperGridItemState extends ConsumerState<WallpaperGridItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isFavorite = ref
        .watch(favouritesProvider.notifier)
        .isFavourite(widget.imageAsset);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            border: widget.isSelected
                ? Border.all(color: AppColors.primary, width: 2.5)
                : null,
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                      color: AppColors.black.withOpacity(0.15),
                      blurRadius: 24,
                      offset: const Offset(0, 10),
                    ),
                  ]
                : [
                    BoxShadow(
                      color: AppColors.black.withOpacity(0.08),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(widget.imageAsset, fit: BoxFit.cover),

                // Gradient Overlay
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        AppColors.black.withOpacity(0.65),
                      ],
                      stops: const [0.5, 1.0],
                    ),
                  ),
                ),

                // Favorite Button
                Positioned(
                  top: 12.h,
                  right: 12.w,
                  child: GestureDetector(
                    onTap: () {
                      ref
                          .read(favouritesProvider.notifier)
                          .toggleFavourite(
                            widget.name,
                            widget.imageAsset,
                            widget.category,
                          );
                    },
                    child: Container(
                      width: 34.w,
                      height: 34.h,
                      decoration: BoxDecoration(
                        color: AppColors.white.withOpacity(0.25),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        size: 18.sp,
                        color: isFavorite ? AppColors.primary : AppColors.white,
                      ),
                    ),
                  ),
                ),

                // Content
                Positioned(
                  left: 16.w,
                  right: 16.w,
                  bottom: 16.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name,
                        style: AppTextStyles.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.white,
                        ),
                      ),
                      SizedBox(height: 6.h),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 4.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(
                            color: AppColors.white.withOpacity(0.3),
                            width: 1,
                          ),
                        ),
                        child: Text(
                          widget.category,
                          style: AppTextStyles.poppins(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
