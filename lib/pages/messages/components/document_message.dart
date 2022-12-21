import 'package:cht1/utils/configuration.dart';
import 'package:cht1/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../models/chat_messages_model.dart';
import 'package:mime/mime.dart';

Widget documentMessage(ChatMessage message) {
  return InkWell(
      onTap: () {
        launchInBrowser(message.url);
      },
      child: Column(
        children: [
          FaIcon(returnFileType(message.url!),
              color: Colors.grey.shade600, size: 40),
          const SizedBox(
            width: 5,
          ),
          Text(
            message.text ?? "",
            style:
                TextStyle(fontSize: textSizeSmall, color: Colors.grey.shade600),
          )
        ],
      ));
}

IconData returnFileType(String url) {
  final mimeType = lookupMimeType(url);
  switch (mimeType) {
    case "application/pdf":
      return FontAwesomeIcons.filePdf;
    case "text/html":
      return FontAwesomeIcons.html5;
    case "application/msword":
      return FontAwesomeIcons.fileWord;
    case "application/vnd.ms-excel":
      return FontAwesomeIcons.fileExcel;
    default:
      return Icons.file_copy;
  }
}
