import 'package:flutter/material.dart';

import '../../../../../core/style/custom_widgets/search_field_widget.dart';
import '../cubits/bottom_bar_cubit/bottom_bar_cubit.dart';
import '../widgets/home_page/doctor_name.dart';
import '../widgets/home_page/sick_count.dart';

class DoctorHomePageBody extends StatelessWidget {
  const DoctorHomePageBody(this.cubit, {super.key});
  final DrHomeCubit cubit;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 10,
        children: [DoctorName(cubit), SearchFieldWidget(), SickCount()],
      ),
    );
  }
}
