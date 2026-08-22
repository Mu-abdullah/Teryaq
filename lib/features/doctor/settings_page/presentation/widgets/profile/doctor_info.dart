import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:main_app/core/extextions/extentions.dart';

import '../../../../../../core/language/lang_keys.dart';
import '../../../../../../core/style/color/app_color.dart';
import '../../../../../../core/style/widgets/app_space.dart';
import '../../../../../../core/style/widgets/app_text.dart';
import '../../../data/model/d_setting_model.dart';

class DoctorInfo extends StatelessWidget {
  const DoctorInfo({super.key, required this.doctor});

  final DSettingModel doctor;

  static const _textColor = AppColors.white;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          const AppSpace(space: 8),

          Row(
            spacing: 10,
            children: [
              AppText(
                doctor.name,
                isTitle: true,
                isBold: true,
                tr: false,
                color: _textColor,
              ),

              if (doctor.verified == true)
                HugeIcon(icon: Icons.verified, color: _textColor),
            ],
          ),

          _infoText(doctor.specialization),
          _infoText(doctor.phone),

          AppText(
            LangKeys.about,
            isTitle: true,
            isBold: true,
            color: _textColor,
          ),

          _infoText(doctor.about, maxLines: 20),

          _infoText('More than 7 years of experience', isBold: true),

          AppText(
            '+2003 ${context.tr(LangKeys.patient)}',
            tr: false,
            isBold: true,
            color: _textColor,
          ),
        ],
      ),
    );
  }

  Widget _infoText(String? text, {int maxLines = 1, bool isBold = false}) {
    return AppText(
      text?.trim().isNotEmpty == true ? text! : 'NULL',
      tr: false,
      maxLines: maxLines,
      isBold: isBold,
      color: _textColor,
    );
  }
}
