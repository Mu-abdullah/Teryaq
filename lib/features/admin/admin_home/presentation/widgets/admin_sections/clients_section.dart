import 'package:main_app/core/extextions/extentions.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../../../core/language/lang_keys.dart';
import '../../../../../../core/routes/routes_name.dart';
import '../../../../../../core/style/color/app_color.dart';
import '../admin_home_custom_button.dart';
import '../admin_section.dart';

class ClientsSection extends StatelessWidget {
  const ClientsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return AdminSections(
      title: LangKeys.client,
      icon: HugeIcons.strokeRoundedUserGroup,
      child: Column(
        children: [
          AdminHomeCustomButton(
            color: AppColors.black,
            textColor: AppColors.white,
            title: LangKeys.newClient,
            icon: HugeIcons.strokeRoundedNewReleases,
            onTap: () {
              context.pushNamed(RoutesNames.newClient);
            },
          ),
        ],
      ),
    );
  }
}
