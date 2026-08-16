import 'package:flutter/material.dart';

import '../../../../core/language/lang_keys.dart';
import '../../../../core/style/color/app_color.dart';
import '../../../../core/style/custom_widgets/custom_bottom_sheet.dart';
import '../../../../core/style/widgets/app_text.dart';
import '../widgets/facing_trouble_bttm_sheet.dart';

class FaceingTrouble extends StatelessWidget {
  const FaceingTrouble({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        customShowBottomSheet(
          context: context,
          widget: FaceingTroubleBottomSheet(),
          title: LangKeys.facingTrouble,
        );
      },
      child: AppText(
        LangKeys.facingTrouble,
        textAlign: TextAlign.start,
        color: AppColors.red,
        isBold: true,
      ),
    );
  }
}
