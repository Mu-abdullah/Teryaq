import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/bottom_bar_cubit/bottom_bar_cubit.dart';
import '../refactor/doctor_home_page_body.dart';
import '../widgets/dr_app_bar.dart';

class DoctorHomeScreen extends StatelessWidget {
  const DoctorHomeScreen({super.key, this.isAdmin = false});
  final bool isAdmin;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DrHomeCubit(isAdmin),
      child: BlocBuilder<DrHomeCubit, DrHomeState>(
        builder: (context, state) {
          var cubit = DrHomeCubit.get(context);
          return Scaffold(
            appBar: DoctorAppBar(cubit: cubit),
            body: SafeArea(child: DoctorHomePageBody()),
            // bottomNavigationBar: CustomBottomNavigationBar(cubit: cubit),
          );
        },
      ),
    );
  }
}
