import 'package:cht1/utils/configuration.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../models/media_model.dart';
import '../../../models/template_message.dart';
import 'package:flutter/material.dart';

import '../../../widgets/widgets.dart';

Widget locations(Function onTap) {
  return Column(children: [
    const SizedBox(height: 10),
    Row(
      children: [
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: TextField(
              onChanged: (value) {},
              decoration: const InputDecoration(
                labelText: 'Search',
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: FormBuilderDropdown(
              name: 'language',
              decoration: const InputDecoration(
                labelText: 'Select Language',
              ),
              initialValue: languages[0][text],
              onChanged: (value) {
                print(value);
              },
              items: languages
                  .map((language) => DropdownMenuItem(
                        value: language["text"],
                        child: Row(children: [
                          Image.asset(
                            language["image"]!,
                            width: 25,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(language["text"]!)
                        ]),
                      ))
                  .toList(),
            ),
          ),
        ),
      ],
    ),
    Expanded(
      child: ListView.builder(
        itemCount: locationList.length,
        shrinkWrap: true,
        itemBuilder: (context, index) =>
            locationListTile(locationList[index], onTap),
      ),
    ),
  ]);
}

Widget locationListTile(Media item, onTap) {
  return Card(
    margin: const EdgeInsets.symmetric(horizontal: 8, vertical: defaultPadding),
    child: ListTile(
      minVerticalPadding: 20,
      onTap: onTap,
      title: Text(item.name),
      leading: const Icon(
        Icons.location_pin,
        color: textBoxMe,
      ),
    ),
  );
}
