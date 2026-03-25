import 'package:main_app/core/extextions/extentions.dart';
import 'package:flutter/material.dart';

import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/style/color/app_color.dart';
import '../../../../../core/style/statics/image_test.dart';
import '../../../../../core/style/widgets/app_text.dart';

class DoctorInfo extends StatelessWidget {
  const DoctorInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            "Dr. Emily Carter",
            isTitle: true,
            isBold: true,
            tr: false,
            color: AppColors.white,
          ),
          AppText("Cardiologist", tr: false, color: AppColors.white),
          AppText("01282146020", tr: false, color: AppColors.white),
          AppText(
            LangKeys.about,
            isTitle: true,
            isBold: true,
            color: AppColors.white,
          ),
          AppText(
            AppTest.doctorBreif,
            tr: false,
            maxLines: 20,
            color: AppColors.white,
          ),
          AppText(
            "More than 7 years of experience",
            tr: false,

            isBold: true,
            color: AppColors.white,
          ),

          Row(
            children: [
              Expanded(
                child: AppText(
                  "+2003 ${context.tr(LangKeys.patient)}",
                  tr: false,
                  color: AppColors.white,
                  isBold: true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
