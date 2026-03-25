import 'package:flutter/material.dart';

import '../../../../../core/style/custom_widgets/custom_app_bar.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar());
  }
}
