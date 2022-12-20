import '../../utils/configuration.dart';
import 'package:cht1/pages/message_actions/widgets/list_popup.dart';
import 'package:flutter/material.dart';

import '../../../widgets/show_dialog.dart';

List<Map<String, dynamic>> agentInfo = [
  {
    "user": "Dilara Fırtına",
    "recordDate": "01.08.2020",
    "agent": "Ralph Edwards",
    "active": true
  },
  {
    "user": "Dilara Fırtına",
    "recordDate": "02.08.2019",
    "agent": "Jenny Wilson",
    "active": true
  },
  {
    "user": "Kübra Uygur",
    "recordDate": "03.08.2018",
    "agent": "Albert Flores",
    "active": false
  },
  {
    "user": "Kübra Uygur",
    "recordDate": "04.08.2020",
    "agent": "Jacob Jones",
    "active": true
  },
  {
    "user": "Kübra Uygur",
    "recordDate": "05.08.2020",
    "agent": "Esther Howard",
    "active": false
  },
];

const List<String> agents = <String>['One', 'Two', 'Three', 'Four'];
String dropdownvalue = 'One';

@override
Widget groupList(BuildContext context) {
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
              child: DropdownButton(
                value: dropdownvalue,
                isExpanded: true,
                onChanged: (value) {},
                alignment: AlignmentDirectional.topEnd,
                items: agents.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            ElevatedButton(
                onPressed: () => {},
                style: ElevatedButton.styleFrom(
                    minimumSize:
                        Size(80, 40) // put the width and height you want
                    ),
                child: const Text(
                  "Add Agent",
                  textAlign: TextAlign.end,
                )),
          ],
        ),
        const SizedBox(height: defaultPadding),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
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
                width: defaultPadding,
              ),
              SizedBox(
                width: 120,
                child: Text(
                  "Agent",
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
                width: 80,
                child: Text(
                  "Active",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                width: defaultPadding * 1.2,
              ),
            ],
          ),
        ),
        Divider(),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: agentInfo.length,
            itemBuilder: (BuildContext context, int index) {
              return ListPopup(
                type: "agent",
                recordDate: agentInfo[index]["recordDate"]!,
                recordUser: agentInfo[index]["user"]!,
                agent: agentInfo[index]["agent"]!,
                isActive: agentInfo[index]["active"]!,
              );
            },
          ),
        )
      ],
    ),
  );
}
