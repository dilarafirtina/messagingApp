import 'package:cht1/utils/utils.dart';
import 'package:flutter/material.dart';

import '../../../models/chat_messages_model.dart';

Widget locationMessage(ChatMessage message) {
  return InkWell(
      onTap: () {
        launchInBrowser(message.url);
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.location_pin, color: Colors.red.shade600),
          const SizedBox(
            width: 5,
          ),
          Text(message.text ?? "")
        ],
      ));
}
