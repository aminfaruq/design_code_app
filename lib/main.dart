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
          child: RecentCourseCard(course: recentCourses[2]),
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
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Container(
            width: 240,
            height: 240,
            decoration: BoxDecoration(
                gradient: course.background,
                borderRadius: BorderRadius.circular(41.0),
                boxShadow: [
                  BoxShadow(
                      color: course.background.colors[0].withOpacity(0.3),
                      offset: const Offset(0, 20),
                      blurRadius: 30.0),
                  BoxShadow(
                      color: course.background.colors[1].withOpacity(0.3),
                      offset: const Offset(0, 20),
                      blurRadius: 30.0)
                ]),
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
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 42.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18.0),
                boxShadow: const [
                  BoxShadow(
                      color: kShadowColor,
                      offset: Offset(0, 4),
                      blurRadius: 16.0)
                ]),
            padding: const EdgeInsets.all(12.0),
            child: Image.asset(
              'assets/logos/${course.logo}',
              width: 60.0,
              height: 60.0,
            ),
          ),
        )
      ],
    );
  }
}
