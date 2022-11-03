import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget cachedNetworkImage(String imageUrl, BoxFit? fitValue, String heroTag) {
  return CachedNetworkImage(
    imageUrl: imageUrl,
    imageBuilder: (context, imageProvider) => DetailImage(
        heroTag: heroTag,
        imageProvider: imageProvider,
        fitValue: fitValue ?? BoxFit.contain),
    placeholder: (context, url) => ErrorImage(
      heroTag: heroTag,
      imageProvider: const AssetImage('images/logo.png'),
    ),
    errorWidget: (context, url, error) => ErrorImage(
      heroTag: heroTag,
      imageProvider: const AssetImage('images/logo.png'),
    ),
  );
}

class DetailImage extends StatelessWidget {
  final String heroTag;
  final ImageProvider imageProvider;
  final BoxFit? fitValue;

  const DetailImage({
    Key? key,
    required this.heroTag,
    required this.imageProvider,
    this.fitValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: heroTag,
        child: Material(
          type: MaterialType.transparency,
          child: Image(image: imageProvider, fit: fitValue ?? BoxFit.contain),
        ));
  }
}

class ErrorImage extends StatelessWidget {
  final String heroTag;
  final ImageProvider imageProvider;

  const ErrorImage({
    Key? key,
    required this.heroTag,
    required this.imageProvider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: heroTag,
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            padding: const EdgeInsets.all(50.0),
            height: Get.height / 3.00,
            child: Container(
              margin: const EdgeInsets.all(50),
              decoration: BoxDecoration(
                image:
                    DecorationImage(image: imageProvider, fit: BoxFit.fitWidth),
                // boxShadow: [
                //   BoxShadow(
                //       color: Color(0xFF3C4858).withOpacity(.4),
                //       offset: Offset(3.0, 3.0),
                //       blurRadius: 10.0),
                // ],
              ),
            ),
          ),
        ));
  }
}
