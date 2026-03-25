import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/doctor_setting_cubit/doctor_setting_cubit.dart';
import '../widgets/account/account_setting_body.dart';
import '../widgets/logout_button.dart';
import '../widgets/preferences/preferences_setting_body.dart';
import '../widgets/support/support_setting_body.dart';

class DoctorSettingsPageBody extends StatelessWidget {
  const DoctorSettingsPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorSettingCubit, DoctorSettingState>(
      builder: (context, state) {
        return Column(
          spacing: 24,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AccountSettingBody(),
            PreferencesSettingBody(),
            SupportSettingBody(),
            LogOutButton(),
          ],
        );
      },
    );
  }
}
