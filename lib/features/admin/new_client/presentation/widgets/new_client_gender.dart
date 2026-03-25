import 'package:flutter/material.dart';

import '../../../../../core/services/status/gender_status.dart';
import '../../../../../core/style/custom_widgets/custom_gender.dart';

class NewClientGender extends StatefulWidget {
  const NewClientGender({super.key});

  @override
  State<NewClientGender> createState() => _NewClientGenderState();
}

class _NewClientGenderState extends State<NewClientGender> {
  Gender? selectedGender;
  @override
  Widget build(BuildContext context) {
    return GenderChoose(
      groupValue: selectedGender,
      onChanged: (value) {
        setState(() {
          selectedGender = value;
        });
      },
    );
  }
}
