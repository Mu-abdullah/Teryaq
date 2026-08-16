
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../core/extextions/extentions.dart';
import '../../../../core/routes/routes_name.dart';
import '../../../../core/style/color/app_color.dart';
import '../../../../core/style/widgets/app_button.dart';

class AuthLangBtn extends StatelessWidget {
  const AuthLangBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: context.langCode == 'ar'
          ? Alignment.topRight
          : Alignment.topLeft,
      child: AppButton(
        isCircle: true,
        icon: HugeIcons.strokeRoundedLanguageCircle,
        onTap: () {
          context.pushNamed(RoutesNames.language);
        },
        iconColor: AppColors.green,
        isBorderd: true,
        borderColor: AppColors.green,
      ),
    );
  }
}
