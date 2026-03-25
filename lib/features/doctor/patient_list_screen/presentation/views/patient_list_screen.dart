import 'package:flutter/material.dart';

import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/style/custom_widgets/custom_app_bar.dart';
import '../refactor/patient_list_screen_body.dart';

class PatientListScreen extends StatelessWidget {
  const PatientListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: LangKeys.patients),
      body: PatientListScreenBody(),
    );
  }
}
