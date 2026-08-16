import 'package:flutter/material.dart';

import '../../../../core/extextions/extentions.dart';
import '../../../../core/language/lang_keys.dart';
import '../../../../core/style/widgets/app_text_form_felid.dart';
import '../cubits/auth_cubit/auth_cubit.dart';

class AuthTextForm extends StatelessWidget {
  const AuthTextForm({super.key, required this.cubit});

  final AuthCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: cubit.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 10,
        children: [
          AppTextFormField(
            controller: cubit.emailController,
            type: TextInputType.emailAddress,
            hint: LangKeys.email,
            label: LangKeys.email,
            validate: (value) {
              if (value == null || value.isEmpty) {
                return LangKeys.enterYourEmail;
              } else if (!RegExp(
                r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
              ).hasMatch(value)) {
                return context.tr(LangKeys.writeEmailCorrect);
              }
              return null;
            },
          ),
          AppTextFormField(
            controller: cubit.passwordController,
            type: TextInputType.visiblePassword,
            hint: LangKeys.password,
            label: LangKeys.password,
            validate: (value) {
              if (value == null || value.isEmpty) {
                return LangKeys.enterYourPassword;
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
