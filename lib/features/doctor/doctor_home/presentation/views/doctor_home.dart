import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/services/get_it/git_it.dart';
import '../../data/repo/d_home_repo.dart';
import '../cubits/dr_home_cubit/dr_home_cubit.dart';
import '../refactor/doctor_home_page_body.dart';
import '../widgets/dr_app_bar.dart';

class DoctorHomeScreen extends StatelessWidget {
  const DoctorHomeScreen({super.key, this.isAdmin = false, required this.uid});
  final bool isAdmin;
  final String uid;
  @override
  Widget build(BuildContext context) {
    var loc = locator<DHomeRepo>();
    return BlocProvider(
      create: (context) =>
          DrHomeCubit(isAdmin: isAdmin, uid: uid, repo: loc),
      child: Scaffold(
        appBar: DoctorAppBar(isBack: isAdmin),
        body: SafeArea(child: DoctorHomePageBody()),
        // bottomNavigationBar: CustomBottomNavigationBar(cubit: cubit),
      ),
    );
  }
}
