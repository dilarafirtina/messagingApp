import 'package:flutter/material.dart';

import '../../../utils/configuration.dart';

class Info extends StatelessWidget {
  const Info({
    Key? key,
    required this.infoKey,
    required this.info,
  }) : super(key: key);

  final String infoKey, info;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding / 2.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            infoKey,
            style: TextStyle(
              color: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .color!
                  .withOpacity(0.8),
            ),
          ),
          Text(info),
        ],
      ),
    );
  }
}
