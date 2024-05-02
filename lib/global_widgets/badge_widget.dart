import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';

import '../view/view.dart';

class BadgeWidget extends StatelessWidget {
  const BadgeWidget(
      {super.key,
      required this.child,
      required this.title,
      required this.image});
  final Widget child;
  final String title, image;
  @override
  Widget build(BuildContext context) {
    return badges.Badge(
      position: badges.BadgePosition.topEnd(top: -01, end: -1),
      badgeStyle: const badges.BadgeStyle(
        badgeColor: Colors.red,
      ),
      stackFit: StackFit.passthrough,
      badgeContent: TextWidget(
        title: title,
        fontSize: 12,
        color: Colors.white,
      ),
      child: child,
    );
  }
}
