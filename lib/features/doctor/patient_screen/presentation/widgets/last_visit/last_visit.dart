import 'package:flutter/material.dart';

import '../../../../../../core/language/lang_keys.dart';
import '../../../../../../core/style/statics/image_test.dart';
import '../../../../../../core/style/widgets/app_text.dart';
import '../../../../../../core/style/custom_widgets/section_title.dart';

class LastVisit extends StatelessWidget {
  const LastVisit({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          spacing: 16,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SectionTitle(LangKeys.lastVisit),
            AppText("25/10/2024", tr: false, maxLines: 20),
          ],
        ),

        AppText(AppTest.patientBreif, tr: false, maxLines: 20),
      ],
    );
  }
}
