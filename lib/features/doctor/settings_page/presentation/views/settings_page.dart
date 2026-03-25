import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/style/statics/app_statics.dart';
import '../../../../../core/style/custom_widgets/custom_app_bar.dart';
import '../cubits/doctor_setting_cubit/doctor_setting_cubit.dart';
import '../refactor/doctor_settings_page_body.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key, this.isStudent = false});
  final bool isStudent;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: LangKeys.settings),
      body: SafeArea(
        child: BlocProvider(
          create: (context) => DoctorSettingCubit(isStudent: isStudent),
          child: Padding(
            padding: AppPadding.symmetricPadding(),
            child: SingleChildScrollView(child: DoctorSettingsPageBody()),
          ),
        ),
      ),
    );
  }
}
