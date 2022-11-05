import 'package:flutter/material.dart';
import '../../../constants.dart';

Widget attachmentBox() {
  return Container(
    width: double.infinity,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        MessageAttachmentCard(
          iconData: Icons.insert_drive_file,
          title: "Document",
          press: () {},
        ),
        MessageAttachmentCard(
          iconData: Icons.image,
          title: "Gallery",
          press: () {},
        ),
        MessageAttachmentCard(
          iconData: Icons.headset,
          title: "Audio",
          press: () {},
        ),
        MessageAttachmentCard(
          iconData: Icons.videocam,
          title: "Video",
          press: () {},
        ),
      ],
    ),
  );
}

class MessageAttachmentCard extends StatelessWidget {
  final VoidCallback press;
  final IconData iconData;
  final String title;

  const MessageAttachmentCard(
      {Key? key,
      required this.press,
      required this.iconData,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.all(defaultPadding / 2),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(defaultPadding * 0.75),
              decoration: const BoxDecoration(
                color: primaryColor,
                shape: BoxShape.circle,
              ),
              child: Icon(iconData, size: 20, color: Colors.white),
            ),
            SizedBox(height: defaultPadding / 2),
            Text(
              title,
              style: Theme.of(context).textTheme.caption!.copyWith(
                    color: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .color!
                        .withOpacity(0.8),
                  ),
            )
          ],
        ),
      ),
    );
  }
}
