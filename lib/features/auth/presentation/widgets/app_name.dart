import 'package:flutter/material.dart';
import 'package:main_app/core/style/widgets/app_text.dart';

import '../../../../core/language/lang_keys.dart';

class AppName extends StatelessWidget {
  const AppName({this.size = 48, super.key});
  final double size;
  @override
  Widget build(BuildContext context) {
    return AppText(
      LangKeys.appName,
      fontSize: size,
      textAlign: TextAlign.center,
      isBold: true,
    );
  }
}