import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../functions/timestamp_to_time.dart';
import '../../widgets/app_text.dart';
import 'clock_bloc.dart';

class LiveClockWidget extends StatelessWidget {
  const LiveClockWidget({this.needDate = true, super.key});
  final bool needDate;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ClockBloc(use12Hour: true),
      child: BlocBuilder<ClockBloc, ClockState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppText(state.timeString, tr: false, isBold: true),
              needDate
                  ? AppText(
                      TimeRefactor.currentDateString(
                        format: 'EEEE, yyyy/MM/dd',
                      ),
                      maxLines: 2,
                      isBold: true,
                      tr: false,
                      textAlign: TextAlign.end,
                    )
                  : Container(),
            ],
          );
        },
      ),
    );
  }
}
