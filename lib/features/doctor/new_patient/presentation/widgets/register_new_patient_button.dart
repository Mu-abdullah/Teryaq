import 'package:flutter/material.dart';

import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/style/widgets/app_button.dart';
import '../../../../../core/style/custom_widgets/custom_snack_bar.dart';
import '../cubits/register_new_patient_cubit/register_new_patient_cubit.dart';

class RegisterNewPatientButton extends StatelessWidget {
  const RegisterNewPatientButton({super.key, required this.cubit});
  final RegisterNewPatientCubit cubit;

  @override
  Widget build(BuildContext context) {
    return AppButton(
      text: LangKeys.register,
      onTap: () {
        if (cubit.gender == null) {
          CustomSnackbar.showTopSnackBar(
            context,
            isError: true,
            message: LangKeys.selectGender,
          );
        } else {
          if (cubit.formKey.currentState!.validate()) {
            /// [AFTER REGISTER NEW PATIENT]
            /// [OPEN NEW BOTTOM SHEET TO ADD PATIENT DIAGNOSIS]
          }
        }
      },
    );
  }
}
