import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

/// Technology badge chip with optional glow
class TechBadge extends StatelessWidget {
  const TechBadge({
    super.key,
    required this.label,
    this.color = AppColors.neonCyan,
    this.isSelected = false,
    this.onTap,
  });

  final String label;
  final Color color;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected
              ? color.withAlpha(51)
              : AppColors.darkSurfaceElevated,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? color : AppColors.glassBorder(),
            width: isSelected ? 1.5 : 1,
          ),
          boxShadow: isSelected
              ? AppColors.neonGlow(
                  color: color,
                  blurRadius: 10,
                  opacity: 0.3,
                )
              : null,
        ),
        child: Text(
          label,
          style: AppTextStyles.badge.copyWith(
            color: isSelected ? color : AppColors.textSecondary,
          ),
        ),
      ),
    );
  }
}

/// Floating badge with animation (for hero stats)
class FloatingBadge extends StatelessWidget {
  const FloatingBadge({
    super.key,
    required this.value,
    required this.label,
    this.icon,
  });

  final String value;
  final String label;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.darkSurfaceElevated,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.glassBorder(),
        ),
        boxShadow: AppColors.neonGlow(
          color: AppColors.neonCyan,
          blurRadius: 15,
          opacity: 0.2,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(
              icon,
              color: AppColors.neonCyan,
              size: 18,
            ),
            const SizedBox(width: 8),
          ],
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: AppTextStyles.stat.copyWith(fontSize: 16),
              ),
              Text(
                label,
                style: AppTextStyles.labelSmall,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
