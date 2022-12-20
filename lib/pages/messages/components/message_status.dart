import '../../../utils/configuration.dart';
import 'package:cht1/models/chat_messages_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MessageStatusDot extends StatelessWidget {
  final MessageStatus? status;

  const MessageStatusDot({Key? key, this.status}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Color dotColor(MessageStatus status) {
      switch (status) {
        case MessageStatus.not_sent:
        case MessageStatus.not_view:
          return Colors.grey;
        case MessageStatus.viewed:
          return blueColor;
        default:
          return Colors.transparent;
      }
    }

    return Container(
        margin: EdgeInsets.only(left: 5),
        height: 18,
        width: 18,
        child: Icon(
            status == MessageStatus.not_sent ? Icons.check : Icons.done_all,
            color: dotColor(status!),
            size: 16));
  }
}
