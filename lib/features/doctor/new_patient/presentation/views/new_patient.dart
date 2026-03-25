import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/register_new_patient_cubit/register_new_patient_cubit.dart';
import '../refactor/new_patient_body.dart';

class NewPatient extends StatelessWidget {
  const NewPatient({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterNewPatientCubit(),
      child: NewPatientBody(),
    );
  }
}
