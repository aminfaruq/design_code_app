import 'package:design_code_app/components/cards/recent_course_card.dart';
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
