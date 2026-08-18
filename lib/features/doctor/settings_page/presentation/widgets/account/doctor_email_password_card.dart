import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../../../core/language/lang_keys.dart';
import '../../cubits/doctor_setting_cubit/doctor_setting_cubit.dart';
import '../doctor_setting_card.dart';

class DoctorEmailAndPasswordCard extends StatelessWidget {
  const DoctorEmailAndPasswordCard({super.key, required this.cubit});
  final DoctorSettingCubit cubit;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        DoctorSettingCard(
          title: LangKeys.email,
          value: cubit.doctorData?.dEmail ?? " ",
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
