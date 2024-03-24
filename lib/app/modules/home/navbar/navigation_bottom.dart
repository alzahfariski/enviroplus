import 'package:enviroplus/app/modules/home/view/ecoquest_view.dart';
import 'package:enviroplus/app/modules/home/view/ecoswap_view.dart';
import 'package:enviroplus/app/modules/home/view/home_view.dart';
import 'package:enviroplus/app/modules/home/view/profil_view.dart';
import 'package:enviroplus/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    PersistentTabController controller;

    controller = PersistentTabController(initialIndex: 0);
    List<Widget> buildScreens() {
      return [
        const HomeView(),
        EcoQuestView(),
        const EcoSwapView(),
        const ProfilView(),
      ];
    }

    List<PersistentBottomNavBarItem> navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.home),
          title: ("Home"),
          activeColorPrimary: TColors.primary,
          inactiveColorPrimary: TColors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.star_half_sharp),
          title: ("EcoQuest"),
          activeColorPrimary: TColors.primary,
          inactiveColorPrimary: TColors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.group),
          title: ("EcoSwap"),
          activeColorPrimary: TColors.primary,
          inactiveColorPrimary: TColors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.person),
          title: ("Profil"),
          activeColorPrimary: TColors.primary,
          inactiveColorPrimary: TColors.grey,
        ),
      ];
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: PersistentTabView(
          context,
          controller: controller,
          screens: buildScreens(),
          items: navBarsItems(),
          confineInSafeArea: true,
          backgroundColor: TColors.dark, // Default is Colors.white.
          handleAndroidBackButtonPress: true, // Default is true.
          resizeToAvoidBottomInset: true,
          stateManagement: true, // Default is true.
          hideNavigationBarWhenKeyboardShows: true,

          popAllScreensOnTapOfSelectedTab: true,
          popActionScreens: PopActionScreensType.all,
          itemAnimationProperties: const ItemAnimationProperties(
            duration: Duration(milliseconds: 200),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: const ScreenTransitionAnimation(
            animateTabTransition: true,
            curve: Curves.ease,
            duration: Duration(milliseconds: 200),
          ),
          navBarStyle: NavBarStyle
              .style6, // Choose the nav bar style with this property.
        ),
      ),
    );
  }
}
