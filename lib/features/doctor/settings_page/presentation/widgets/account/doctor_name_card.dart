import 'package:main_app/core/extextions/extentions.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/language/lang_keys.dart';
import '../../../../../../core/routes/routes_name.dart';
import '../../../../../../core/style/widgets/app_text.dart';
import 'doctor_setting_image.dart';

class DoctorNameCard extends StatelessWidget {
  const DoctorNameCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(RoutesNames.doctorProfile);
      },
      child: Row(
        spacing: 16,
        children: [
          DoctorSettingImage(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(LangKeys.profile, isBold: true),
                AppText("Dr. Emily Carter", tr: false),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
