enum ChatMessageType {
  text,
  audio,
  image,
  video,
  document,
  sticker,
  template,
  location
}

enum MessageStatus { not_sent, not_view, viewed }

class ChatMessage {
  final String? text, url, avatar;
  final String date, time;
  final ChatMessageType messageType;
  final MessageStatus messageStatus;
  final bool isSender;

  ChatMessage({
    this.text = '',
    this.url = '',
    this.avatar = '',
    required this.messageType,
    required this.messageStatus,
    required this.isSender,
    required this.date,
    required this.time,
  });
}

List demeChatMessages = [
  ChatMessage(
      avatar:
          "https://t3.ftcdn.net/jpg/03/67/46/48/360_F_367464887_f0w1JrL8PddfuH3P2jSPlIGjKU2BI0rn.jpg",
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
      avatar:
          "https://t3.ftcdn.net/jpg/03/67/46/48/360_F_367464887_f0w1JrL8PddfuH3P2jSPlIGjKU2BI0rn.jpg",
      text: "",
      url: "https://actions.google.com/sounds/v1/alarms/alarm_clock.ogg",
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
      avatar:
          "https://t3.ftcdn.net/jpg/03/67/46/48/360_F_367464887_f0w1JrL8PddfuH3P2jSPlIGjKU2BI0rn.jpg",
      text: "Lorem ipsum dolor amet",
      messageType: ChatMessageType.text,
      messageStatus: MessageStatus.viewed,
      isSender: false,
      date: "01.11.2022",
      time: "13.05"),
  ChatMessage(
      url: "https://yasmak.opex.app/images/splash2.jpg",
      messageType: ChatMessageType.image,
      messageStatus: MessageStatus.viewed,
      isSender: true,
      date: "01.11.2022",
      time: "13.15"),
  ChatMessage(
      avatar:
          "https://t3.ftcdn.net/jpg/03/67/46/48/360_F_367464887_f0w1JrL8PddfuH3P2jSPlIGjKU2BI0rn.jpg",
      text:
          "Lorem ipsum dolor amet Lorem ipsum dolor amet Lorem ipsum dolor amet Lorem ipsum dolor amet Lorem ipsum dolor amet",
      messageType: ChatMessageType.text,
      messageStatus: MessageStatus.not_view,
      isSender: true,
      date: "01.11.2022",
      time: "13.07"),
  ChatMessage(
      text: "Lorem ipsum dolor",
      avatar:
          "https://t3.ftcdn.net/jpg/03/67/46/48/360_F_367464887_f0w1JrL8PddfuH3P2jSPlIGjKU2BI0rn.jpg",
      url: "https://yasmak.opex.app/images/splash1.jpg",
      messageType: ChatMessageType.image,
      messageStatus: MessageStatus.viewed,
      isSender: false,
      date: "01.11.2022",
      time: "13.15"),
  ChatMessage(
      avatar:
          "https://t3.ftcdn.net/jpg/03/67/46/48/360_F_367464887_f0w1JrL8PddfuH3P2jSPlIGjKU2BI0rn.jpg",
      text: "",
      url: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3",
      messageType: ChatMessageType.audio,
      messageStatus: MessageStatus.viewed,
      isSender: true,
      date: "01.11.2022",
      time: "12.47"),
  ChatMessage(
      avatar:
          "https://t3.ftcdn.net/jpg/03/67/46/48/360_F_367464887_f0w1JrL8PddfuH3P2jSPlIGjKU2BI0rn.jpg",
      text: "Document1.pdf",
      url:
          "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf",
      messageType: ChatMessageType.document,
      messageStatus: MessageStatus.viewed,
      isSender: false,
      date: "01.11.2022",
      time: "13.15"),
  ChatMessage(
      avatar: "",
      text: "Document2.pdf",
      url:
          "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf",
      messageType: ChatMessageType.document,
      messageStatus: MessageStatus.viewed,
      isSender: true,
      date: "01.11.2022",
      time: "12.47"),
  ChatMessage(
      avatar:
          "https://t3.ftcdn.net/jpg/03/67/46/48/360_F_367464887_f0w1JrL8PddfuH3P2jSPlIGjKU2BI0rn.jpg",
      text: "Hotel 1",
      url: "https://goo.gl/maps/LEJa9Zowv3HVJRZ98",
      messageType: ChatMessageType.location,
      messageStatus: MessageStatus.viewed,
      isSender: false,
      date: "01.11.2022",
      time: "13.15"),
  ChatMessage(
      avatar: "",
      text: "Location 1",
      url: "https://goo.gl/maps/LEJa9Zowv3HVJRZ98",
      messageType: ChatMessageType.location,
      messageStatus: MessageStatus.viewed,
      isSender: true,
      date: "01.11.2022",
      time: "12.47"),
  ChatMessage(
      avatar:
          "https://t3.ftcdn.net/jpg/03/67/46/48/360_F_367464887_f0w1JrL8PddfuH3P2jSPlIGjKU2BI0rn.jpg",
      url: "https://cdn-icons-png.flaticon.com/512/4383/4383914.png",
      messageType: ChatMessageType.sticker,
      messageStatus: MessageStatus.viewed,
      isSender: false,
      date: "01.11.2022",
      time: "13.15"),
  ChatMessage(
      avatar: "",
      text: "",
      url: "https://cdn-icons-png.flaticon.com/512/4383/4383823.png",
      messageType: ChatMessageType.sticker,
      messageStatus: MessageStatus.viewed,
      isSender: true,
      date: "01.11.2022",
      time: "12.47"),
  ChatMessage(
      avatar:
          "https://t3.ftcdn.net/jpg/03/67/46/48/360_F_367464887_f0w1JrL8PddfuH3P2jSPlIGjKU2BI0rn.jpg",
      url:
          "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf",
      messageType: ChatMessageType.template,
      messageStatus: MessageStatus.viewed,
      isSender: false,
      date: "01.11.2022",
      time: "13.15"),
  ChatMessage(
      avatar: "",
      text: "",
      url:
          "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf",
      messageType: ChatMessageType.template,
      messageStatus: MessageStatus.viewed,
      isSender: true,
      date: "01.11.2022",
      time: "12.47"),
];
