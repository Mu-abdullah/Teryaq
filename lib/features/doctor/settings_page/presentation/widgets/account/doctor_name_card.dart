import 'package:flutter/material.dart';
import 'package:main_app/core/extextions/extentions.dart';

import '../../../../../../core/language/lang_keys.dart';
import '../../../../../../core/routes/routes_name.dart';
import '../../../../../../core/style/widgets/app_text.dart';
import '../../cubits/doctor_setting_cubit/doctor_setting_cubit.dart';
import 'doctor_setting_image.dart';

class DoctorNameCard extends StatelessWidget {
  const DoctorNameCard({super.key, required this.cubit});
  final DoctorSettingCubit cubit;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(
          RoutesNames.doctorProfile,
          arguments: cubit.doctorData?.toJson() ?? {},
        );

        debugPrint("Doctor Data: ${cubit.doctorData?.toJson()}");
      },
      child: Row(
        spacing: 16,
        children: [
          DoctorSettingImage(imageUrl: cubit.doctorData?.dImage ?? ''),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(LangKeys.profile),
                AppText(
                  "Dr. ${cubit.doctorData?.dName ?? 'Name'}",
                  tr: false,
                  isBold: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
