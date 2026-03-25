import 'package:flutter/material.dart';

import 'visit_history_item.dart';

class VisitHistoryListview extends StatelessWidget {
  const VisitHistoryListview({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) {
        return const VistiHistoryItem();
      },
    );
  }
}
