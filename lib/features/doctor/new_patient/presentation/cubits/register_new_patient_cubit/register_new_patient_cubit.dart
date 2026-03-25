import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_new_patient_state.dart';

class RegisterNewPatientCubit extends Cubit<RegisterNewPatientState> {
  RegisterNewPatientCubit() : super(RegisterNewPatientInitial());

  static RegisterNewPatientCubit get(BuildContext context) => BlocProvider.of(context);
  String? gender;
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final birthController = TextEditingController();
  final phoneController = TextEditingController();
}
