import 'package:flutter/material.dart';

import '../refactor/user_screen_body.dart';
import '../widgets/user_app_bar.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key, this.isAdmin = false});
  final bool isAdmin;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UserCustomAppBar(isAdmin: isAdmin),
      body: UserScreenBody(),
    );
  }
}

