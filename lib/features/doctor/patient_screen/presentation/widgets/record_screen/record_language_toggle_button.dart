import 'package:flutter/material.dart';

import '../../../../../../core/style/color/app_color.dart';
import '../../../../../../core/style/statics/app_statics.dart';
import '../../../../../../core/style/widgets/app_text.dart';
import '../../cubits/speech_cubit/speech_cubit.dart';

class RecordLanguageToggleButton extends StatelessWidget {
  const RecordLanguageToggleButton({super.key, required this.cubit});

  final SpeechCubit cubit;

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      borderRadius: AppBorderRadius.mediumRadius,
      selectedColor: AppColors.blueAccent,
      isSelected:
          cubit.languageMap.keys
              .map((lang) => lang == cubit.state.selectedLanguage)
              .toList(),
      onPressed: (index) {
        cubit.switchLanguage(cubit.languageMap.keys.elementAt(index));
      },
      children:
          cubit.languageMap.values
              .map(
                (name) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: AppText(name),
                ),
              )
              .toList(),
    );
  }
}
