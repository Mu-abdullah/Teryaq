import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/bottom_bar_cubit/bottom_bar_cubit.dart';
import '../refactor/doctor_home_page_body.dart';
import '../widgets/dr_app_bar.dart';

class DoctorHomeScreen extends StatelessWidget {
  const DoctorHomeScreen({super.key, this.isAdmin = false, required this.uid});
  final bool isAdmin;
  final String uid;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DrHomeCubit(isAdmin: isAdmin, uid: uid),
      child: BlocBuilder<DrHomeCubit, DrHomeState>(
        builder: (context, state) {
          var cubit = DrHomeCubit.get(context);
          return Scaffold(
            appBar: DoctorAppBar(cubit: cubit),
            body: SafeArea(child: DoctorHomePageBody(cubit)),
            // bottomNavigationBar: CustomBottomNavigationBar(cubit: cubit),
          );
        },
      ),
    );
  }
}
