import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'doctor_setting_state.dart';

class DoctorSettingCubit extends Cubit<DoctorSettingState> {
bool isStudent ;  
  DoctorSettingCubit({required this.isStudent}) : super(DoctorSettingInitial());

  static DoctorSettingCubit get( BuildContext context) => BlocProvider.of(context);


}
