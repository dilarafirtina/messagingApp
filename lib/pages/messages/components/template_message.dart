import 'package:flutter/material.dart';

import '../../../models/chat_messages_model.dart';
import '../../../utils/configuration.dart';

Widget locationMessage(ChatMessage message, onTap) {
  return ListTile(
    minVerticalPadding: 20,
    onTap: onTap,
    title: const Text("Location Name"),
    leading: const Icon(
      Icons.location_pin,
      color: textBoxMe,
    ),
  );
}
