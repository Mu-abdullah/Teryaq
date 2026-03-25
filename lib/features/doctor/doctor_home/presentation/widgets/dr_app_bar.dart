import 'package:main_app/core/extextions/extentions.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/routes/routes_name.dart';
import '../../../../../core/style/color/app_color.dart';
import '../../../../../core/style/statics/app_statics.dart';
import '../../../../../core/style/custom_widgets/custom_app_bar.dart';
import '../cubits/bottom_bar_cubit/bottom_bar_cubit.dart';

class DoctorAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DoctorAppBar({super.key, required this.cubit});

  final DrHomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      backgroundColor: AppColors.white,
      elevation: 5,
      title: LangKeys.doctor, //cubit.titles[cubit.currentIndex],
      isBack: cubit.isAdmin,
      actions: [
        IconButton(
          onPressed: () => context.pushNamed(RoutesNames.messengerScreen),
          icon: Icon(HugeIcons.strokeRoundedChatting01, color: AppColors.black),
        ),
        IconButton(
          onPressed: () => context.pushNamed(RoutesNames.settingsScreen),
          icon: Icon(HugeIcons.strokeRoundedSettings01, color: AppColors.black),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(Statics.appBarHeight);
}
