import 'dart:developer';

import 'package:design_code_app/components/cards/recent_course_card.dart';
import 'package:design_code_app/constants.dart';
import 'package:design_code_app/model/course.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          color: kBackgroundColor,
          child: SafeArea(
            child: Column(
              children: [
                const HomeScreenNavBar(),
                RecentCourseCard(course: recentCourses[2]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomeScreenNavBar extends StatelessWidget {
  const HomeScreenNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SidebarButton(),
          SearchFieldWidget(),
          Icon(
            Icons.notifications,
            color: kPrimaryLabelColor,
          ),
          SizedBox(
            width: 16.0,
          ),
          CircleAvatar(
            radius: 18.0,
            backgroundImage: AssetImage('assets/images/profile.jpg'),
          )
        ],
      ),
    );
  }
}

class SearchFieldWidget extends StatelessWidget {
  const SearchFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 33.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14.0),
            boxShadow: const [
              BoxShadow(
                  color: kShadowColor, offset: Offset(0, 12), blurRadius: 16.0)
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: TextField(
            cursorColor: kPrimaryLabelColor,
            decoration: InputDecoration(
                icon: const Icon(
                  Icons.search,
                  color: kPrimaryLabelColor,
                  size: 20.0,
                ),
                border: InputBorder.none,
                hintText: 'Search for courses',
                hintStyle: kSearchTextStyle),
            style: kSearchTextStyle,
            onChanged: (newText) {
              log(newText);
            },
          ),
        ),
      ),
    ));
  }
}

class SidebarButton extends StatelessWidget {
  const SidebarButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        log('Side bar presed');
      },
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      constraints: const BoxConstraints(maxHeight: 40.0, maxWidth: 40.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14.0),
            boxShadow: const [
              BoxShadow(
                  color: kShadowColor,
                  offset: Offset(
                    0,
                    12,
                  ),
                  blurRadius: 16.0),
            ]),
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
        child: Image.asset(
          'assets/icons/icon-sidebar.png',
          color: kPrimaryLabelColor,
        ),
      ),
    );
  }
}
