import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../../../core/style/color/app_color.dart';
import '../../../../../../core/style/statics/app_statics.dart';
import '../../../../../../core/style/widgets/app_text.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({super.key, required this.messages});

  final Map<String, dynamic> messages;

  @override
  Widget build(BuildContext context) {
    final bool isMe = messages['isMe'];
    final alignment = isMe ? Alignment.centerRight : Alignment.centerLeft;
    final crossAxisAlignment = isMe
        ? CrossAxisAlignment.end
        : CrossAxisAlignment.start;
    final bgColor = isMe
        ? AppColors.blueAccent.withValues(alpha: 0.1)
        : AppColors.green.withValues(alpha: 0.1);
    final textColor = AppColors.black;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        spacing: 10,
        children: [
          _buildAvatar(isMe, !isMe),
          Expanded(
            child: Align(
              alignment: alignment,
              child: Container(
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: AppBorderRadius.largeRadius,
                ),
                padding: AppPadding.only(
                  left: 12,
                  right: 12,
                  top: 8,
                  bottom: 8,
                ),
                child: Column(
                  crossAxisAlignment: crossAxisAlignment,
                  spacing: 5,
                  children: [
                    AppText(
                      messages['message'],
                      color: textColor,
                      tr: false,
                      maxLines: 100,
                      textAlign: isMe ? TextAlign.start : TextAlign.end,
                    ),
                    const SizedBox(height: 4),
                    AppText(
                      messages['time'],
                      color: textColor,
                      tr: false,
                      fontSize: 9,
                      isBold: true,
                    ),
                  ],
                ),
              ),
            ),
          ),
          _buildAvatar(isMe, isMe),
        ],
      ),
    );
  }

  Widget _buildAvatar(bool isMe, bool isVisible) {
    if (!isVisible) return const SizedBox(width: 48, height: 48);

    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: isMe
            ? AppColors.blueAccent.withValues(alpha: 0.2)
            : AppColors.black.withValues(alpha: 0.2),
        shape: BoxShape.circle,
      ),
      child: isMe
          ? const Icon(HugeIcons.strokeRoundedDoctor01)
          : const Icon(HugeIcons.strokeRoundedPatient),
    );
  }
}
