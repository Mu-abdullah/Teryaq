import 'package:main_app/core/functions/select_data.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../../core/language/lang_keys.dart';
import '../cubits/register_new_patient_cubit/register_new_patient_cubit.dart';
import 'new_patient_text_form_field.dart';

class NewPatientForm extends StatelessWidget {
  const NewPatientForm({super.key, required this.cubit});
  final RegisterNewPatientCubit cubit;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      children: [
        Form(
          key: cubit.formKey,
          child: Column(
            spacing: 12,
            children: [
              NewPatientTextFormField(
                controller: cubit.nameController,
                type: TextInputType.name,
                hint: LangKeys.patientName,
                icon: HugeIcons.strokeRoundedUser,
              ),
              NewPatientTextFormField(
                controller: cubit.birthController,
                type: TextInputType.text,
                hint: LangKeys.birth,
                icon: HugeIcons.strokeRoundedCalendar01,
                onTap: () {
                  selectData(
                    context: context,
                    controller: cubit.birthController,
                    content: LangKeys.birth,
                  );
                },
              ),
            ],
          ),
        ),
        NewPatientTextFormField(
          controller: cubit.phoneController,
          type: TextInputType.number,
          hint: LangKeys.phone,
          icon: HugeIcons.strokeRoundedSmartPhone01,
        ),
      ],
    );
  }
}
