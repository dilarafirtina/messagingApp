import 'package:cht1/widgets/networkimage_widget.dart';
import 'package:flutter/material.dart';

import '../../../models/chat_messages_model.dart';
import '../../../utils/configuration.dart';

Widget stickerMessage(ChatMessage message) {
  return SizedBox(
      height: 100,
      width: 100,
      child: cachedNetworkImage(message.url ?? "", BoxFit.cover, "sticker"));
}
