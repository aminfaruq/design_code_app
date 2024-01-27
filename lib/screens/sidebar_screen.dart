import 'package:design_code_app/components/sidebar_row.dart';
import 'package:design_code_app/constants.dart';
import 'package:design_code_app/model/sidebar.dart';
import 'package:flutter/material.dart';

class SidebarScreen extends StatelessWidget {
  const SidebarScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: kSidebarBackgroundColor,
        borderRadius: BorderRadius.only(topRight: Radius.circular(34.0)),
      ),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width * 0.85,
      padding: const EdgeInsets.symmetric(vertical: 35.0, horizontal: 20.0),
      child: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/profile.jpg'),
                  radius: 21.0,
                ),
                const SizedBox(
                  width: 15.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Jhon doe',
                      style: kHeadlineLabelStyle,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      'Licence ends on 21 jan 2025',
                      style: kSearchPlaceholderStyle,
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.08),
            Expanded(
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: sidebarItem.length,
                  itemBuilder: ((context, index) {
                    return Column(
                      children: [
                        SideBarRow(
                          item: sidebarItem[index],
                        ),
                        const SizedBox(
                          height: 32.0,
                        )
                      ],
                    );
                  })),
            ),
            const Spacer(),
            Row(
              children: [
                Image.asset(
                  'assets/icons/icon-logout.png',
                  width: 17.0,
                ),
                const SizedBox(
                  width: 12.0,
                ),
                Text(
                  'Log out',
                  style: kSecondaryCalloutLabelStyle,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
