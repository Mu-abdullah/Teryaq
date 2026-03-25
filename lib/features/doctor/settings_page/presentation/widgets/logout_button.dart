import 'package:flutter/material.dart';

import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/style/color/app_color.dart';
import '../../../../../core/style/widgets/app_button.dart';
import '../cubits/doctor_setting_cubit/doctor_setting_cubit.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = DoctorSettingCubit.get(context);
    return AppButton(
      onTap: () {},
      text: LangKeys.logout,
      txtColor: AppColors.black,
      fontWeight: FontWeight.w900,
      isUpperCase: false,
      backGroungColor: (cubit.isStudent
              ? AppColors.green
              : AppColors.blueAccent)
          .withValues(alpha: 0.2),
    );
  }
}
