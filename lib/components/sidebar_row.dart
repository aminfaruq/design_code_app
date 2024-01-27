import 'package:design_code_app/constants.dart';
import 'package:design_code_app/model/sidebar.dart';
import 'package:flutter/material.dart';

class SideBarRow extends StatelessWidget {
  final SidebarItem item;

  const SideBarRow({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            width: 42.0,
            height: 42.0,
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14.0),
                gradient: item.background),
            child: item.icon),
        const SizedBox(
          width: 12,
        ),
        SizedBox(
          child: Text(
            item.title,
            style: kCalloutLabelStyle,
          ),
        )
      ],
    );
  }
}
