import 'package:design_code_app/constants.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final List<String> badges = [
    'badge-01.png',
    'badge-02.png',
    'badge-03.png',
    'badge-04.png',
  ];

  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: kCardPopupBackgroundColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(34.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: kShadowColor,
                  offset: Offset(0, 12),
                  blurRadius: 32.0,
                )
              ],
            ),
            child: SafeArea(
              bottom: false,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 24.0, bottom: 32.0, left: 20.0, right: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RawMaterialButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          constraints: const BoxConstraints(
                              minWidth: 40.0, maxWidth: 40.0, maxHeight: 24.0),
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.arrow_back,
                                color: kSecondaryLabelColor,
                              )
                            ],
                          ),
                        ),
                        Text(
                          'Profile',
                          style: kCalloutLabelStyle,
                        ),
                        Container(
                          width: 40.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(14.0),
                            boxShadow: const [
                              BoxShadow(
                                  color: kShadowColor,
                                  offset: Offset(0, 12),
                                  blurRadius: 32.0),
                            ],
                          ),
                          child: const Icon(
                            Icons.settings,
                            color: kSecondaryLabelColor,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        Container(
                          height: 84.0,
                          width: 84.0,
                          decoration: BoxDecoration(
                              gradient: const RadialGradient(
                                colors: [
                                  Color(0xFF00AEFF),
                                  Color(0xFF0076FF),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(42.0)),
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Container(
                              padding: const EdgeInsets.all(6.0),
                              decoration: BoxDecoration(
                                  color: kBackgroundColor,
                                  borderRadius: BorderRadius.circular(42.0)),
                              child: const CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/images/profile.jpg'),
                                radius: 30.0,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 16.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Amin faruq',
                              style: kTitle2Style,
                            ),
                            const SizedBox(
                              height: 8.0,
                            ),
                            Text(
                              'Flutter Developer',
                              style: kSecondaryCalloutLabelStyle,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 28.0, bottom: 16.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20.0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Badges',
                                style: kHeadlineLabelStyle,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'See all',
                                    style: kSearchPlaceholderStyle,
                                  ),
                                  const Icon(
                                    Icons.chevron_right,
                                    color: kSecondaryLabelColor,
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  SizedBox(
                    height: 112.0,
                    child: ListView.builder(
                      padding: const EdgeInsets.only(bottom: 28.0),
                      scrollDirection: Axis.horizontal,
                      itemCount: badges.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.only(
                              left: 20.0, right: (index != 3) ? 0.0 : 20.0),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: kShadowColor.withOpacity(0.1),
                                  offset: const Offset(0, 12),
                                  blurRadius: 18.0)
                            ],
                          ),
                          child: Image.asset('assets/badges/${badges[index]}'),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
