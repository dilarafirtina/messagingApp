import 'package:cht1/constants.dart';
import 'package:flutter/material.dart';

class ActionTile extends StatelessWidget {
  const ActionTile({
    Key? key,
    required this.icon,
    required this.label,
    this.backgroundColor,
    required this.onTap,
  }) : super(key: key);

  final IconData icon;
  final String label;
  final Color? backgroundColor;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(40),
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300, width: 2),
              color: backgroundColor ?? backgroundColor,
              shape: BoxShape.circle,
            ),
            child: SizedBox(
                height: 40,
                width: 40,
                child: Icon(
                  icon,
                  color: primaryColor,
                  size: 25,
                )),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}
