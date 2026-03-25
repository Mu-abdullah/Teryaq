import 'package:flutter/material.dart';

import '../../../../../core/style/statics/app_statics.dart';
import '../widgets/last_visit/last_visit.dart';
import '../widgets/patient_info.dart';
import '../widgets/visit_history/visit_history.dart';

class PatientScreenBody extends StatelessWidget {
  const PatientScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: AppPadding.symmetricPadding(),
        child: Column(
          spacing: 24,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [PatientInfo(), LastVisit(), VisitHistory()],
        ),
      ),
    );
  }
}
