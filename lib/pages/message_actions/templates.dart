import 'package:animations/animations.dart';
import '../../utils/configuration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'interactive_messages.dart';
import 'template_message.dart';

List<Widget> pageList = <Widget>[
  templateMessage(),
  interactiveMessage(),
  interviewTag()
];

const List<String> agents = <String>[
  'One',
  'Dear {{1}}, This WhatsApp group, created with your consent and whose servers are set abroad, is only used for the services we will provide during your stay at Opex. Your contact information within the group will not be used for any reason other than this purpose. This group will be deleted after the purpose of the business ends. Correspondence will be kept in a separate and secure system for 3 years for possible disagreements. For detailed information about our policy regarding personal data, you can visit the website below: https://opex.app/privacy-policy.html Do you approve this chat for Opex services? Opex Guest Assistant',
  'Three',
  'Four'
];
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
