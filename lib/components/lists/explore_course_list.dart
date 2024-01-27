import 'package:design_code_app/components/cards/explore_course_card.dart';
import 'package:design_code_app/model/course.dart';
import 'package:flutter/material.dart';

class ExploreCourseList extends StatelessWidget {
  const ExploreCourseList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: exploreCourses.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(left: index == 0 ? 20.0 : 0.0),
              child: ExploreCourseCard(course: exploreCourses[index]),
            );
          }),
    );
  }
}
