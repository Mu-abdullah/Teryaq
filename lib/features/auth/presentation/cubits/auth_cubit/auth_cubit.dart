import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repo/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthRepo repo;
  AuthCubit(this.repo) : super(AuthInitial());
  static AuthCubit get(BuildContext context) =>
      BlocProvider.of<AuthCubit>(context);

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
