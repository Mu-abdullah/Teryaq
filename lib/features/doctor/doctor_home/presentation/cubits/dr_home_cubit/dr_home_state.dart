part of 'dr_home_cubit.dart';

// ============================================
// Base State
// ============================================
abstract class DrHomeState extends Equatable {
  const DrHomeState();

  @override
  List<Object?> get props => [];
}

// ============================================
// States
// ============================================

/// الحالة الابتدائية
class DrHomeInitial extends DrHomeState {
  const DrHomeInitial();
}

/// حالة التحميل
class DrHomeLoading extends DrHomeState {
  const DrHomeLoading();
}

/// حالة النجاح مع البيانات
class DrHomeLoaded extends DrHomeState {
  final DHomeModel doctor;

  const DrHomeLoaded(this.doctor);

  @override
  List<Object?> get props => [doctor];
}

/// حالة الخطأ
class DrHomeError extends DrHomeState {
  final String message;

  const DrHomeError(this.message);

  @override
  List<Object?> get props => [message];
}
