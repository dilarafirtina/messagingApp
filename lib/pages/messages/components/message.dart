import 'package:cht1/models/ChatMessage.dart';
import 'package:cht1/pages/messages/components/media_message.dart';
import 'package:cht1/pages/messages/components/receiver_message.dart';
import 'package:cht1/pages/messages/components/sender_message.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';
import 'audio_message.dart';

class Message extends StatelessWidget {
  const Message({
    Key? key,
    required this.message,
  }) : super(key: key);

  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    Widget messageContaint(ChatMessage message) {
      switch (message.messageType) {
        case ChatMessageType.text:
          return message.isSender
              ? senderTextMessage(context, message)
              : receiverTextMessage(context, message);
        case ChatMessageType.audio:
          return audioMessage(context, message);
        case ChatMessageType.image:
          return mediaMessage(context, message);
        default:
          return const SizedBox();
      }
    }

    return Container(
      width: MediaQuery.of(context).size.width,
      padding:
          const EdgeInsets.only(top: defaultPadding, bottom: defaultPadding),
      child: Row(
        mainAxisAlignment:
            message.isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!message.isSender) ...[
            const Padding(
              padding: EdgeInsets.only(right: 10),
              child: CircleAvatar(
                backgroundColor: secondaryColor,
                radius: 12,
                child: Icon(Icons.person, color: Colors.white, size: 20),
              ),
            ),
          ],
          Flexible(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: defaultPadding * 0.75,
                vertical: defaultPadding / 2,
              ),
              child: Column(
                children: [
                  messageContaint(message),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
