import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bottom_bar_state.dart';

class DrHomeCubit extends Cubit<DrHomeState> {
  DrHomeCubit({required this.isAdmin, required this.uid}) : super(BottomBarInitial());
  static DrHomeCubit get(BuildContext context) => BlocProvider.of(context);

  final bool isAdmin;
  final String uid;

  
}
