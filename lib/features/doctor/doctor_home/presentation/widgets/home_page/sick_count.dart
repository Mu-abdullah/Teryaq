import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:main_app/core/extextions/extentions.dart';

import '../../../../../../core/language/lang_keys.dart';
import '../../../../../../core/routes/routes_name.dart';
import '../../../../../../core/style/color/app_color.dart';
import '../../../../../../core/style/custom_widgets/custom_bottom_sheet.dart';
import '../../../../../../core/style/statics/app_statics.dart';
import '../../../../new_patient/presentation/views/new_patient.dart';
import 'home_count_card.dart';

class SickCount extends StatelessWidget {
  const SickCount({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.smallPadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        spacing: 16,
        children: [_buildStatusRow(context)],
      ),
    );
  }

  Widget _buildStatusRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildCountCard(
          context: context,
          onTap: () => _showNewPatientSheet(context),
          icon: HugeIcons.strokeRoundedAddTeam,
          title: LangKeys.registerNewPatient,
          count: "",
          color: AppColors.green,
          textColor: AppColors.white,
        ),
        _buildCountCard(
          context: context,
          onTap: () => context.pushNamed(RoutesNames.patientListScreen),
          icon: HugeIcons.strokeRoundedUserGroup,
          title: LangKeys.patients,
          count: "135",
          color: AppColors.grey,
          textColor: AppColors.white,
        ),
        _buildCountCard(
          context: context,
          onTap: () => context.pushNamed(RoutesNames.patientScreen),
          icon: HugeIcons.strokeRoundedUser,
          title: LangKeys.nextVisit,
          count: "",
          color: AppColors.blueAccent,
          textColor: AppColors.white,
        ),
        _buildCountCard(
          context: context,
          onTap: () => context.pushNamed(RoutesNames.visitsScreen),
          icon: HugeIcons.strokeRoundedClock04,
          title: LangKeys.waiting,
          count: "10",
          color: AppColors.white,
          textColor: AppColors.black,
        ),
        _buildCountCard(
          context: context,
          onTap: () => context.pushNamed(RoutesNames.visitsScreen),
          icon: HugeIcons.strokeRoundedCheckmarkCircle01,
          title: LangKeys.completed,
          count: "20",
          color: AppColors.black,
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
      width: context.width(percent: 0.17),
    );
  }

  void _showNewPatientSheet(BuildContext context) {
    customShowBottomSheet(
      context: context,
      widget: const NewPatient(),
      title: LangKeys.registerNewPatient,
    );
  }
}
