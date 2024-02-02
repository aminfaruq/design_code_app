import 'package:design_code_app/components/cards/recent_course_card.dart';
import 'package:design_code_app/model/course.dart';
import 'package:design_code_app/screens/course_screen.dart';
import 'package:flutter/material.dart';

class RecentCourceList extends StatefulWidget {
  const RecentCourceList({super.key});

  @override
  State<RecentCourceList> createState() => _RecentCourceListState();
}

class _RecentCourceListState extends State<RecentCourceList> {
  List<Container> inicators = [];
  int currentPage = 0;

  Widget updateInditators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: recentCourses.map((course) {
        var index = recentCourses.indexOf(course);
        return Container(
          width: 7.0,
          height: 7.0,
          margin: const EdgeInsets.symmetric(horizontal: 6.0),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: currentPage == index
                  ? const Color(0xFF0971FE)
                  : const Color(0xFFA6AEBD)),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 320,
          width: double.infinity,
          child: PageView.builder(
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CourseScreen(
                              course: recentCourses[index],
                            ),
                        fullscreenDialog: true),
                  );
                },
                child: Opacity(
                    opacity: currentPage == index ? 1.0 : 0.5,
                    child: RecentCourseCard(course: recentCourses[index])),
              );
            },
            itemCount: recentCourses.length,
            controller: PageController(initialPage: 0, viewportFraction: 0.63),
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
          ),
        ),
        updateInditators()
      ],
    );
  }
}
