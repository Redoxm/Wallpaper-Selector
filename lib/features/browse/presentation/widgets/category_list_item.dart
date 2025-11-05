// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';

class CategoryListItem extends StatefulWidget {
  final String title;
  final String description;
  final String wallpaperCount;
  final String imageAsset;
  final VoidCallback onTap;

  const CategoryListItem({
    super.key,
    required this.title,
    required this.description,
    required this.wallpaperCount,
    required this.imageAsset,
    required this.onTap,
  });

  @override
  State<CategoryListItem> createState() => _CategoryListItemState();
}

class _CategoryListItemState extends State<CategoryListItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: EdgeInsets.only(bottom: 20.h),
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            color: _isHovered ? AppColors.greyBackground : AppColors.white,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(
              color: AppColors.border.withOpacity(0.3),
              width: 1,
            ),
          ),
          child: Row(
            children: [
              // Thumbnail
              Container(
                width: 272.21.w,
                height: 185.12.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.56.r),
                  border: Border.all(
                    color: AppColors.border.withOpacity(0.9),
                    width: 1,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(11.r),
                  child: Image.asset(widget.imageAsset, fit: BoxFit.cover),
                ),
              ),

              SizedBox(width: 24.w),

              // Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: AppTextStyles.poppins(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      widget.description,
                      style: AppTextStyles.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.greyMedium.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Text(
                        widget.wallpaperCount,
                        style: AppTextStyles.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black,
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
    );
  }
}
