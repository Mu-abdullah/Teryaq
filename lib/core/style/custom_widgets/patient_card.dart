import 'package:main_app/core/extextions/extentions.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../language/lang_keys.dart';
import '../../routes/routes_name.dart';
import '../../services/status/gender_status.dart';
import '../statics/app_statics.dart';
import '../widgets/app_text.dart';

class PatientCard extends StatelessWidget {
  const PatientCard({super.key, this.name, this.gender, this.age});
  final String? name;
  final String? gender;
  final String? age;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.smallPadding,
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () => context.pushNamed(RoutesNames.patientScreen),
        child: Container(
          height: 75,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 16,
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: Colors.blueAccent.withValues(alpha: 0.2),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    gender == GenderStatus.getGender(Gender.female)
                        ? HugeIcons.strokeRoundedFemaleSymbol
                        : HugeIcons.strokeRoundedMaleSymbol,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  spacing: 16,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      name ?? context.tr(LangKeys.unavailable),
                      tr: false,
                      isBold: true,
                    ),
                    Row(
                      children: [
                        AppText(
                          tr: false,
                          "${gender ?? GenderStatus.getGender(Gender.male)}, ",
                        ),
                        AppText(
                          tr: false,
                          age == null
                              ? "$age ${context.tr(LangKeys.unavailable)}"
                              : "$age ${context.tr(LangKeys.yearsOld)}",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
