// ignore_for_file: deprecated_member_use

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';

class WallpaperSetupDialog extends StatefulWidget {
  const WallpaperSetupDialog({super.key});

  @override
  State<WallpaperSetupDialog> createState() => _WallpaperSetupDialogState();
}

class _WallpaperSetupDialogState extends State<WallpaperSetupDialog> {
  String _displayMode = 'Fit';
  bool _autoRotation = true;
  bool _lockWallpaper = true;
  bool _syncAcrossDevices = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Stack(
        children: [
          // Blurred Background (only below header)
          Positioned(
            top: 80.h,
            left: 0,
            right: 0,
            bottom: 0,
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(color: AppColors.black.withOpacity(0.3)),
              ),
            ),
          ),

          // App Header
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 80.h,
              padding: EdgeInsets.symmetric(horizontal: 80.w),
              decoration: BoxDecoration(
                color: AppColors.white,
                border: Border(
                  bottom: BorderSide(
                    color: AppColors.border.withOpacity(0.2),
                    width: 1,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    width: 14.sp,
                    height: 14.sp,
                  ),
                  SizedBox(width: 12.w),
                  Text(
                    'Wallpaper Studio',
                    style: AppTextStyles.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Spacer(),
                  _buildNavItem(Icons.home, 'Home'),
                  SizedBox(width: 32.w),
                  _buildNavItem(Icons.grid_view, 'Browse'),
                  SizedBox(width: 32.w),
                  _buildNavItem(Icons.favorite_border, 'Favourites'),
                  SizedBox(width: 32.w),
                  _buildNavItem(Icons.settings, 'Settings'),
                ],
              ),
            ),
          ),

          // Right Side Panel
          Positioned(
            top: 80.h,
            right: 0,
            bottom: 0,
            width: 480.w,
            child: Material(
              color: AppColors.white,
              elevation: 20,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(40.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Close button
                      Align(
                        alignment: Alignment.topRight,
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () => Navigator.of(context).pop(),
                            child: Container(
                              width: 32.w,
                              height: 32.h,
                              decoration: BoxDecoration(
                                color: AppColors.greyBackground,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.close,
                                size: 18.sp,
                                color: AppColors.textPrimary,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 24.h),

                      // Title
                      Text(
                        'Wallpaper Setup',
                        style: AppTextStyles.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        'Configure your wallpaper settings and enable auto-rotation',
                        style: AppTextStyles.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textSecondary,
                        ),
                      ),
                      SizedBox(height: 32.h),

                      // Activate Wallpaper
                      _buildActivateSection(),
                      SizedBox(height: 32.h),

                      // Display Mode
                      _buildDisplayModeSection(),
                      SizedBox(height: 32.h),

                      // Auto Rotation
                      _buildAutoRotationSection(),
                      SizedBox(height: 32.h),

                      // Advanced Settings
                      _buildAdvancedSettingsSection(),
                      SizedBox(height: 40.h),

                      // Action Buttons
                      Row(
                        children: [
                          Expanded(
                            child: MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                onTap: () => Navigator.of(context).pop(),
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 14.h),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.circular(12.r),
                                    border: Border.all(
                                      color: AppColors.greyLight,
                                      width: 1.5,
                                    ),
                                  ),
                                  child: Text(
                                    'Cancel',
                                    style: AppTextStyles.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.textPrimary,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                            child: MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pop();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: const Text(
                                        'Wallpaper settings saved!',
                                      ),
                                      backgroundColor: Colors.green,
                                      behavior: SnackBarBehavior.floating,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          10.r,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 14.h),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: AppColors.primary,
                                    borderRadius: BorderRadius.circular(12.r),
                                    boxShadow: [
                                      BoxShadow(
                                        color: AppColors.primary.withOpacity(
                                          0.3,
                                        ),
                                        blurRadius: 12,
                                        offset: const Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                  child: Text(
                                    'Save Settings',
                                    style: AppTextStyles.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label) {
    return Row(
      children: [
        Icon(icon, size: 16.sp, color: AppColors.textSecondary),
        SizedBox(width: 8.w),
        Text(
          label,
          style: AppTextStyles.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildActivateSection() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.greyBackground,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Activate Wallpaper',
                  style: AppTextStyles.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textPrimary,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  'Set this wallpaper as your desktop background',
                  style: AppTextStyles.poppins(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(color: Colors.green, width: 1),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.check_circle, color: Colors.green, size: 14.sp),
                SizedBox(width: 4.w),
                Text(
                  'Activated',
                  style: AppTextStyles.poppins(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDisplayModeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Display mode',
          style: AppTextStyles.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: 16.h),
        _buildRadioOption(
          'Fit',
          'Scale to fit without cropping',
          _displayMode == 'Fit',
          () => setState(() => _displayMode = 'Fit'),
        ),
        SizedBox(height: 12.h),
        _buildRadioOption(
          'Fill',
          'Scale to fill the entire screen',
          _displayMode == 'Fill',
          () => setState(() => _displayMode = 'Fill'),
        ),
        SizedBox(height: 12.h),
        _buildRadioOption(
          'Stretch',
          'Stretch to fill the screen',
          _displayMode == 'Stretch',
          () => setState(() => _displayMode = 'Stretch'),
        ),
        SizedBox(height: 12.h),
        _buildRadioOption(
          'Tile',
          'Repeat the image to fill the screen',
          _displayMode == 'Tile',
          () => setState(() => _displayMode = 'Tile'),
        ),
      ],
    );
  }

  Widget _buildRadioOption(
    String title,
    String subtitle,
    bool isSelected,
    VoidCallback onTap,
  ) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(12.w),
          decoration: BoxDecoration(
            color: isSelected
                ? AppColors.primary.withOpacity(0.05)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(
              color: isSelected ? AppColors.primary : AppColors.greyLight,
              width: 1.5,
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 20.w,
                height: 20.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isSelected ? AppColors.primary : AppColors.grey,
                    width: 2,
                  ),
                ),
                child: isSelected
                    ? Center(
                        child: Container(
                          width: 10.w,
                          height: 10.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primary,
                          ),
                        ),
                      )
                    : null,
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTextStyles.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      subtitle,
                      style: AppTextStyles.poppins(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textSecondary,
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

  Widget _buildAutoRotationSection() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.greyBackground,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Auto - Rotation',
                  style: AppTextStyles.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textPrimary,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  'Automatically change your wallpaper at regular intervals',
                  style: AppTextStyles.poppins(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          Switch(
            value: _autoRotation,
            onChanged: (value) => setState(() => _autoRotation = value),
            activeColor: AppColors.primary,
            activeTrackColor: AppColors.primary.withOpacity(0.5),
          ),
        ],
      ),
    );
  }

  Widget _buildAdvancedSettingsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Advanced Settings',
          style: AppTextStyles.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: 16.h),
        _buildCheckboxOption(
          'Lock Wallpaper',
          'Prevent accidental changes',
          _lockWallpaper,
          (value) => setState(() => _lockWallpaper = value ?? false),
        ),
        SizedBox(height: 12.h),
        _buildCheckboxOption(
          'Sync Across Devices',
          'Keep wallpaper consistent on all devices',
          _syncAcrossDevices,
          (value) => setState(() => _syncAcrossDevices = value ?? false),
        ),
      ],
    );
  }

  Widget _buildCheckboxOption(
    String title,
    String subtitle,
    bool isChecked,
    Function(bool?) onChanged,
  ) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => onChanged(!isChecked),
        child: Container(
          padding: EdgeInsets.all(12.w),
          decoration: BoxDecoration(
            color: isChecked
                ? AppColors.primary.withOpacity(0.05)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(
              color: isChecked ? AppColors.primary : AppColors.greyLight,
              width: 1.5,
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 20.w,
                height: 20.h,
                decoration: BoxDecoration(
                  color: isChecked ? AppColors.primary : Colors.transparent,
                  borderRadius: BorderRadius.circular(4.r),
                  border: Border.all(
                    color: isChecked ? AppColors.primary : AppColors.grey,
                    width: 2,
                  ),
                ),
                child: isChecked
                    ? Icon(Icons.check, size: 14.sp, color: AppColors.white)
                    : null,
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTextStyles.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      subtitle,
                      style: AppTextStyles.poppins(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textSecondary,
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
