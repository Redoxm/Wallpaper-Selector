// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';

class DeviceStatusMockup extends StatelessWidget {
  final bool isConnected;
  final VoidCallback onConnectionToggle;

  const DeviceStatusMockup({
    super.key,
    required this.isConnected,
    required this.onConnectionToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280.w,
      height: 560.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(40.r),
        border: Border.all(color: AppColors.greyLight, width: 8.w),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.1),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          // Top notch
          Container(
            margin: EdgeInsets.only(top: 12.h),
            width: 100.w,
            height: 20.h,
            decoration: BoxDecoration(
              color: AppColors.black,
              borderRadius: BorderRadius.circular(20.r),
            ),
          ),

          // Content area
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Connection status
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 8.h,
                    ),
                    decoration: BoxDecoration(
                      color: isConnected
                          ? Colors.green.withOpacity(0.1)
                          : Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20.r),
                      border: Border.all(
                        color: isConnected ? Colors.green : Colors.grey,
                        width: 1,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.link,
                          color: isConnected ? Colors.green : Colors.grey,
                          size: 16.sp,
                        ),
                        SizedBox(width: 6.w),
                        Text(
                          isConnected ? 'Connected to device' : 'Not connected',
                          style: AppTextStyles.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: isConnected ? Colors.green : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),

                  // Disconnect button
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: onConnectionToggle,
                      child: Text(
                        isConnected
                            ? 'Click to disconnect'
                            : 'Click to connect',
                        style: AppTextStyles.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Bottom indicator
          Container(
            margin: EdgeInsets.only(bottom: 8.h),
            width: 120.w,
            height: 4.h,
            decoration: BoxDecoration(
              color: AppColors.black,
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),
        ],
      ),
    );
  }
}
