import 'package:main_app/core/extextions/extentions.dart';
import 'package:flutter/material.dart';

import '../../../../core/language/lang_keys.dart';
import '../../../../core/style/color/app_color.dart';
import '../../../../core/style/statics/app_statics.dart';
import '../../../../core/style/widgets/app_text.dart';

class DrAssistantName extends StatelessWidget {
  const DrAssistantName({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.blueAccent.withValues(alpha: 0.1),
        borderRadius: AppBorderRadius.mediumRadius,
      ),
      child: Padding(
        padding: AppPadding.mediumPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 16,
          children: [
            AppText(
              "Assistant Name",
              tr: false,
              color: AppColors.black,
              isTitle: true,
              isBold: true,
            ),
            AppText(
              "${context.tr(LangKeys.dr)} Emily Carter",
              color: AppColors.black,
              tr: false,
            ),
          ],
        ),
      ),
    );
  }
}
