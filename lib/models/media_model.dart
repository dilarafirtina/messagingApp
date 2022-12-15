class Media {
  final String name, url, type;
  final int id;

  Media({
    required this.id,
    this.name = '',
    this.url = '',
    this.type = '',
  });
}

List imageList = [
  Media(
      id: 1, name: "Image 1", url: "https://picsum.photos/400", type: "image"),
  Media(
      id: 1, name: "Image 2", url: "https://picsum.photos/400", type: "image"),
  Media(
      id: 1, name: "Image 3", url: "https://picsum.photos/400", type: "image"),
  Media(
      id: 1, name: "Image 4", url: "https://picsum.photos/400", type: "image"),
  Media(
      id: 1, name: "Image 5", url: "https://picsum.photos/400", type: "image"),
];

List videoList = [
  Media(
      id: 0,
      name: "Video 1",
      url:
          "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
      type: "video"),
  Media(
      id: 1,
      name: "Video 2",
      url:
          "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
      type: "video"),
  Media(
      id: 2,
      name: "Video 3",
      url:
          "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
      type: "video"),
  Media(
      id: 3,
      name: "Video 4",
      url:
          "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
      type: "video"),
  Media(
      id: 4,
      name: "Video 5",
      url:
          "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4",
      type: "video"),
];

List documentList = [
  Media(
      id: 0,
      name: "Document 1",
      url:
          "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf",
      type: "document"),
  Media(
      id: 1,
      name: "Document 2",
      url:
          "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf",
      type: "document"),
  Media(
      id: 2,
      name: "Document 3",
      url:
          "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf",
      type: "document"),
  Media(
      id: 3,
      name: "Document 4",
      url:
          "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf",
      type: "document"),
  Media(
      id: 4,
      name: "Document 5",
      url:
          "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf",
      type: "document"),
];
