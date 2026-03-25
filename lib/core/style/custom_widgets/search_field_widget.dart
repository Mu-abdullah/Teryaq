import 'package:main_app/core/extextions/extentions.dart';

import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../language/lang_keys.dart';
import '../../routes/routes_name.dart';
import '../statics/app_statics.dart';
import '../widgets/app_button.dart';
import '../widgets/app_text_form_felid.dart';

class SearchFieldWidget extends StatelessWidget {
  SearchFieldWidget({super.key});
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPadding.symmetricPadding(vertical: 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        spacing: 10,
        children: [
          Expanded(
            child: AppTextFormField(
              controller: controller,
              type: TextInputType.text,
              hint: LangKeys.searchHint,
              label: LangKeys.search,
              prefix: Icon(HugeIcons.strokeRoundedSearch01, color: Colors.grey),
              validate: (c) {
                return null;
              },
              onSubmitted: (v) {
                context.pushNamed(
                  RoutesNames.doctorSearch,
                  arguments: {'searchQuery': v},
                );
                controller.clear();
              },
            ),
          ),
          AppButton(
            onTap: () {
              context.pushNamed(
                RoutesNames.doctorSearch,
                arguments: {'searchQuery': controller.text},
              );
              controller.clear();
            },
            isCircle: true,
            backGroungColor: Colors.black.withValues(alpha: 0.1),
            icon: HugeIcons.strokeRoundedSearch01,
            iconColor: Colors.black,
          ),
        ],
      ),
    );
  }
}
