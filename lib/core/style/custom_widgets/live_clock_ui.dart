import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../widgets/app_text.dart';

class LiveClockWidget extends StatefulWidget {
  const LiveClockWidget({
    this.needDate = true,
    super.key,
  });

  final bool needDate;

  @override
  State<LiveClockWidget> createState() => _LiveClockWidgetState();
}

class _LiveClockWidgetState extends State<LiveClockWidget> {
  Timer? _timer;

  String time = '';
  String date = '';

  @override
  void initState() {
    super.initState();

    _updateClock();

    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) => _updateClock(),
    );
  }

  void _updateClock() {
    final now = DateTime.now();

    if (!mounted) return;

    setState(() {
      time = DateFormat('hh:mm:ss a', 'en').format(now);
      date = DateFormat(
        'EEEE, yyyy/MM/dd',
        'en',
      ).format(now);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppText(
          time,
          tr: false,
          isBold: true,
        ),

        if (widget.needDate)
          AppText(
            date,
            maxLines: 2,
            isBold: true,
            tr: false,
            textAlign: TextAlign.end,
          ),
      ],
    );
  }
}