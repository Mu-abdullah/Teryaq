import 'package:main_app/core/extextions/extentions.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../../../core/language/lang_keys.dart';
import '../../../../../../core/routes/routes_name.dart';
import '../../../../../../core/style/color/app_color.dart';
import '../admin_home_custom_button.dart';
import '../admin_section.dart';

class SettingsSection extends StatelessWidget {
  const SettingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return AdminSections(
      title: LangKeys.settings,
      icon: HugeIcons.strokeRoundedSettings01,
      child: Column(
        children: [
          AdminHomeCustomButton(
            color: AppColors.grey,
            title: LangKeys.changeLanguage,
            icon: HugeIcons.strokeRoundedLanguageSquare,
            onTap: () => context.pushNamed(RoutesNames.language),
          ),
        ],
      ),
    );
  }
}
