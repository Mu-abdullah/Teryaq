import 'package:flutter/material.dart';

import '../../../../../core/style/custom_widgets/search_field_widget.dart';
import '../widgets/home_page/doctor_name.dart';
import '../widgets/home_page/sick_count.dart';

class DoctorHomePageBody extends StatelessWidget {
  const DoctorHomePageBody({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 10,
        children: [DoctorName(), SearchFieldWidget(), SickCount()],
      ),
    );
  }
}
