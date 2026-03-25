import 'package:main_app/core/extextions/extentions.dart';
import 'package:flutter/material.dart';

import '../../../../../core/style/color/app_color.dart';
import '../../../../../core/style/statics/app_statics.dart';
import '../../../../../core/style/widgets/app_text.dart';

class AdminHomeCustomButton extends StatelessWidget {
  const AdminHomeCustomButton({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    this.color = AppColors.blueAccent,
    this.textColor = AppColors.black,
    this.iconColor,
  });
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  final Color color;
  final Color textColor;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    bool isArabic = context.langCode == 'ar';
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          borderRadius: AppBorderRadius.mediumRadius,
          gradient: LinearGradient(
            colors: isArabic
                ? [color, AppColors.white]
                : [AppColors.white, color],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: Row(
                spacing: 16,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(title, isTitle: true, isBold: true, color: textColor),
                  Icon(icon, color: textColor),
                ],
              ),
            ),
            Positioned(
              top: 0,
              right: isArabic ? null : -10,
              left: isArabic ? 0 : null,
              child: Icon(
                icon,
                color: iconColor ?? textColor.withValues(alpha: 0.2),
                size: 120,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
