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
        body: SafeArea(
            child: SizedBox(
          child: RecentCourseCard(course: recentCourses[0]),
        )),
      ),
    );
  }
}

class RecentCourseCard extends StatelessWidget {
  final Course course;

  const RecentCourseCard({required this.course, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      height: 240,
      decoration: BoxDecoration(
          gradient: course.background,
          borderRadius: BorderRadius.circular(41.0)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 32.0,
              left: 32.0,
              right: 32.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  course.courseSubtitle,
                  style: kCardSubtitleStyle,
                ),
                const SizedBox(
                  height: 6.0,
                ),
                Text(
                  course.courseTitle,
                  style: kCardTitleStyle,
                )
              ],
            ),
          ),
          Expanded(
            child: Image.asset(
              'assets/illustrations/${course.illustration}',
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }
}
