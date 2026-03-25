import 'package:main_app/core/extextions/extentions.dart';
import 'package:main_app/core/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/style/color/app_color.dart';
import '../../../../../core/style/statics/app_statics.dart';
import '../../../../../core/style/widgets/app_text.dart';

class MassengerItem extends StatelessWidget {
  const MassengerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.smallPadding,
      child: InkWell(
        onTap: () {
          context.pushNamed(RoutesNames.chatScreen);
        },
        borderRadius: AppBorderRadius.mediumRadius,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.blueAccent.withValues(alpha: 0.1),
            borderRadius: AppBorderRadius.mediumRadius,
          ),
          padding: AppPadding.smallPadding,
          child: Row(
            spacing: 16,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.blueAccent.withValues(alpha: 0.2),
                  shape: BoxShape.circle,
                ),
                child: Icon(HugeIcons.strokeRoundedPatient),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      context.tr(LangKeys.patientName),
                      tr: false,
                      isTitle: true,
                    ),
                    AppText("Last message", tr: false, isBold: true),
                  ],
                ),
              ),
              AppText("12:00", tr: false),
            ],
          ),
        ),
      ),
    );
  }
}
