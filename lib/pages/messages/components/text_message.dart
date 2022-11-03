import 'package:cht1/models/ChatMessage.dart';
import 'package:cht1/pages/messages/components/message_status.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class TextMessage extends StatelessWidget {
  const TextMessage({
    Key? key,
    this.message,
  }) : super(key: key);

  final ChatMessage? message;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(
          horizontal: defaultPadding * 0.75,
          vertical: defaultPadding / 2,
        ),
        decoration: BoxDecoration(
          color: message!.isSender ? textBoxMe : Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          children: [
            Container(
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width / 4,
                  minWidth: MediaQuery.of(context).size.width / 8),
              padding: const EdgeInsets.only(
                  top: defaultPadding / 2, left: defaultPadding / 2),
              alignment: Alignment.topLeft,
              child: Text(
                message!.text,
                style: TextStyle(color: Colors.black87),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  message!.time,
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                if (message!.isSender)
                  MessageStatusDot(status: message!.messageStatus)
              ],
            ),
          ],
        ));
  }
}
