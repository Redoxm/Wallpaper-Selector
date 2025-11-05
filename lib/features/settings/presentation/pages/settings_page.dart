// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../home/presentation/widgets/app_header.dart';
import '../provider/settings_provider.dart';
import '../widgets/device_status_mockup.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsProvider);

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
                    // Title with gradient
                    ShaderMask(
                      shaderCallback: (bounds) =>
                          AppColors.primaryGradient.createShader(bounds),
                      child: Text(
                        'Settings',
                        style: AppTextStyles.poppins(
                          fontSize: 60,
                          fontWeight: FontWeight.w500,
                        ).copyWith(color: AppColors.white),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'Customize your Wallpaper Studio experience',
                      style: AppTextStyles.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                        color: AppColors.grey,
                      ),
                    ),
                    SizedBox(height: 40.h),

                    // Settings Content
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Left side - Settings form
                        Expanded(
                          flex: 6,
                          child: _buildSettingsForm(context, ref, settings),
                        ),
                        SizedBox(width: 60.w),

                        // Right side - Device mockup
                        Expanded(
                          flex: 4,
                          child: Center(
                            child: DeviceStatusMockup(
                              isConnected: settings.isConnectedToDevice,
                              onConnectionToggle: () {
                                ref
                                    .read(settingsProvider.notifier)
                                    .toggleDeviceConnection();
                              },
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
        ],
      ),
    );
  }

  Widget _buildSettingsForm(
    BuildContext context,
    WidgetRef ref,
    SettingsState settings,
  ) {
    return Container(
      padding: EdgeInsets.all(40.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section title
          Text(
            'Wallpaper Setup',
            style: AppTextStyles.poppins(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: AppColors.black,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            'Configure your wallpaper settings and enable auto-rotation',
            style: AppTextStyles.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.black,
            ),
          ),
          SizedBox(height: 32.h),

          // Image Quality Dropdown
          _buildDropdownField(
            label: 'Image Quality',
            value: settings.imageQuality,
            items: [
              'High ( Best Quality )',
              'Medium ( Balanced )',
              'Low ( Fast Loading )',
            ],
            onChanged: (value) {
              if (value != null) {
                ref.read(settingsProvider.notifier).setImageQuality(value);
              }
            },
          ),
          SizedBox(height: 24.h),

          // Notification Toggle
          _buildToggleField(
            label: 'Notification',
            description: 'Get notified about new wallpapers and updates',
            value: settings.notificationsEnabled,
            onChanged: (value) {
              ref.read(settingsProvider.notifier).toggleNotifications(value);
            },
          ),
          SizedBox(height: 40.h),

          // Action Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Cancel Button
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    ref.read(settingsProvider.notifier).resetSettings();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 32.w,
                      vertical: 12.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(21.r),
                      border: Border.all(
                        color: AppColors.greyLight,
                        width: 1.5,
                      ),
                    ),
                    child: Text(
                      'Cancel',
                      style: AppTextStyles.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16.w),

              // Save Button
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    // Save settings logic
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('Settings saved successfully!'),
                        backgroundColor: Colors.green,
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 32.w,
                      vertical: 12.h,
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
                      'Save Settings',
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
        ],
      ),
    );
  }

  Widget _buildDropdownField({
    required String label,
    required String value,
    required List<String> items,
    required Function(String?) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: AppColors.black,
          ),
        ),
        SizedBox(height: 8.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          decoration: BoxDecoration(
            color: AppColors.greyBackground,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: AppColors.greyBackground, width: 1),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: value,
              isExpanded: true,
              icon: Icon(Icons.keyboard_arrow_down, color: AppColors.grey),
              style: AppTextStyles.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.textSecondary,
              ),
              items: items.map((String item) {
                return DropdownMenuItem<String>(value: item, child: Text(item));
              }).toList(),
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildToggleField({
    required String label,
    required String description,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: AppTextStyles.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                description,
                style: AppTextStyles.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.greyMedium,
                ),
              ),
            ],
          ),
        ),
        Switch(
          value: value,
          onChanged: onChanged,
          activeColor: AppColors.primary,
          activeTrackColor: AppColors.primary.withOpacity(0.5),
        ),
      ],
    );
  }
}
