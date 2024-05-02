import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

import '../view.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  List<PersistentTabConfig> _tabs() => [
        PersistentTabConfig(
          screen: HomeScreen(),
          item: ItemConfig(
            textStyle: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500),
            activeColorSecondary: Colors.grey.shade200,
            activeForegroundColor: Colors.white,
            inactiveIcon: Image.asset(
              Images.home,
            ),
            icon: Image.asset(
              Images.home,
              color: Colors.white,
            ),
            title: "HYPE",
          ),
        ),
        PersistentTabConfig(
          screen: HomeScreen(),
          item: ItemConfig(
            textStyle: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500),
            inactiveIcon: Image.asset(
              Images.syndicate,
            ),
            title: "Syndicates",
            activeForegroundColor: Colors.white,
            activeColorSecondary: Colors.grey.shade200,
            icon: Image.asset(
              Images.syndicate,
              color: Colors.white,
            ),
          ),
        ),
        PersistentTabConfig(
          screen: HomeScreen(),
          item: ItemConfig(
            textStyle: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500),
            inactiveIcon: BadgeWidget(
              image: Images.chat,
              title: ' 3 ',
              child: Image.asset(
                Images.chat,
                color: Colors.white,
              ),
            ),
            activeForegroundColor: Colors.white,
            activeColorSecondary: Colors.grey.shade200,
            icon: Image.asset(
              Images.chat,
              color: Colors.white,
            ),
            title: "Chats",
          ),
        ),
        PersistentTabConfig(
          screen: HomeScreen(),
          item: ItemConfig(
            textStyle: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500),
            inactiveIcon: BadgeWidget(
              image: Images.bell,
              title: '12',
              child: Image.asset(
                Images.bell,
                color: Colors.white,
              ),
            ),
            activeForegroundColor: Colors.white,
            activeColorSecondary: Colors.grey.shade200,
            icon: Image.asset(
              Images.bell,
              color: Colors.white,
            ),
            title: "Notifications",
          ),
        ),
        PersistentTabConfig(
          screen: HomeScreen(),
          item: ItemConfig(
            textStyle: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500),
            inactiveIcon: Image.asset(
              Images.profile,
            ),
            activeForegroundColor: Colors.white,
            activeColorSecondary: Colors.grey.shade200,
            icon: Image.asset(
              Images.profile,
            ),
            title: "Profile",
          ),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return PersistentTabView(
      navBarHeight: size.height * .1,
      tabs: _tabs(),
      navBarBuilder: (navBarConfig) => Style4BottomNavBar(
        navBarDecoration: const NavBarDecoration(
          color: Colors.black,
        ),
        navBarConfig: navBarConfig,
      ),
    );
  }
}
