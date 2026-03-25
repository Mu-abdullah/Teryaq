import 'package:flutter/material.dart';

import '../../../../../core/style/statics/app_statics.dart';
import '../widgets/admin_sections/mode_section.dart';
import '../widgets/admin_sections/clients_section.dart';
import '../widgets/admin_sections/settings_section.dart';

class AdminHomeBody extends StatelessWidget {
  const AdminHomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: AppPadding.symmetricPadding(),
        child: Column(
          spacing: 16,
          children: [ModeSection(), ClientsSection(), SettingsSection()],
        ),
      ),
    );
  }
}
