import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:main_app/core/language/lang_keys.dart';

import '../../../../../../core/services/shared_pref/pref_keys.dart';
import '../../../../../../core/services/shared_pref/shared_pref.dart';
import '../../../data/model/d_home_model.dart';
import '../../../data/repo/d_home_repo.dart';

part 'dr_home_state.dart';

class DrHomeCubit extends Cubit<DrHomeState> {
  // ============================================
  // Dependencies
  // ============================================
  final DHomeRepo repo;
  final bool isAdmin;
  final String uid;

  // ============================================
  // Constructor
  // ============================================
  DrHomeCubit({required this.repo, required this.isAdmin, required this.uid})
    : super(const DrHomeInitial()) {
    _initialize();
  }

  // ============================================
  // Static Helper
  // ============================================
  static DrHomeCubit get(BuildContext context) => BlocProvider.of(context);

  // ============================================
  // Private Methods
  // ============================================

  /// تهيئة الـ Cubit وجلب البيانات
  Future<void> _initialize() async {
    // محاولة جلب من Cache أولاً
    final cached = await _getCachedDoctor();
    if (cached != null) {
      emit(DrHomeLoaded(cached));
      // تحديث في الخلفية
      _fetchDoctorFromServer(forceRefresh: false);
    } else {
      await _fetchDoctorFromServer(forceRefresh: true);
    }
  }

  /// جلب البيانات من Cache
  Future<DHomeModel?> _getCachedDoctor() async {
    try {
      final data = await SharedPref.getData(key: PrefKeys.doctorModel);

      // ✅ Debug
      debugPrint('Cache Data Type: ${data.runtimeType}');
      debugPrint('Cache Data: $data');

      if (data != null) {
        // ✅ حل المشكلة: حول البيانات لـ Map عادية
        Map<String, dynamic> safeData;

        if (data is Map) {
          // لو كانت Map (IdentityMap أو Map عادية)
          safeData = Map<String, dynamic>.from(data);
        } else if (data is String) {
          // لو كانت String (JSON)
          try {
            final decoded = jsonDecode(data);
            if (decoded is Map) {
              safeData = Map<String, dynamic>.from(decoded);
            } else {
              debugPrint('❌ Decoded data is not a Map: ${decoded.runtimeType}');
              return null;
            }
          } catch (e) {
            debugPrint('❌ Error decoding JSON: $e');
            return null;
          }
        } else {
          debugPrint('❌ Unsupported data type: ${data.runtimeType}');
          return null;
        }

        debugPrint('✅ Safe Data Keys: ${safeData.keys}');
        return DHomeModel.fromJson(safeData);
      }
    } catch (e, stackTrace) {
      debugPrint('❌ Cache error: $e');
      debugPrint('Stack trace: $stackTrace');
    }
    return null;
  }

  /// جلب البيانات من الـ API
  Future<void> _fetchDoctorFromServer({required bool forceRefresh}) async {
    // لو مش forceRefresh والـ Cache موجود، متجيبش من API
    if (!forceRefresh) {
      final cached = await _getCachedDoctor();
      if (cached != null) {
        if (state is! DrHomeLoaded) {
          emit(DrHomeLoaded(cached));
        }
        return;
      }
    }

    emit(const DrHomeLoading());

    final response = await repo.getDoctorName(uid);
    response.fold(
      (failure) {
        if (!isClosed) {
          emit(DrHomeError(_mapFailureToMessage(failure)));
        }
      },
      (doctor) {
        if (!isClosed) {
          // ✅ حفظ البيانات بشكل آمن
          try {
            final jsonData = doctor.toJson();
            // تأكد من أن jsonData Map عادية
            final safeJson = Map<String, dynamic>.from(jsonData);

            // ✅ تحويل لـ JSON String عشان نحتفظ بالنوع
            final jsonString = jsonEncode(safeJson);

            SharedPref.saveData(
              key: PrefKeys.doctorModel,
              value: jsonString, // ✅ حفظ كـ String مش Map
            );

            debugPrint('✅ Doctor saved to cache successfully');
          } catch (e) {
            debugPrint('❌ Error saving to cache: $e');
          }
          emit(DrHomeLoaded(doctor));
        }
      },
    );
  }

  /// تحويل الـ Failure إلى رسالة
  String _mapFailureToMessage(dynamic failure) {
    // حسب نوع الـ Failure في مشروعك
    if (failure is String) return failure;
    if (failure is Exception) return failure.toString();
    return LangKeys.somethingWentWrong;
  }

  // ============================================
  // Public Methods
  // ============================================

  /// تحديث بيانات الدكتور (سحب للتحديث)
  Future<void> refresh() async {
    await _fetchDoctorFromServer(forceRefresh: true);
  }

  /// إعادة المحاولة بعد خطأ
  Future<void> retry() async {
    if (state is DrHomeError) {
      await _fetchDoctorFromServer(forceRefresh: true);
    }
  }

  /// جلب بيانات الدكتور من Cache فقط (بدون API)
  Future<void> loadFromCache() async {
    final cached = await _getCachedDoctor();
    if (cached != null) {
      emit(DrHomeLoaded(cached));
    }
  }

  // ============================================
  // Getters
  // ============================================

  /// الحصول على بيانات الدكتور الحالية
  DHomeModel? get currentDoctor {
    if (state is DrHomeLoaded) {
      return (state as DrHomeLoaded).doctor;
    }
    return null;
  }

  /// هل البيانات محملة؟
  bool get isDoctorLoaded => state is DrHomeLoaded;

  /// هل في تحميل؟
  bool get isLoading => state is DrHomeLoading;

  /// هل في خطأ؟
  bool get hasError => state is DrHomeError;

  /// اسم الدكتور
  String get doctorName => currentDoctor?.name ?? 'طبيب';
}
