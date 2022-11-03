import 'package:cht1/widgets/networkimage_widget.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class ImageMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.45,
      child: AspectRatio(
        aspectRatio: 1.6,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: defaultPadding),
              height: MediaQuery.of(context).size.width * 0.55,
              width: MediaQuery.of(context).size.width * 0.35,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                border: Border.all(color: textBoxMe, width: 3),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: cachedNetworkImage(
                      "https://yasmak.opex.app/images/splash1.jpg",
                      BoxFit.cover,
                      'message')),
            )
          ],
        ),
      ),
    );
  }
}
