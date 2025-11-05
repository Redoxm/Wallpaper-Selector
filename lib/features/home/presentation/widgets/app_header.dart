import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final currentRoute = GoRouterState.of(context).uri.path;
    return Container(
      height: 80.h,
      padding: EdgeInsets.symmetric(horizontal: 80.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border(
          bottom: BorderSide(
            // ignore: deprecated_member_use
            color: AppColors.border.withOpacity(0.2),
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          _buildLogo(),
          const Spacer(),
          _buildNavigation(context, currentRoute),
        ],
      ),
    );
  }

  Widget _buildLogo() {
    return Row(
      children: [
        Image.asset('assets/images/logo.png', width: 14.sp, height: 14.sp),

        SizedBox(width: 12.w),
        Text(
          'Wallpaper Studio',
          style: AppTextStyles.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _buildNavigation(BuildContext context, String currentRoute) {
    return Row(
      children: [
        _NavItem(
          icon: Icons.home,
          label: 'Home',
          isActive: currentRoute == '/' || currentRoute.startsWith('/home'),
          onTap: () => context.go('/'),
        ),
        SizedBox(width: 32.w),
        _NavItem(
          icon: Icons.grid_view,
          label: 'Browse',
          isActive: currentRoute.startsWith('/browse'),
          onTap: () => context.go('/browse'),
        ),
        SizedBox(width: 32.w),
        _NavItem(
          icon: Icons.favorite_border,
          label: 'Favourites',
          isActive: currentRoute.startsWith('/favourites'),
          onTap: () => context.go('/favourites'),
        ),
        SizedBox(width: 32.w),
        _NavItem(
          icon: Icons.settings,
          label: 'Settings',
          isActive: currentRoute.startsWith('/settings'),
          onTap: () => context.go('/settings'),
        ),
      ],
    );
  }
}

class _NavItem extends StatefulWidget {
  final IconData icon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: widget.isActive || _isHovered
                ? AppColors.greyBackground
                : Colors.transparent,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Row(
            children: [
              Icon(
                widget.icon,
                size: 18.sp,
                color: widget.isActive
                    ? AppColors.black
                    : AppColors.textSecondary,
              ),
              SizedBox(width: 8.w),
              Text(
                widget.label,
                style: AppTextStyles.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: widget.isActive
                      ? AppColors.textPrimary
                      : AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
