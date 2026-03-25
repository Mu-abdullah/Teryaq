import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bottom_bar_state.dart';

class DrHomeCubit extends Cubit<DrHomeState> {
  DrHomeCubit(this.isAdmin) : super(BottomBarInitial());
  static DrHomeCubit get(BuildContext context) => BlocProvider.of(context);

  final bool isAdmin;

  ///[When use bottom navigation bar]
  // int currentIndex = 0;
  // var titles = UserBottomNavigation.titles;
  // var pages = UserBottomNavigation.itemsBody;
  // void onTabTapped(int index) {
  //   currentIndex = index;
  //   emit(BottomBarTapped());
  // }
}
