import 'dart:js';

import 'package:animations/animations.dart';
import 'package:cht1/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

List<Widget> pageList = <Widget>[
  templateMessage(),
  interactiveMessage(),
  interviewTag()
];

const List<String> agents = <String>['One', 'Two', 'Three', 'Four'];
String dropdownvalue = 'One';

@override
Widget templates(BuildContext context) {
  RxInt pageIndex = 0.obs;

  return Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(
      elevation: 0.0,
      automaticallyImplyLeading: false,
      flexibleSpace: Obx(
        () => BottomNavigationBar(
          elevation: 0.0,
          type: BottomNavigationBarType.fixed,
          currentIndex: pageIndex.value,
          onTap: (index) {
            pageIndex.value = index;
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.comment_bank), label: "Template Messages"),
            BottomNavigationBarItem(
                icon: Icon(Icons.stream), label: "Interactive Message"),
            BottomNavigationBarItem(
                icon: Icon(Icons.tag), label: "Interview Tag"),
          ],
        ),
      ),
    ),
    body: PageTransitionSwitcher(
      transitionBuilder: (
        Widget child,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
      ) {
        return FadeThroughTransition(
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          child: child,
        );
      },
      child: Obx(() => pageList[pageIndex.value]),
    ),
  );
}

Widget templateMessage() {
  return SingleChildScrollView(
      child: Container(
    height: 700,
    padding: const EdgeInsets.all(defaultPadding),
    decoration: BoxDecoration(color: Colors.white),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: defaultPadding,
        ),
        const Text(
          "Message Name",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        DropdownButton(
          style: TextStyle(fontSize: 14),
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
        const SizedBox(
          height: defaultPadding,
        ),
        const Text(
          "Parameter Header",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 5,
        ),
        TextField(
          decoration: InputDecoration(
            suffixIcon: SizedBox(
              width: 65,
              child: InkWell(
                onTap: () => {},
                child: Tooltip(
                  message: 'Show Headers',
                  child: Icon(
                    Icons.more_vert,
                    color: Colors.grey.shade600,
                  ),
                ),
              ),
            ),
          ),
          style: const TextStyle(fontSize: 14),
        ),
        const SizedBox(
          height: defaultPadding,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Parameter 1",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextField(
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Parameter 2",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextField(
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Parameter 3",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextField(
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: defaultPadding,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Parameter 4",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextField(
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Parameter 5",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextField(
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Parameter 6",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextField(
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: defaultPadding,
        ),
        const Text(
          "Message",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 5,
        ),
        const TextField(
          minLines: 4,
          maxLines: 6,
          style: TextStyle(fontSize: 14),
        ),
        const SizedBox(
          height: defaultPadding,
        ),
        Container(
          alignment: Alignment.centerRight,
          width: double.infinity,
          child: ElevatedButton(
              onPressed: () => {},
              style: ElevatedButton.styleFrom(minimumSize: const Size(80, 40)),
              child: const Text("Save")),
        )
      ],
    ),
  ));
}

Widget interactiveMessage() {
  return Container(
    height: double.infinity,
    width: double.infinity,
    padding: const EdgeInsets.all(defaultPadding),
    decoration: BoxDecoration(color: Colors.white),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: defaultPadding,
        ),
        const Text(
          "Message Name",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        DropdownButton(
          style: TextStyle(fontSize: 14),
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
        const SizedBox(
          height: defaultPadding,
        ),
        Container(
          alignment: Alignment.centerRight,
          width: double.infinity,
          child: ElevatedButton(
              onPressed: () => {},
              style: ElevatedButton.styleFrom(minimumSize: const Size(80, 40)),
              child: const Text("Save")),
        )
      ],
    ),
  );
}

Widget interviewTag() {
  return Container(
    height: double.infinity,
    padding: const EdgeInsets.all(defaultPadding),
    decoration: BoxDecoration(color: Colors.white),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: defaultPadding,
        ),
        const Text(
          "Interview Tag",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        DropdownButton(
          style: TextStyle(fontSize: 14),
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
        const SizedBox(
          height: defaultPadding,
        ),
        const Text(
          "Interview Tag",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 5,
        ),
        const TextField(
          minLines: 4,
          maxLines: 6,
          style: TextStyle(fontSize: 14),
        ),
        const SizedBox(
          height: defaultPadding,
        ),
        Container(
          alignment: Alignment.centerRight,
          width: double.infinity,
          child: ElevatedButton(
              onPressed: () => {},
              style: ElevatedButton.styleFrom(minimumSize: const Size(80, 40)),
              child: const Text("Save")),
        )
      ],
    ),
  );
}
