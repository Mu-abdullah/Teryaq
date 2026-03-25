import 'package:main_app/core/extextions/extentions.dart';
import 'package:flutter/material.dart';

import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/routes/routes_name.dart';
import '../../../../../core/style/color/app_color.dart';
import '../../../../../core/style/statics/app_statics.dart';
import '../../../../../core/style/widgets/app_text.dart';

class PatientGridItem extends StatelessWidget {
  const PatientGridItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(RoutesNames.patientScreen);
      },
      child: Card(
        color: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: AppBorderRadius.mediumRadius,
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 2,
        semanticContainer: true,
        child: Padding(
          padding: AppPadding.symmetricPadding(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(),
              AppText(
                context.tr(LangKeys.patientName),
                tr: false,
                isTitle: true,
                isBold: true,
                maxLines: 6,
              ),

              AppText(context.tr(LangKeys.age), tr: false),
              AppText(context.tr(LangKeys.phone), tr: false),
              AppText(context.tr(LangKeys.gender), tr: false),
              AppText(context.tr(LangKeys.patientId), tr: false),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
