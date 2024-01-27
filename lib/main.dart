import 'package:design_code_app/components/home_screen_navbar.dart';
import 'package:design_code_app/components/lists/recent_course_list.dart';
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
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              'Recents',
                              style: kLargeTitleStyle,
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              '23 Courses, more coming',
                              style: kSubtitleStyle,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      const RecentCourceList(),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20.0, top: 25.0, bottom: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              'Explore',
                              style: kTitle1Style,
                            )
                          ],
                        ),
                      ),
                      const ExploreCourseList()
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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

class ExploreCourseCard extends StatelessWidget {
  final Course course;

  const ExploreCourseCard({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(41.0),
        child: Container(
          height: 120.0,
          width: 280.0,
          decoration: BoxDecoration(gradient: course.background),
          child: Padding(
            padding: const EdgeInsets.only(left: 32.0),
            child: Row(
              children: [
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(course.courseSubtitle),
                    const SizedBox(
                      height: 6.0,
                    ),
                    Text(
                      course.courseTitle,
                      style: kCardTitleStyle,
                    )
                  ],
                )),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      'assets/illustrations/${course.illustration}',
                      fit: BoxFit.cover,
                      height: 100.0,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
