import 'package:main_app/core/extextions/extentions.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../../../core/language/lang_keys.dart';
import '../../../../../../core/routes/routes_name.dart';
import '../doctor_setting_card.dart';

class PreferencesCards extends StatelessWidget {
  const PreferencesCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        DoctorSettingCard(
          title: LangKeys.changeLanguage,
          value: context.langCode == 'ar' ? 'العربية' : 'English',
          icon: HugeIcons.strokeRoundedEarth,
          onTap: () => context.pushNamed(RoutesNames.language),
        ),
      ],
    );
  }
}
