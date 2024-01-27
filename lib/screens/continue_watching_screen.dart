import 'package:design_code_app/constants.dart';
import 'package:design_code_app/model/course.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class ContinueWatchingScreen extends StatelessWidget {
  const ContinueWatchingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      backdropEnabled: true,
      borderRadius: const BorderRadius.only(topLeft: Radius.circular(34.0)),
      color: kCardPopupBackgroundColor,
      boxShadow: const [
        BoxShadow(color: kShadowColor, offset: Offset(0, -12), blurRadius: 32.0)
      ],
      minHeight: 85.0,
      maxHeight: MediaQuery.of(context).size.height * 0.75,
      panel: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 12.0, bottom: 16.0),
              child: Container(
                width: 42.0,
                height: 4.0,
                decoration: BoxDecoration(
                    color: const Color(0xFFC5CBD6),
                    borderRadius: BorderRadius.circular(2.0)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Text(
              'Continue Watching',
              style: kTitle2Style,
            ),
          ),
          const ContinueWatchingList(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Text(
              'Certificates',
              style: kTitle2Style,
            ),
          )
        ],
      ),
    );
  }
}

class ContinueWatchingCard extends StatelessWidget {
  final Course course;

  const ContinueWatchingCard({required this.course, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: Stack(
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
                      color: course.background.colors[0].withOpacity(0.3),
                      offset: const Offset(0, 20),
                      blurRadius: 30.0),
                  BoxShadow(
                      color: course.background.colors[1].withOpacity(0.3),
                      offset: const Offset(0, 20),
                      blurRadius: 30.0)
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
                                height: 110,
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
              borderRadius: BorderRadius.circular(18.0),
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
      ),
    );
  }
}

class ContinueWatchingList extends StatefulWidget {
  const ContinueWatchingList({super.key});

  @override
  State<ContinueWatchingList> createState() => _ContinueWatchingListState();
}

class _ContinueWatchingListState extends State<ContinueWatchingList> {
  List<Container> indicators = [];
  int currentPage = 0;

  Widget updateIndicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: continueWatchingCourses.map((course) {
        var index = continueWatchingCourses.indexOf(course);
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
          height: 200.0,
          width: double.infinity,
          child: PageView.builder(
            itemBuilder: (context, index) {
              return ContinueWatchingCard(
                course: continueWatchingCourses[index],
              );
            },
            itemCount: continueWatchingCourses.length,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            controller: PageController(initialPage: 0, viewportFraction: 0.75),
          ),
        ),
        updateIndicators()
      ],
    );
  }
}
