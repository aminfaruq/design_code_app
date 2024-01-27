import 'package:design_code_app/components/search_field_widget.dart';
import 'package:design_code_app/components/sidebar_button.dart';
import 'package:design_code_app/constants.dart';
import 'package:flutter/material.dart';

class HomeScreenNavBar extends StatelessWidget {
  final Function triggerAnimation;

  const HomeScreenNavBar({super.key, required this.triggerAnimation});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SidebarButton(
            triggerAnimation: triggerAnimation,
          ),
          const SearchFieldWidget(),
          const Icon(
            Icons.notifications,
            color: kPrimaryLabelColor,
          ),
          const SizedBox(
            width: 16.0,
          ),
          const CircleAvatar(
            radius: 18.0,
            backgroundImage: AssetImage('assets/images/profile.jpg'),
          )
        ],
      ),
    );
  }
}
