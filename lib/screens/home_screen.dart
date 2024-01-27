import 'package:design_code_app/components/home_screen_navbar.dart';
import 'package:design_code_app/components/lists/explore_course_list.dart';
import 'package:design_code_app/components/lists/recent_course_list.dart';
import 'package:design_code_app/constants.dart';
import 'package:design_code_app/screens/continue_watching_screen.dart';
import 'package:design_code_app/screens/sidebar_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late Animation<Offset> sidebarAnimation;
  late Animation<double> fadeAnimation;
  late AnimationController sidebarAnimationController;
  var sidebarHidden = true;

  @override
  void initState() {
    super.initState();
    sidebarAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 250));

    sidebarAnimation = Tween<Offset>(
      begin: const Offset(-1, 0),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(
        parent: sidebarAnimationController, curve: Curves.easeInOut));

    fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: sidebarAnimationController, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    super.dispose();
    sidebarAnimationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: kBackgroundColor,
        child: Stack(children: [
          SafeArea(
            child: Column(
              children: [
                HomeScreenNavBar(
                  triggerAnimation: () {
                    setState(() {
                      sidebarHidden = !sidebarHidden;
                    });
                    sidebarAnimationController.forward();
                  },
                ),
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
          const ContinueWatchingScreen(),
          IgnorePointer(
            ignoring: sidebarHidden,
            child: Stack(
              children: [
                FadeTransition(
                  opacity: fadeAnimation,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        sidebarHidden = !sidebarHidden;
                      });
                      sidebarAnimationController.reverse();
                    },
                    child: Container(
                      color: const Color.fromRGBO(36, 38, 41, 0.4),
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                ),
                SlideTransition(
                    position: sidebarAnimation,
                    child:
                        const SafeArea(bottom: false, child: SidebarScreen())),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
