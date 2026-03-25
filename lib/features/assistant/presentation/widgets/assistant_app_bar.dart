import 'package:main_app/core/extextions/extentions.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../core/language/lang_keys.dart';
import '../../../../core/routes/routes_name.dart';
import '../../../../core/style/color/app_color.dart';
import '../../../../core/style/statics/app_statics.dart';
import '../../../../core/style/custom_widgets/custom_app_bar.dart';

class AssistantAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AssistantAppBar({super.key, required this.isAdmin});

  final bool isAdmin;

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: LangKeys.assistant,
      isBack: isAdmin,
      actions: [
        IconButton(
          onPressed: () => context.pushNamed(RoutesNames.language),
          icon: Icon(
            HugeIcons.strokeRoundedLanguageSquare,
            color: AppColors.black,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(Statics.appBarHeight);
}
