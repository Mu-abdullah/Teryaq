import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:equatable/equatable.dart';

// ====================
// Events
// ====================
abstract class ClockEvent extends Equatable {
  const ClockEvent();
  @override
  List<Object> get props => [];
}

class ClockTick extends ClockEvent {}

// ====================
// States
// ====================
class ClockState extends Equatable {
  final String timeString;
  const ClockState(this.timeString);
  @override
  List<Object> get props => [timeString];
}

// ====================
// Bloc
// ====================
class ClockBloc extends Bloc<ClockEvent, ClockState> {
  late final Timer _timer;
  final String locale;
  final bool use12Hour;

  ClockBloc({this.locale = 'en', this.use12Hour = true})
    : super(const ClockState('')) {
    on<ClockTick>((event, emit) {
      final now = DateTime.now();
      // تحديد النمط حسب الصيغة المطلوبة
      final pattern = use12Hour ? 'hh:mm:ss a' : 'HH:mm:ss';
      final formatter = DateFormat(pattern, locale);
      final timeString = formatter.format(now);
      emit(ClockState(timeString));
    });

    // بدء التحديث كل ثانية
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) => add(ClockTick()),
    );
    // تحديث فوري عند البدء
    add(ClockTick());
  }

  @override
  Future<void> close() {
    _timer.cancel();
    return super.close();
  }
}
