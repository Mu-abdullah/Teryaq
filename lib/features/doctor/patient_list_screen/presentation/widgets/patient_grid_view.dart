import 'package:flutter/material.dart';

import 'patient_grid_item.dart';

class PatientGridView extends StatelessWidget {
  const PatientGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        childAspectRatio: 3 / 4,
      ),
      itemCount: 50,
      itemBuilder: (context, index) => PatientGridItem(),
    );
  }
}
