import 'package:design_code_app/constants.dart';
import 'package:design_code_app/model/course.dart';
import 'package:flutter/material.dart';

class CompletedCoursesCard extends StatelessWidget {
  final Course course;

  const CompletedCoursesCard({required this.course, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0, right: 20.0),
          child: Container(
            decoration: BoxDecoration(
              gradient: course.background,
              borderRadius: BorderRadius.circular(41.0),
              boxShadow: [
                BoxShadow(
                    color: course.background.colors.first.withOpacity(0.3),
                    offset: const Offset(0, 20),
                    blurRadius: 20.0),
                BoxShadow(
                    color: course.background.colors[1].withOpacity(0.3),
                    offset: const Offset(0, 20),
                    blurRadius: 20.0)
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(41.0),
              child: SizedBox(
                height: 160.0,
                width: 260.0,
                child: Stack(
                  children: [
                    Row(
                      children: [
                        const Spacer(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            // const Spacer(),
                            Image.asset(
                              'assets/illustrations/${course.illustration}',
                              fit: BoxFit.cover,
                              height: 140,
                            )
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(
              top: 12.5, bottom: 13.5, left: 20.5, right: 14.5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: const [
              BoxShadow(
                  color: kShadowColor, offset: Offset(0, 4), blurRadius: 16.0)
            ],
          ),
          child: Image.asset(
            'assets/icons/icon-play.png',
            width: 40.0,
            height: 40.0,
          ),
        )
      ],
    );
  }
}
