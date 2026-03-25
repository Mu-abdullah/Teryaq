import 'package:flutter/material.dart';

import '../../../../../core/style/widgets/app_text.dart';

class HomeTitle extends StatelessWidget {
  const HomeTitle({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return AppText(
      title,
      isTitle: true,
      isBold: true,
      textAlign: TextAlign.center,
      fontSize: 20,
    );
  }
}
