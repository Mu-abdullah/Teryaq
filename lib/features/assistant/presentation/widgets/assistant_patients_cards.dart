import 'package:main_app/core/extextions/extentions.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../core/language/lang_keys.dart';
import '../../../../core/routes/routes_name.dart';
import '../../../../core/style/color/app_color.dart';
import '../../../../core/style/custom_widgets/custom_bottom_sheet.dart';
import '../../../doctor/doctor_home/presentation/widgets/home_page/home_count_card.dart';
import '../../../doctor/new_patient/presentation/views/new_patient.dart';

class AssistantPatientsCards extends StatelessWidget {
  const AssistantPatientsCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        _buildCountCard(
          context: context,
          onTap: () => context.pushNamed(RoutesNames.visitsScreen),
          icon: HugeIcons.strokeRoundedClock04,
          title: LangKeys.waiting,
          count: "20",
          color: AppColors.yellow,
          textColor: AppColors.black,
        ),
        _buildCountCard(
          context: context,
          onTap: () => context.pushNamed(RoutesNames.visitsScreen),
          icon: HugeIcons.strokeRoundedCheckmarkCircle01,
          title: LangKeys.completed,
          count: "5",
          color: AppColors.black,
          textColor: AppColors.white,
        ),
        _buildCountCard(
          context: context,
          onTap:
              () => customShowBottomSheet(
                context: context,
                widget: const NewPatient(),
                title: LangKeys.registerNewPatient,
              ),
          icon: HugeIcons.strokeRoundedAddTeam,
          title: LangKeys.registerNewPatient,
          count: "",
          color: AppColors.green,
          textColor: AppColors.white,
        ),
      ],
    );
  }

  Widget _buildCountCard({
    required BuildContext context,
    required VoidCallback onTap,
    required IconData icon,
    required String title,
    required String count,
    required Color color,
    required Color textColor,
  }) {
    return HomeCountCard(
      onTap: onTap,
      cardIcon: icon,
      cardTitle: title,
      cardCount: count,
      isHighlighted: true,
      color: color,
      textColor: textColor,
    );
  }
}
