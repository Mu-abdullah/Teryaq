import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/language/lang_keys.dart';
import '../../../../../../core/style/custom_widgets/custom_shimmer.dart';
import '../../../../../../core/style/custom_widgets/live_clock_ui.dart';
import '../../../../../../core/style/statics/app_statics.dart';
import '../../../../../../core/style/widgets/app_text.dart';
import '../../cubits/dr_home_cubit/dr_home_cubit.dart';

class DoctorName extends StatelessWidget {
  const DoctorName({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DrHomeCubit, DrHomeState>(
      builder: (context, state) {
        return Container(
          padding: AppPadding.symmetricPadding(),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(LangKeys.welcome),
                    _buildDoctorName(state),
                  ],
                ),
              ),
              const LiveClockWidget(),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDoctorName(DrHomeState state) {
    if (state is DrHomeLoaded) {
      return AppText(
        state.doctor.dName,
        tr: false,
        isTitle: true,
        isBold: true,
      );
    }

    if (state is DrHomeLoading) {
      return ShimmerLoadingText();
    }

    if (state is DrHomeError) {
      return AppText(state.message, isTitle: true, isBold: true);
    }

    return const AppText(' ', tr: false, isTitle: true, isBold: true);
  }
}
