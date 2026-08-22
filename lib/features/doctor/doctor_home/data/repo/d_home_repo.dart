import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../../core/error/custom_errors.dart';
import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/services/graph_ql/graph_ql.dart';
import '../../../../../core/services/shared_pref/pref_keys.dart';
import '../../../../../core/services/shared_pref/shared_pref.dart';
import '../../../../../core/services/supabase/backend_points.dart';
import '../model/d_home_model.dart';

class DHomeRepo {
  final GraphQLService service;

  DHomeRepo(this.service);

  Future<Either<CustomError, DHomeModel>> getDoctorName(String userId) async {
    try {
      var response = await service.fetchCollection(
        collection: BackendPoint.users,
        fields: [
          'd_name',
          'user_id',
          'd_id',
          'd_created_at',
          'd_about',
          'd_specialization',
          'd_phone',
          'd_email',
          'd_verified',
          'd_image',
          'role',
        ],
        fromJson: DHomeModel.fromJson,
        filters: {
          'user_id': {'eq': userId},
        },
      );
      if (response.isEmpty) {
        debugPrint('No data found for userId: ${response.length}');
        return Left(CustomError(LangKeys.noDataFound));
      } else {
        debugPrint('Data found for userId: ${response.first.toJson()}');
        await saveUserToPref(response.first.toJson());
        debugPrint(
          'Data found saved to preferences for userId: ${response.first.toJson()}',
        );
        return Right(response.first);
      }
    } catch (e) {
      return Left(CustomError(LangKeys.somethingWentWrong));
    }
  }

  Future<void> saveUserToPref(Map<String, dynamic> user) {
    return SharedPref.saveUserToPreferences(
      user: user,
      key: PrefKeys.doctorModel,
    );
  }
}
