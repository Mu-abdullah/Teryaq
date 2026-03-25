import 'package:main_app/core/extextions/extentions.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../../../core/style/color/app_color.dart';
import '../../../../../../core/style/statics/app_statics.dart';
import '../../../../../../core/style/statics/image_test.dart';
import '../../../../../../core/style/widgets/app_text.dart';
import '../../../../../../core/style/custom_widgets/custom_bottom_sheet.dart';

class VistiHistoryItem extends StatelessWidget {
  const VistiHistoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        customShowBottomSheet(
          context: context,
          title: "25/10/2024",
          translated: false,
          widget: Container(
            height: context.height(percent: 0.6),
            decoration: BoxDecoration(
              borderRadius: AppBorderRadius.mediumRadius,
              color: AppColors.white,
            ),
          ),
        );
      },
      child: Padding(
        padding: AppPadding.symmetricPadding(),
        child: Row(
          spacing: 16,
          children: [
            Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.blueAccent.withValues(alpha: 0.2),
                shape: BoxShape.rectangle,
              ),
              child: Icon(HugeIcons.strokeRoundedCalendar01, size: 24),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText("25/10/2024", tr: false, isBold: true),
                  AppText(AppTest.patientBreif, tr: false, maxLines: 2),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
