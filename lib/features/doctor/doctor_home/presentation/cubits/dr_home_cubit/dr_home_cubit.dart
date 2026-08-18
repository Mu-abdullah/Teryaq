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
      if (data != null) {
        return DHomeModel.fromJson(data as Map<String, dynamic>);
      }
    } catch (e) {
      // تجاهل خطأ Cache
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
          // حفظ في Cache
          SharedPref.saveData(
            key: PrefKeys.doctorModel,
            value: doctor.toJson(),
          );
          emit(DrHomeLoaded(doctor));
        }
      },
    );
  }

  /// تحويل الـ Failure إلى رسالة
  String _mapFailureToMessage(dynamic failure) {
    // حسب نوع الـ Failure في مشروعك
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
  String get doctorName => currentDoctor?.dName ?? 'طبيب';
}
