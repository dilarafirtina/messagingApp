class Chat {
  final String name, lastMessage, roomNumber, time, status;
  final bool isActive;

  Chat({
    this.name = '',
    this.lastMessage = '',
    this.roomNumber = '',
    this.time = '',
    this.status = 'queue',
    this.isActive = false,
  });
}

List queueData = [
  Chat(
    name: "Jacob Jones",
    lastMessage: "Lorem ipsum dolor...",
    roomNumber: "123",
    time: "5d ago",
    isActive: true,
  ),
  Chat(
    name: "Albert Flores",
    lastMessage: "Thanks",
    roomNumber: "1234",
    time: "6d ago",
    isActive: false,
  ),
  Chat(
    name: "Jenny Wilson",
    lastMessage: "Lorem ipsum dolor...",
    roomNumber: "432",
    time: "3m ago",
    isActive: false,
  ),
  Chat(
    name: "Esther Howard",
    lastMessage: "Lorem ipsum dolor...",
    roomNumber: "5000",
    time: "8m ago",
    isActive: true,
  ),
  Chat(
    name: "Ralph Edwards",
    lastMessage: "Do you have update...",
    roomNumber: "7000",
    time: "5d ago",
    isActive: false,
  ),
];

List acceptedData = [
  Chat(
    name: "Jenny Wilson",
    lastMessage: "Lorem ipsum dolor...",
    roomNumber: "2000",
    time: "3m ago",
    isActive: false,
  ),
  Chat(
    name: "Esther Howard",
    lastMessage: "Lorem ipsum dolor...",
    roomNumber: "2003",
    time: "8m ago",
    isActive: true,
  ),
  Chat(
    name: "Ralph Edwards",
    lastMessage: "Lorem ipsum dolor...",
    roomNumber: "2244",
    time: "5d ago",
    isActive: false,
  ),
  Chat(
    name: "Jenny Wilson",
    lastMessage: "Lorem ipsum dolor...",
    roomNumber: "7777",
    time: "3m ago",
    isActive: false,
  ),
  Chat(
    name: "Esther Howard",
    lastMessage: "Lorem ipsum dolor...",
    roomNumber: "1229",
    time: "8m ago",
    isActive: true,
  ),
];

List resolvedData = [
  Chat(
    name: "Jenny Wilson",
    lastMessage: "Lorem ipsum dolor...",
    roomNumber: "1200",
    time: "3m ago",
    isActive: false,
  ),
  Chat(
    name: "Esther Howard",
    lastMessage: "Lorem ipsum dolor...",
    roomNumber: "1201",
    time: "8m ago",
    isActive: true,
  ),
  Chat(
    name: "Ralph Edwards",
    lastMessage: "Do you have update...",
    roomNumber: "1202",
    time: "5d ago",
    isActive: false,
  ),
];
