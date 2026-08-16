import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/get_it/git_it.dart';
import '../../data/repo/auth_repo.dart';
import '../cubits/auth_cubit/auth_cubit.dart';
import '../refactor/auth_body.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    var loc = locator<AuthRepo>();
    return BlocProvider(create: (context) => AuthCubit(loc), child: AuthBody());
  }
}
