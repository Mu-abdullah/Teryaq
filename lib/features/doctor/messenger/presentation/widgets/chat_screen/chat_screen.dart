import 'package:flutter/material.dart';

import '../../../../../../core/language/lang_keys.dart';
import '../../../../../../core/style/widgets/app_button.dart';
import '../../../../../../core/style/widgets/app_text_form_felid.dart';
import '../../../../../../core/style/custom_widgets/custom_app_bar.dart';
import 'chat_list.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Patient name", translate: false),
      body: Column(
        children: [
          Expanded(child: ChatList()),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              spacing: 10,
              children: [
                Expanded(
                  child: AppTextFormField(
                    validate: (value) {
                      return null;
                    },
                    controller: TextEditingController(),
                    type: TextInputType.multiline,
                    hint: LangKeys.typeYourMessage,
                    label: LangKeys.message,
                  ),
                ),
                AppButton(onTap: () {}, isCircle: true, icon: Icons.send),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
