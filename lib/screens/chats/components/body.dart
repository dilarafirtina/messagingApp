import 'package:cht1/models/Chat.dart';
import 'package:cht1/screens/messages/message_screen.dart';
import 'package:flutter/material.dart';

import 'chat_card.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: chatsData.length,
      itemBuilder: (context, index) => ChatCard(
        chat: chatsData[index],
        press: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MessagesScreen(),
          ),
        ),
      ),
    );
  }
}
