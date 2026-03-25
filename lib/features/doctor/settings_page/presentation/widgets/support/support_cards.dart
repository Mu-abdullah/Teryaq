import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../../../core/language/lang_keys.dart';
import '../doctor_setting_card.dart';

class SupportCards extends StatelessWidget {
  const SupportCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        DoctorSettingCard(
          title: LangKeys.contact,
          icon: HugeIcons.strokeRoundedChatting01,
        ),
        DoctorSettingCard(
          title: LangKeys.terms,
          icon: HugeIcons.strokeRoundedTask01,
        ),
        DoctorSettingCard(
          title: LangKeys.privacy,
          icon: HugeIcons.strokeRoundedSecurityCheck,
        ),
      ],
    );
  }
}
