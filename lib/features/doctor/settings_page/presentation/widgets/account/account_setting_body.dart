import 'package:flutter/material.dart';

import '../../../../../../core/language/lang_keys.dart';
import '../../../../../../core/style/custom_widgets/section_title.dart';
import '../../cubits/doctor_setting_cubit/doctor_setting_cubit.dart';
import 'doctor_email_password_card.dart';
import 'doctor_name_card.dart';

class AccountSettingBody extends StatelessWidget {
  const AccountSettingBody({super.key, required this.cubit});
  final DoctorSettingCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 12,
      children: [
        SectionTitle(LangKeys.account),
        DoctorNameCard(cubit: cubit),
        DoctorEmailAndPasswordCard(cubit: cubit),
      ],
    );
  }
}
