import '../../../models/template_message.dart';
import 'package:flutter/material.dart';

Widget templateList(TemplateMessageModel item, onTap) {
  return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: ListTile(
        onTap: onTap,
        title: Text(item.name),
        subtitle: Text(item.body),
        leading: returnLanguage(item.language),
      ));
}

Widget returnLanguage(String language) {
  var imageLink = "";
  if (language == "en") {
    imageLink = "images/uk.png";
  } else if (language == "tr") {
    imageLink = "images/tr.png";
  } else if (language == "de") {
    imageLink = "images/de.png";
  } else if (language == "ru") {
    imageLink = "images/ru.png";
  }
  return Column(children: [
    Image.asset(
      imageLink,
      width: 24,
    ),
    Text(language.toUpperCase())
  ]);
}
