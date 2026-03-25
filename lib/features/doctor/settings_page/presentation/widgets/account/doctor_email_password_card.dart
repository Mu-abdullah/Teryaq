import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../../../core/language/lang_keys.dart';
import '../doctor_setting_card.dart';

class DoctorEmailAndPasswordCard extends StatelessWidget {
  const DoctorEmailAndPasswordCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        DoctorSettingCard(
          title: LangKeys.email,
          value: "emily.carter@example.com",
          icon: HugeIcons.strokeRoundedMail01,
        ),
        DoctorSettingCard(
          title: LangKeys.password,
          value: "********",
          icon: HugeIcons.strokeRoundedSquareLock01,
        ),
      ],
    );
  }
}

