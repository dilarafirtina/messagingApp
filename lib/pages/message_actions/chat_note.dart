import '../../utils/configuration.dart';
import 'package:cht1/pages/message_actions/widgets/list_popup.dart';
import 'package:flutter/material.dart';

import '../../widgets/show_dialog.dart';

List<Map<String, String>> noteInfo = [
  {
    "user": "Dilara Fırtına",
    "recordDate": "01.08.2020",
    "note": "Lorem  ipsum dolar sin amet ipsum dolar sin amet"
  },
  {
    "user": "Dilara Fırtına",
    "recordDate": "02.08.2019",
    "note": "Lorem ipsum dolar sin amet"
  },
  {
    "user": "Kübra Uygur",
    "recordDate": "03.08.2018",
    "note": "Lorem ipsum dolar sin amet"
  },
  {
    "user": "Kübra Uygur",
    "recordDate": "04.08.2020",
    "note": "Lorem ipsum dolar sin amet"
  },
  {
    "user": "Kübra Uygur",
    "recordDate": "05.08.2020",
    "note": "Lorem ipsum dolar sin amet"
  },
];

@override
Widget noteList(BuildContext context) {
  return SizedBox(
    width: 600,
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: 300,
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: TextField(
                onChanged: (value) {},
                decoration: const InputDecoration(
                  labelText: 'Search',
                  suffixIcon: Icon(Icons.search),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () => {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        showDialog<void>(
                            context: context,
                            builder: (BuildContext context) {
                              return customAlertDialog(
                                context,
                                "Add Note",
                                SizedBox(
                                  width: 300,
                                  height: 200,
                                  child: Column(
                                    children: [
                                      const TextField(
                                        minLines: 4,
                                        maxLines: 6,
                                        decoration: InputDecoration(
                                          hintText: "Type note",
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      ElevatedButton(
                                          onPressed: () => {},
                                          style: ElevatedButton.styleFrom(
                                              minimumSize: const Size(80, 40)),
                                          child: const Text("Save"))
                                    ],
                                  ),
                                ),
                              );
                            });
                      })
                    },
                style: ElevatedButton.styleFrom(
                    minimumSize:
                        Size(80, 40) // put the width and height you want
                    ),
                child: const Text(
                  "Add Note",
                  textAlign: TextAlign.end,
                )),
          ],
        ),
        const SizedBox(height: defaultPadding),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 100,
                child: Text(
                  "Record Date",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                width: defaultPadding,
              ),
              SizedBox(
                width: 120,
                child: Text(
                  "Record User",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                width: defaultPadding * 1.2,
              ),
              Expanded(
                  child: Text(
                "Note",
                maxLines: 4,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.bold),
              ))
            ],
          ),
        ),
        Divider(),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: noteInfo.length,
            itemBuilder: (BuildContext context, int index) {
              return ListPopup(
                type: "note",
                recordDate: noteInfo[index]["recordDate"]!,
                recordUser: noteInfo[index]["user"]!,
                note: noteInfo[index]["note"]!,
              );
            },
          ),
        )
      ],
    ),
  );
}
