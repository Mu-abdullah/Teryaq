import 'package:flutter/material.dart';
import 'package:main_app/core/extextions/extentions.dart';

import '../../../../../../core/language/lang_keys.dart';
import '../../../../../../core/style/color/app_color.dart';
import '../../../../../../core/style/widgets/app_space.dart';
import '../../../../../../core/style/widgets/app_text.dart';
import '../../../data/model/d_setting_model.dart';

class DoctorInfo extends StatelessWidget {
  const DoctorInfo({super.key, required this.doctor});
  final DSettingModel doctor;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppSpace(space: 20),
          AppText(
            doctor.name,
            isTitle: true,
            isBold: true,
            tr: false,
            color: AppColors.white,
          ),
          AppText(
            doctor.specialization ?? "NULL",
            tr: false,
            color: AppColors.white,
          ),
          AppText(doctor.phone ?? "NULL", tr: false, color: AppColors.white),
          AppText(
            LangKeys.about,
            isTitle: true,
            isBold: true,
            color: AppColors.white,
          ),
          AppText(
            doctor.about ?? "NULL",
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
