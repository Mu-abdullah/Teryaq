import 'package:main_app/core/extextions/extentions.dart';
import 'package:flutter/material.dart';

import '../widgets/patient_count.dart';
import '../widgets/patient_grid_view.dart';

class PatientListScreenBody extends StatelessWidget {
  const PatientListScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    var isArabic = context.langCode == 'ar' ? true : false;
    return Stack(
      children: [
        Positioned.fill(child: PatientGridView()),
        Positioned(
          left: isArabic ? null : 16,
          right: isArabic ? 16 : null,
          bottom: 16,
          child: PatientsCount(count: 50),
        ),
      ],
    );
  }
}
