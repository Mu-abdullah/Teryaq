import 'package:main_app/core/language/lang_keys.dart';
import 'package:main_app/core/style/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../services/status/gender_status.dart';
import '../color/app_color.dart';

class GenderChoose extends StatelessWidget {
  final Gender? groupValue;
  final ValueChanged<Gender?> onChanged;

  const GenderChoose({
    super.key,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return RadioGroup<Gender>(
      groupValue: groupValue,
      onChanged: onChanged,
      child: Row(
        children: [
          Expanded(
            child: RadioListTile<Gender>(
              title: Row(
                mainAxisSize:
                    MainAxisSize.min, // better than custom spacing widget
                children: [
                  Icon(HugeIcons.strokeRoundedMan, color: AppColors.blueAccent),
                  const SizedBox(width: 8),
                  AppText(LangKeys.male),
                ],
              ),
              contentPadding: EdgeInsets.zero,
              value: Gender.male,

              activeColor: Colors.blueAccent,
            ),
          ),
          const SizedBox(
            height: 50,
            child: VerticalDivider(color: AppColors.grey),
          ),
          Expanded(
            child: RadioListTile<Gender>(
              title: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(HugeIcons.strokeRoundedWoman, color: AppColors.pink),
                  const SizedBox(width: 8),
                  AppText(LangKeys.female),
                ],
              ),
              contentPadding: EdgeInsets.zero,
              value: Gender.female,

              activeColor: Colors.pink,
            ),
          ),
        ],
      ),
    );
  }
}
