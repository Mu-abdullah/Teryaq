import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/d_setting_model.dart';
import '../../../data/repo/get_d_data_from_shared_repo.dart';

part 'doctor_setting_state.dart';

class DoctorSettingCubit extends Cubit<DoctorSettingState> {
  bool isStudent;
  GetDDataFromSharedRepo repo;
  DoctorSettingCubit({required this.isStudent, required this.repo})
    : super(DoctorSettingInitial()) {
    getDoctorData();
  }

  static DoctorSettingCubit get(BuildContext context) =>
      BlocProvider.of(context);
  DSettingModel? doctorData;

  Future<void> getDoctorData() async {
    emit(DoctorSettingLoading());
    try {
      final data = await repo.getDocData();
      if (data.isNotEmpty) {
        final dData = DSettingModel.fromJson(data);
        doctorData = dData;
        emit(DoctorSettingLoaded(dData: dData));
      } else {
        emit(const DoctorSettingError(message: 'No data found'));
      }
    } catch (e) {
      emit(DoctorSettingError(message: e.toString()));
    }
  }
}
