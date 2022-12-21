import 'package:cht1/models/media_model.dart';
import 'package:cht1/utils/configuration.dart';
import 'package:cht1/widgets/default_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import '../../../widgets/networkimage_widget.dart';
import '../../../widgets/show_dialog.dart';
import '../../../widgets/widgets.dart';

Widget mediaSlider(List items) {
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
    const SizedBox(height: 10),
    Expanded(
      //height: 550,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemCount: items.length,
        itemBuilder: (context, index) => InkWell(
            onTap: () {
              if (items[index].type == "image" ||
                  items[index].type == "video") {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  showDialog<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return customAlertDialog(
                            context,
                            "Send Image",
                            SizedBox(
                                width: double.infinity,
                                height: 450,
                                child: Column(
                                  children: [
                                    Container(
                                        padding: const EdgeInsets.only(
                                            bottom: defaultPadding),
                                        width: 350,
                                        height: 300,
                                        child: createSliderItems(items[index])),
                                    const TextField(),
                                    defaultButton(text: "Gönder")
                                  ],
                                )));
                      });
                });
              } else {}
            },
            child: createSliderItems(items[index])),
      ),
    ),
  ]);
}

Widget createSliderItems(Media item) {
  return Container(
    margin: const EdgeInsets.all(5.0),
    child: ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(5.0)),
      child: Stack(
        children: <Widget>[
          SizedBox(
            height: double.infinity,
            width: 400,
            child: item.type == "document"
                ? Icon(Icons.description, size: 80)
                : cachedNetworkImage(
                    item.url ?? "", BoxFit.fill, item.id.toString()),
          ),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(200, 0, 0, 0),
                    Color.fromARGB(0, 0, 0, 0)
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(
                item.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
