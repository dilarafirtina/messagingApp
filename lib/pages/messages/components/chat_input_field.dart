import 'package:cht1/pages/message_actions/chat_note.dart';
import 'package:cht1/pages/message_actions/group.dart';
import 'package:cht1/pages/message_actions/guest_group.dart';
import 'package:cht1/pages/message_actions/templates.dart';
import 'package:cht1/widgets/show_dialog.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';

class ChatInputField extends StatelessWidget {
  const ChatInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: defaultPadding,
              vertical: defaultPadding / 2,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, -4),
                  blurRadius: 32,
                  color: Color(0xFF087949).withOpacity(0.08),
                ),
              ],
            ),
            child: Row(
              children: [
                InkWell(
                  onTap: () => {},
                  child: Tooltip(
                    message: 'Keyboard',
                    child: Icon(
                      Icons.keyboard_alt_outlined,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ),
                const SizedBox(width: defaultPadding),
                InkWell(
                  onTap: () => {},
                  child: Tooltip(
                    message: 'Add Queue',
                    child: Icon(
                      Icons.rotate_left,
                      size: 28,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ),
                const SizedBox(width: defaultPadding),
                InkWell(
                  onTap: () => {},
                  child: Tooltip(
                    message: 'Resolved',
                    child: Icon(
                      Icons.check,
                      size: 28,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => {},
                  child: PopupMenuButton<int>(
                    tooltip: "Message Actions",
                    icon: Icon(
                      size: 28,
                      Icons.add,
                      color: Colors.grey.shade600,
                    ),
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        value: 1,
                        onTap: () => {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            showDialog<void>(
                                context: context,
                                builder: (BuildContext context) {
                                  return customAlertDialog(
                                    context,
                                    "Interview Notes",
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              2,
                                      child: noteList(context),
                                    ),
                                  );
                                });
                          }),
                        },
                        child: Row(
                          children: const [
                            Icon(Icons.note, color: Colors.white),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Add Notes",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        value: 2,
                        onTap: () => {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            showDialog<void>(
                                context: context,
                                builder: (BuildContext context) {
                                  return customAlertDialog(
                                    context,
                                    "Guest Group Information",
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              2,
                                      child: guestGroupList(context),
                                    ),
                                  );
                                });
                          }),
                        },
                        child: Row(
                          children: const [
                            Icon(Icons.people, color: Colors.white),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Guest Group Information",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        value: 3,
                        onTap: () => {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            showDialog<void>(
                                context: context,
                                builder: (BuildContext context) {
                                  return customAlertDialog(
                                    context,
                                    "Group Information",
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              2,
                                      child: groupList(context),
                                    ),
                                  );
                                });
                          }),
                        },
                        child: Row(
                          children: const [
                            Icon(Icons.person_add, color: Colors.white),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Group Information",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        value: 4,
                        onTap: () => {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            showDialog<void>(
                                context: context,
                                builder: (BuildContext context) {
                                  return customAlertDialog(
                                      context,
                                      "Add Messages",
                                      SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              1.6,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              1.6,
                                          child: templates(context)));
                                });
                          })
                        },
                        child: Row(
                          children: const [
                            Icon(Icons.message, color: Colors.white),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Add Messages",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        onTap: () => {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            showDialog<void>(
                                context: context,
                                builder: (BuildContext context) {
                                  return customAlertDialog(
                                      context,
                                      "Add Attachment",
                                      SizedBox(
                                          width: 400,
                                          height: 100,
                                          child: Container()));
                                });
                          })
                        },
                        value: 5,
                        child: Row(
                          children: const [
                            Icon(Icons.attachment, color: Colors.white),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Attachments",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ],
                    offset: Offset(0, 100),
                    color: secondaryColor,
                    elevation: 3,
                  ),
                ),
                const SizedBox(width: defaultPadding),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: defaultPadding * 1.5,
                                vertical: defaultPadding),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                            ),
                            hintText: "Type message",
                            suffixIcon: SizedBox(
                              width: 65,
                              child: InkWell(
                                onTap: () => {},
                                child: Tooltip(
                                  message: 'Send',
                                  child: Icon(
                                    Icons.send_outlined,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
