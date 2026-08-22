import 'package:flutter/material.dart';

import '../../../../../../core/language/lang_keys.dart';
import '../../../../../../core/style/custom_widgets/custom_app_bar.dart';
import '../../../data/model/d_setting_model.dart';
import 'profile_page_body.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({required this.doctor, super.key});
  final DSettingModel doctor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: LangKeys.profile),
      body: ProfilePageBody(doctor),
    );
  }
}
