import 'package:cht1/models/ChatMessage.dart';
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
      padding: EdgeInsets.symmetric(
        horizontal: defaultPadding * 0.75,
        vertical: defaultPadding / 2,
      ),
      decoration: BoxDecoration(
        color: message!.isSender ? textBoxMe : Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        message!.text,
        style: TextStyle(color: Colors.black87),
      ),
    );
  }
}
