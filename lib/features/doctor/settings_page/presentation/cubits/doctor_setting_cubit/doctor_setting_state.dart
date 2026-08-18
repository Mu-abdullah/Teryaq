part of 'doctor_setting_cubit.dart';

sealed class DoctorSettingState extends Equatable {
  const DoctorSettingState();

  @override
  List<Object> get props => [];
}

final class DoctorSettingInitial extends DoctorSettingState {}

final class DoctorSettingLoading extends DoctorSettingState {}

final class DoctorSettingLoaded extends DoctorSettingState {
  final DSettingModel dData;
  const DoctorSettingLoaded({required this.dData});

  @override
  List<Object> get props => [dData];
}

final class DoctorSettingError extends DoctorSettingState {
  final String message;
  const DoctorSettingError({required this.message});

  @override
  List<Object> get props => [message];
}
