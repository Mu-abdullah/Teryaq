import 'package:main_app/core/extextions/extentions.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/style/color/app_color.dart';
import '../../../../../core/style/statics/app_statics.dart';
import '../../../../../core/style/widgets/app_text.dart';

class PatientInfo extends StatelessWidget {
  const PatientInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: AppBorderRadius.mediumRadius,
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: AppPadding.mediumPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 16,

        children: [
          Container(
            height: 56,
            width: 56,
            decoration: BoxDecoration(
              color: AppColors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: const Center(
              child: Icon(
                HugeIcons.strokeRoundedMaleSymbol,
                color: AppColors.blueAccent,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  "John Doe (${context.tr(LangKeys.patientName)})",
                  tr: false,
                  isTitle: true,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                ),
                AppText(
                  context.tr(LangKeys.gender),
                  tr: false,
                  color: AppColors.blueAccent,
                ),
                AppText(
                  context.tr(LangKeys.age),
                  tr: false,
                  color: AppColors.blueAccent,
                ),
                AppText(
                  "${context.tr(LangKeys.patientId)}: 25",
                  tr: false,

                  color: AppColors.blueAccent,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
