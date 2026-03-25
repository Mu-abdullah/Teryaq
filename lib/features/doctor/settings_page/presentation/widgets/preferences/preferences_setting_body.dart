import 'package:flutter/material.dart';

import '../../../../../../core/language/lang_keys.dart';
import '../../../../../../core/style/custom_widgets/section_title.dart';
import 'preferences_cards.dart';

class PreferencesSettingBody extends StatelessWidget {
  const PreferencesSettingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 12,
      children: [SectionTitle(LangKeys.preferences), PreferencesCards()],
    );
  }
}
