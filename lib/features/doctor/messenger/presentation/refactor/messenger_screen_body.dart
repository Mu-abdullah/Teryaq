import 'package:flutter/material.dart';

import '../widgets/messenger_item.dart';

class MessengerScreenBody extends StatelessWidget {
  const MessengerScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 50,
      itemBuilder: (context, index) {
        return MassengerItem();
      },
    );
  }
}
