part of 'register_new_patient_cubit.dart';

sealed class RegisterNewPatientState extends Equatable {
  const RegisterNewPatientState();

  @override
  List<Object> get props => [];
}

final class RegisterNewPatientInitial extends RegisterNewPatientState {}
