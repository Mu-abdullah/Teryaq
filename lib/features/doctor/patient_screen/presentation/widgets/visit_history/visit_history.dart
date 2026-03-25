import 'package:flutter/material.dart';

import '../../../../../../core/language/lang_keys.dart';
import '../../../../../../core/style/custom_widgets/section_title.dart';
import 'visit_history_listview.dart';

class VisitHistory extends StatelessWidget {
  const VisitHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(LangKeys.visitHistory),
        const VisitHistoryListview(),
      ],
    );
  }
}
