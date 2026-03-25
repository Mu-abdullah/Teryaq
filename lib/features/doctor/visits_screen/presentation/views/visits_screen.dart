import 'package:flutter/material.dart';

import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/style/custom_widgets/custom_app_bar.dart';
import '../../../../../core/style/custom_widgets/patient_card.dart';

class VisitsScreen extends StatelessWidget {
  const VisitsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: LangKeys.todayVisits),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder:
            (context, index) => PatientCard(age: "35", name: "Muhammad"),
      ),
    );
  }
}

