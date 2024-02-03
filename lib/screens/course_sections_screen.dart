import 'package:design_code_app/components/lists/course_section_list.dart';
import 'package:design_code_app/constants.dart';
import 'package:flutter/material.dart';

class CourseSectionsScreen extends StatelessWidget {
  const CourseSectionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: kBackgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(34.0),
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(32.0),
            decoration: const BoxDecoration(
              color: kCardPopupBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(34),
                bottomLeft: Radius.circular(34),
              ),
              boxShadow: [
                BoxShadow(
                    color: kShadowColor,
                    offset: Offset(0, 12),
                    blurRadius: 32.0)
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Course Sections',
                  style: kTitle2Style,
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Text(
                  '12 Sections',
                  style: kSubtitleStyle,
                )
              ],
            ),
          ),
          const CourseSectionList()
        ],
      ),
    );
  }
}
