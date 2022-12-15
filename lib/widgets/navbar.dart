import 'package:flutter/material.dart';

import '../utils/configuration.dart';

class NavBar extends StatelessWidget {
  const NavBar({
    Key? key,
    this.isFilled = true,
    required this.press,
    required this.text,
    required this.icon,
  }) : super(key: key);

  final bool isFilled;
  final VoidCallback press;
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: isFilled ? 2 : 0,
      color: isFilled ? Colors.white : Colors.transparent,
      onPressed: press,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 0),
        alignment: Alignment.center,
        height: 60,
        child: Column(
          children: [
            IconButton(
              icon: Icon(icon),
              padding: EdgeInsets.symmetric(vertical: 0),
              iconSize: 30,
              color: isFilled ? kPrimaryColor : Colors.grey.shade300,
              onPressed: () => press,
            ),
            Text(
              text,
              style: TextStyle(
                color: isFilled ? contentColorLightTheme : Colors.white,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
