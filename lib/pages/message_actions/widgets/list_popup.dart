import '../../../utils/configuration.dart';
import 'package:flutter/material.dart';

class ListPopup extends StatelessWidget {
  const ListPopup({
    Key? key,
    this.isActive = true,
    required this.type,
    required this.recordDate,
    required this.recordUser,
    this.note = "",
    this.guest = "",
    this.agent = "",
  }) : super(key: key);

  final bool isActive;
  final String recordDate, recordUser, note, guest, agent, type;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding / 3),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 100,
                child: Text(recordDate),
              ),
              const SizedBox(
                width: defaultPadding,
              ),
              SizedBox(
                width: 120,
                child: Text(recordUser),
              ),
              const SizedBox(
                width: defaultPadding,
              ),
              if (type == "note")
                SizedBox(
                  width: 200,
                  child: Expanded(
                      child: Text(
                    note,
                    maxLines: 4,
                  )),
                ),
              if (type == "guest")
                SizedBox(
                  width: 120,
                  child: Text(guest),
                ),
              if (type == "agent")
                SizedBox(
                  width: 120,
                  child: Text(agent),
                ),
              const SizedBox(
                width: defaultPadding,
              ),
              if (type == "agent" || type == "guest")
                Container(
                  alignment: Alignment.centerLeft,
                  width: 80,
                  child: Checkbox(
                    value: isActive,
                    onChanged: ((value) {}),
                  ),
                ),
              const SizedBox(
                width: defaultPadding * 1.2,
              ),
              InkWell(
                onTap: (() {}),
                child: Icon(
                  Icons.delete,
                  color: Colors.red.shade600,
                ),
              ),
              const SizedBox(
                width: defaultPadding,
              ),
              InkWell(
                onTap: (() {}),
                child: Icon(Icons.edit, color: Colors.green.shade600),
              )
            ],
          ),
          const Divider(
            thickness: 1.5,
          )
        ],
      ),
    );
  }
}
