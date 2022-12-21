import 'package:cht1/models/chat_messages_model.dart';
import 'package:cht1/pages/messages/components/location_message.dart';
import 'package:cht1/pages/messages/components/media_message.dart';
import 'package:cht1/pages/messages/components/receiver_message_container.dart';
import 'package:cht1/pages/messages/components/sender_message_container.dart';
import 'package:cht1/widgets/networkimage_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/configuration.dart';
import '../../../widgets/widgets.dart';
import 'audio_message.dart';
import 'document_message.dart';
import 'sticker_message.dart';

class Message extends StatelessWidget {
  const Message({
    Key? key,
    required this.message,
  }) : super(key: key);

  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.size.width,
      padding:
          const EdgeInsets.only(top: defaultPadding, bottom: defaultPadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment:
            message.isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!message.isSender) ...[
            message.avatar!.isEmpty
                ? const Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: CircleAvatar(
                        backgroundColor: kSecondaryColor,
                        radius: 12,
                        child:
                            Icon(Icons.person, color: Colors.white, size: 20)),
                  )
                : circleAvatar(message.avatar!)
          ],
          Flexible(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: defaultPadding * 0.75,
                vertical: defaultPadding / 2,
              ),
              child: Column(
                children: [
                  message.isSender
                      ? senderTextMessage(message, messageContaint(message))
                      : receiverTextMessage(message, messageContaint(message)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget messageContaint(ChatMessage message) {
  switch (message.messageType) {
    case ChatMessageType.text:
      return Text(message.text ?? "");
    case ChatMessageType.audio:
      return audioMessage(message);
    case ChatMessageType.image:
      return mediaMessage(message);
    case ChatMessageType.location:
      return locationMessage(message);
    case ChatMessageType.document:
      return documentMessage(message);
    case ChatMessageType.sticker:
      return stickerMessage(message);
    default:
      return const SizedBox();
  }
}
