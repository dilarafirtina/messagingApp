import 'package:cht1/models/ChatMessage.dart';
import 'package:cht1/pages/messages/components/image_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';
import 'audio_message.dart';
import 'text_message.dart';
import 'video_message.dart';

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
          return TextMessage(message: message);
        case ChatMessageType.audio:
          return AudioMessage(message: message);
        case ChatMessageType.video:
          return VideoMessage();
        case ChatMessageType.image:
          return ImageMessage();
        default:
          return const SizedBox();
      }
    }

    return Container(
      padding: const EdgeInsets.only(top: defaultPadding),
      child: Row(
        mainAxisAlignment:
            message.isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!message.isSender) ...[
            const CircleAvatar(
              backgroundColor: secondaryColor,
              radius: 12,
              child: Icon(Icons.person, color: Colors.white, size: 20),
            ),
          ],
          Flexible(
            child: Container(
                padding: const EdgeInsets.only(left: 10),
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width / 4,
                    minWidth: MediaQuery.of(context).size.width / 8),
                child: messageContaint(message)),
          ),
        ],
      ),
    );
  }
}
