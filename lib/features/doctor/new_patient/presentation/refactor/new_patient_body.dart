import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/register_new_patient_cubit/register_new_patient_cubit.dart';
import '../widgets/new_patient_form.dart';
import '../widgets/patient_gender.dart';
import '../widgets/register_new_patient_button.dart';

class NewPatientBody extends StatelessWidget {
  const NewPatientBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterNewPatientCubit, RegisterNewPatientState>(
      builder: (context, state) {
        var cubit = RegisterNewPatientCubit.get(context);
        return Padding(
          padding: EdgeInsets.only(
            top: 8,
            left: 16,
            right: 16,
            bottom: MediaQuery.of(context).padding.bottom + 8,
          ),
          child: Column(
            spacing: 12,
            children: [
              NewPatientGender(cubit: cubit),
              NewPatientForm(cubit: cubit),
              RegisterNewPatientButton(cubit: cubit),
            ],
          ),
        );
      },
    );
  }
}
