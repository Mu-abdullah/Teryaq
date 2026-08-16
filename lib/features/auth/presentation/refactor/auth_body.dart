import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:main_app/core/extextions/extentions.dart';

import '../../../../core/language/lang_keys.dart';
import '../../../../core/routes/routes_name.dart';
import '../../../../core/style/custom_widgets/circle_progress.dart';
import '../../../../core/style/custom_widgets/custom_snack_bar.dart';
import '../../../../core/style/statics/app_statics.dart';
import '../../../../core/style/widgets/app_button.dart';
import '../cubits/auth_cubit/auth_cubit.dart';
import '../views/facing_trouble.dart';
import '../widgets/app_name.dart';
import '../widgets/auth_lang_btn.dart';
import '../widgets/auth_text_form.dart';

class AuthBody extends StatelessWidget {
  const AuthBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          Navigator.pop(context);
          CustomSnackbar.showTopSnackBar(
            context,
            message: state.error,
            isError: true,
          );
        } else if (state is AuthSuccess) {
          Navigator.pop(context);

          context.pushReplacementNamed(
            RoutesNames.doctorHome,
             
          );

          debugPrint('AuthBody: AuthSuccess - User ID: ${state.user.user!.id}');
        } else if (state is AuthLoading) {
          showProgressIndicator(context);
        }
      },
      builder: (context, state) {
        var cubit = AuthCubit.get(context);
        return SingleChildScrollView(
          child: Padding(
            padding: AppPadding.symmetricPadding(horizontal: 16, vertical: 32),
            child: Center(
              child: SizedBox(
                width: context.width(percent: 0.7),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  spacing: 10,
                  children: [
                    AuthLangBtn(),
                    AppName(),
                    AuthTextForm(cubit: cubit),
                    AppButton(
                      text: LangKeys.login,
                      onTap: () {
                        if (cubit.formKey.currentState!.validate()) {
                          cubit.login();
                        }
                      },
                    ),
                    FaceingTrouble(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
