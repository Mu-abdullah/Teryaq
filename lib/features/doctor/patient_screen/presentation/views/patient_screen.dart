import 'package:flutter/material.dart';

import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/style/custom_widgets/custom_app_bar.dart';
import '../refactor/patient_screen_body.dart';
import '../widgets/record_screen/open_record_button.dart';

class PatientScreen extends StatelessWidget {
  const PatientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: LangKeys.patient),
      body: PatientScreenBody(),
      floatingActionButton: OpenRecordButton(),
    );
  }
}
