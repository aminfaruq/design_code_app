import 'package:design_code_app/components/home_screen_navbar.dart';
import 'package:design_code_app/components/lists/explore_course_list.dart';
import 'package:design_code_app/components/lists/recent_course_list.dart';
import 'package:design_code_app/constants.dart';
import 'package:design_code_app/screens/sidebar_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late Animation<Offset> sidebarAnimation;
  late AnimationController sidebarAnimationController;

  @override
  void initState() {
    super.initState();
    sidebarAnimationController = AnimationController(
        vsync: this, duration: const Duration(microseconds: 250));

    sidebarAnimation = Tween<Offset>(
      begin: const Offset(-1, 0),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(
        parent: sidebarAnimationController, curve: Curves.easeInOut));
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
          SlideTransition(
              position: sidebarAnimation,
              child: const SafeArea(bottom: false, child: SidebarScreen()))
        ]),
      ),
    );
  }
}
