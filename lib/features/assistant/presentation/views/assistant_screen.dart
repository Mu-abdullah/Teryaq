import 'package:flutter/material.dart';

import '../refactor/assistant_screen_body.dart';
import '../widgets/assistant_app_bar.dart';

class AssistantScreen extends StatelessWidget {
  const AssistantScreen({super.key, required this.isAdmin});
  final bool isAdmin;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AssistantAppBar(isAdmin: isAdmin),
      body: AssistantScreenBody(),
    );
  }
}
