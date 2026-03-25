import 'package:flutter/material.dart';

import 'chat_item.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: messages.length,
      itemBuilder: (context, index) {
        return ChatItem(messages: messages[index]);
      },
    );
  }
}

final List<Map<String, dynamic>> messages = [
  {'message': 'Hello, how are you?', 'isMe': true, 'time': '10:00 AM'},
  {
    'message': 'I\'m good, thanks for asking!',
    'isMe': false,
    'time': '10:01 AM',
  },
  {'message': 'That\'s great!', 'isMe': true, 'time': '10:02 AM'},
  {'message': 'How can I help you?', 'isMe': false, 'time': '10:03 AM'},
  {
    'message': 'I need to book an appointment.',
    'isMe': true,
    'time': '10:04 AM',
  },
  {
    'message': 'Sure, let me see what I can do.',
    'isMe': false,
    'time': '10:05 AM',
  },
  {
    'message':
        'Thanks, I\'ll get right on that. Have a nice day, but see you soon! 😊,i want to say i sastfaied to work with you',
    'isMe': true,
    'time': '10:05 AM',
  },
  {
    'message':
        'Thanks, I\'ll get right on that. Have a nice day, but see you soon! 😊,i want to say i sastfaied to work with you',
    'isMe': false,
    'time': '10:05 AM',
  },
];
