import 'package:flutter/material.dart';

import '../../../../core/style/custom_widgets/patient_card.dart';
import '../../../../core/style/statics/app_statics.dart';
import '../../../../core/style/widgets/custom_divider.dart';
import '../../../../core/style/custom_widgets/search_field_widget.dart';
import '../widgets/assistant_patients_cards.dart';
import '../widgets/dr_assistant_name.dart';

class AssistantScreenBody extends StatelessWidget {
  const AssistantScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: AppPadding.symmetricPadding(),
                    child: Column(
                      spacing: 16,
                      children: [
                        DrAssistantName(),
                        CustomDivider(opacity: 0.5, endIndent: 0, indent: 0),
                        AssistantPatientsCards(),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: AppPadding.symmetricPadding(),
                    child: Column(
                      spacing: 16,
                      children: [
                        SearchFieldWidget(),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return PatientCard(age: "35", name: "Muhammad");
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        } else {
          return SingleChildScrollView(
            child: Padding(
              padding: AppPadding.symmetricPadding(),
              child: Column(
                spacing: 16,
                children: [
                  DrAssistantName(),

                  CustomDivider(opacity: 0.5, endIndent: 0, indent: 0),
                  SearchFieldWidget(),
                  AssistantPatientsCards(),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
