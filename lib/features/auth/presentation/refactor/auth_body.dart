import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:main_app/core/extextions/extentions.dart';

import '../../../../core/language/lang_keys.dart';
import '../../../../core/style/statics/app_statics.dart';
import '../../../../core/style/widgets/app_button.dart';
import '../cubits/auth_cubit/auth_cubit.dart';
import '../widgets/app_name.dart';
import '../widgets/auth_lang_btn.dart';
import '../widgets/auth_text_form.dart';
import '../views/facing_trouble.dart';

class AuthBody extends StatelessWidget {
  const AuthBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
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
                    AppButton(text: LangKeys.login, onTap: () {}),
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
