import 'package:cht1/constants.dart';
import 'package:flutter/material.dart';

import '../../../widgets/show_dialog.dart';

List<Map<String, String>> noteInfo = [
  {
    "user": "Dilara Fırtına",
    "recordDate": "01.08.2020",
    "text": "Lorem  ipsum dolar sin amet ipsum dolar sin amet"
  },
  {
    "user": "Dilara Fırtına",
    "recordDate": "02.08.2019",
    "text": "Lorem ipsum dolar sin amet"
  },
  {
    "user": "Kübra Uygur",
    "recordDate": "03.08.2018",
    "text": "Lorem ipsum dolar sin amet"
  },
  {
    "user": "Kübra Uygur",
    "recordDate": "04.08.2020",
    "text": "Lorem ipsum dolar sin amet"
  },
  {
    "user": "Kübra Uygur",
    "recordDate": "05.08.2020",
    "text": "Lorem ipsum dolar sin amet"
  },
];

@override
Widget dataTable(BuildContext context) {
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
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: noteInfo.length,
            itemBuilder: (BuildContext context, int index) {
              return NoteList(noteInfo[index]["recordDate"]!,
                  noteInfo[index]["user"]!, noteInfo[index]["text"]!);
            },
          ),
        )
      ],
    ),
  );
}

Widget NoteList(String date, String user, String note) {
  return Container(
      padding: const EdgeInsets.all(defaultPadding / 3),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(date),
              const SizedBox(
                width: defaultPadding,
              ),
              Text(user),
              const SizedBox(
                width: defaultPadding,
              ),
              Text(note)
            ],
          ),
          const Divider(
            thickness: 1.5,
          )
        ],
      ));
}
