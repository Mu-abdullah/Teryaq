import 'package:flutter/material.dart';

import '../../../../../core/services/status/gender_status.dart';
import '../../../../../core/style/custom_widgets/custom_gender.dart';
import '../cubits/register_new_patient_cubit/register_new_patient_cubit.dart';

class NewPatientGender extends StatefulWidget {
  const NewPatientGender({super.key, required this.cubit});
  final RegisterNewPatientCubit cubit;
  @override
  State<NewPatientGender> createState() => _NewPatientGenderState();
}

class _NewPatientGenderState extends State<NewPatientGender> {
  Gender? selectedGender;
  @override
  Widget build(BuildContext context) {
    return GenderChoose(
      groupValue: selectedGender,
      onChanged: (value) {
        setState(() {
          selectedGender = value;
          debugPrint(GenderStatus.getGender(selectedGender!));
          widget.cubit.gender = GenderStatus.getGender(selectedGender!);
        });
      },
    );
  }
}
