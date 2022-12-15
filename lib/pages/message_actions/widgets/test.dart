import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => TestState();
}

class TestState extends State<Test> {
  String? _thumbnailUrl;

  @override
  void initState() {
    super.initState();
    generateThumbnail();
  }

  void generateThumbnail() async {
    _thumbnailUrl = await VideoThumbnail.thumbnailFile(
        video:
            "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
        thumbnailPath: (await getTemporaryDirectory()).path,
        imageFormat: ImageFormat.PNG);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Video Thumbnail"),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(10),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Thumbnail using Video url :"),
                    SizedBox(
                      height: 10,
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.file(File(_thumbnailUrl!)),
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.black45,
                          child: Icon(
                            Icons.play_arrow,
                            size: 40,
                            color: Colors.white,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
