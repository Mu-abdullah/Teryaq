import 'package:main_app/core/extextions/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../../../core/language/lang_keys.dart';
import '../../../../../../core/style/color/app_color.dart';
import '../../../../../../core/style/statics/app_statics.dart';
import '../../../../../../core/style/widgets/app_button.dart';
import '../../../../../../core/style/widgets/app_text.dart';
import '../../../../../../core/style/widgets/app_text_form_felid.dart';
import '../../cubits/speech_cubit/speech_cubit.dart';
import 'record_language_toggle_button.dart';

class RecordScreen extends StatelessWidget {
  const RecordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SpeechCubit(),
      child: BlocBuilder<SpeechCubit, SpeechState>(
        builder: (context, state) {
          var cubit = context.read<SpeechCubit>();
          var isListening = state.isListening;
          return Container(
            height: context.height(percent: 0.6),
            decoration: BoxDecoration(
              borderRadius: AppBorderRadius.mediumRadius,
              color: AppColors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.2),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              spacing: 24,
              children: [
                AppText(LangKeys.startRecord, maxLines: 10),
                RecordLanguageToggleButton(cubit: cubit),
                Row(
                  spacing: 16,
                  children: [
                    Expanded(
                      child: AppTextFormField(
                        controller: cubit.diagnosis,
                        type: TextInputType.text,
                        hint: LangKeys.diagnosis,
                        label: LangKeys.diagnosis,
                        validate: (x) {
                          return null;
                        },
                      ),
                    ),
                    AppButton(
                      backGroungColor: AppColors.blueAccent,
                      isUpperCase: false,
                      isCircle: true,
                      onTap: () {
                        isListening
                            ? cubit.stopListening()
                            : cubit.startListening();
                      },
                      icon:
                          isListening
                              ? HugeIcons.strokeRoundedMic02
                              : HugeIcons.strokeRoundedMic01,
                      iconColor: isListening ? AppColors.red : AppColors.white,
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
