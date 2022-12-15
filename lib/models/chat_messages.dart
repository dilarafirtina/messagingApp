enum ChatMessageType { text, audio, image, video }

enum MessageStatus { not_sent, not_view, viewed }

class ChatMessage {
  final String text, date, time;
  final ChatMessageType messageType;
  final MessageStatus messageStatus;
  final bool isSender;

  ChatMessage({
    this.text = '',
    required this.messageType,
    required this.messageStatus,
    required this.isSender,
    required this.date,
    required this.time,
  });
}

List demeChatMessages = [
  ChatMessage(
      text: "Lorem",
      messageType: ChatMessageType.text,
      messageStatus: MessageStatus.viewed,
      isSender: false,
      date: "01.11.2022",
      time: "12.45"),
  ChatMessage(
      text: "Lorem ipsum?",
      messageType: ChatMessageType.text,
      messageStatus: MessageStatus.viewed,
      isSender: true,
      date: "01.11.2022",
      time: "12.46"),
  ChatMessage(
      text: "",
      messageType: ChatMessageType.audio,
      messageStatus: MessageStatus.viewed,
      isSender: false,
      date: "01.11.2022",
      time: "12.47"),
  ChatMessage(
      text: "Error happend",
      messageType: ChatMessageType.text,
      messageStatus: MessageStatus.not_sent,
      isSender: true,
      date: "01.11.2022",
      time: "12.47"),
  ChatMessage(
      text: "Lorem ipsum dolor amet",
      messageType: ChatMessageType.text,
      messageStatus: MessageStatus.viewed,
      isSender: false,
      date: "01.11.2022",
      time: "13.05"),
  ChatMessage(
      text:
          "Lorem ipsum dolor amet Lorem ipsum dolor amet Lorem ipsum dolor amet Lorem ipsum dolor amet Lorem ipsum dolor amet",
      messageType: ChatMessageType.text,
      messageStatus: MessageStatus.not_view,
      isSender: true,
      date: "01.11.2022",
      time: "13.07"),
  ChatMessage(
      text: "",
      messageType: ChatMessageType.image,
      messageStatus: MessageStatus.viewed,
      isSender: false,
      date: "01.11.2022",
      time: "13.15"),
];
