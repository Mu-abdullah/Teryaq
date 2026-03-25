import 'package:flutter/material.dart';

import '../../../../../../core/language/lang_keys.dart';
import '../../../../../../core/style/custom_widgets/live_clock/live_clock_ui.dart';
import '../../../../../../core/style/statics/app_statics.dart';
import '../../../../../../core/style/widgets/app_text.dart';

class DoctorName extends StatelessWidget {
  const DoctorName({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: AppPadding.symmetricPadding(),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(LangKeys.welcome),
                  AppText(
                    "Doctor Name",
                    tr: false,
                    isTitle: true,
                    isBold: true,
                  ),
                ],
              ),
            ),
            LiveClockWidget(),
          ],
        ),
      ),
    );
  }
}
