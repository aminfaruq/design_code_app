import 'package:design_code_app/constants.dart';
import 'package:flutter/material.dart';

class SidebarButton extends StatelessWidget {
  final Function triggerAnimation;

  const SidebarButton({
    super.key,
    required this.triggerAnimation,
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        triggerAnimation();
      },
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      constraints: const BoxConstraints(maxHeight: 40.0, maxWidth: 40.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14.0),
            boxShadow: const [
              BoxShadow(
                  color: kShadowColor,
                  offset: Offset(
                    0,
                    12,
                  ),
                  blurRadius: 16.0),
            ]),
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
        child: Image.asset(
          'assets/icons/icon-sidebar.png',
          color: kPrimaryLabelColor,
        ),
      ),
    );
  }
}
