import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:main_app/core/routes/routes_name.dart';

import '../../../../../core/extextions/extentions.dart';
import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/style/color/app_color.dart';
import '../../../../../core/style/custom_widgets/custom_app_bar.dart';
import '../../../../../core/style/custom_widgets/live_clock/live_clock_ui.dart';
import '../../../../../core/style/statics/app_statics.dart';

class UserCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const UserCustomAppBar({super.key, required this.isAdmin});

  final bool isAdmin;

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      backgroundColor: AppColors.white,
      elevation: 5,
      title: LangKeys.patientName,
      isBack: isAdmin,
      actions: [
        LiveClockWidget(),
        IconButton(
          onPressed: () => context.pushNamed(RoutesNames.userProfileScreen),
          icon: Icon(HugeIcons.strokeRoundedUserCircle, color: AppColors.black),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(Statics.appBarHeight);
}
