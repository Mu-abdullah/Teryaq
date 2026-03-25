import 'package:flutter/material.dart';

import '../../../../../core/style/color/app_color.dart';
import '../../../../../core/style/statics/app_statics.dart';
import '../../../../../core/style/widgets/app_text.dart';
import '../cubits/doctor_setting_cubit/doctor_setting_cubit.dart';

class DoctorSettingCard extends StatelessWidget {
  const DoctorSettingCard({
    super.key,
    required this.title,
    required this.icon,
    this.value,
    this.onTap,
  });

  final String title;
  final String? value;
  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    var cubit = DoctorSettingCubit.get(context);
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(borderRadius: AppBorderRadius.mediumRadius),
        child: Row(
          spacing: 16,
          children: [
            Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color:
                    (cubit.isStudent ? AppColors.green : AppColors.blueAccent)
                        .withValues(alpha: 0.2),
                shape: BoxShape.rectangle,
              ),
              child: Icon(icon, size: 24),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(title, isBold: true),
                  value == null
                      ? SizedBox.shrink()
                      : AppText(value!, tr: false),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
