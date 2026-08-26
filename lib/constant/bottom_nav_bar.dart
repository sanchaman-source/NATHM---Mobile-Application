import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:natham_college/screen/notice_page.dart';
import 'package:natham_college/screen/homepage.dart';
import 'package:natham_college/screen/more_page.dart';
import 'package:natham_college/screen/study_page.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});
  
  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  final PersistentTabController _controller = PersistentTabController(
    initialIndex: 0, 
  );

  List<PersistentTabConfig> _tabs() { 
    return [
      PersistentTabConfig(
        screen:  Homepage(),
        item: ItemConfig(
          icon:  Icon(Icons.home),
          title: "Home",
          textStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 11
            ),
          activeForegroundColor: Colors.blue,
          inactiveForegroundColor: Colors.grey.shade400,
        ),
      ),
      PersistentTabConfig(
        screen:  StudyPage(),
        item: ItemConfig(
          icon:  Icon(Icons.calendar_today),
          title: "Timetable",
          textStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12
            ),
          activeForegroundColor: Colors.blue,
          inactiveForegroundColor: Colors.grey.shade400,
        ),
      ),
      PersistentTabConfig(
        screen:  NoticesPage(),
        item: ItemConfig(
          icon: Icon(Icons.description),
          title: "Notices",
          textStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12
            ),
          activeForegroundColor: Colors.blue,
          inactiveForegroundColor: Colors.grey.shade400,
        ),
      ),
      PersistentTabConfig(
        screen:  MorePage(),
        item: ItemConfig(
          icon: const Icon(Icons.payment),
          title: "More",
          textStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12
            ),
          activeForegroundColor: Colors.blue,
          inactiveForegroundColor: Colors.grey.shade400,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        controller: _controller,
        tabs: _tabs(),
        navBarBuilder: (navBarConfig) => Style1BottomNavBar(
          navBarConfig: navBarConfig,
          navBarDecoration: NavBarDecoration(
            color: Colors.grey.shade600,
            ),
        ),
        backgroundColor: Colors.transparent,
        stateManagement: true,
        resizeToAvoidBottomInset: true,
        gestureNavigationEnabled: true,
        handleAndroidBackButtonPress: true,
        screenTransitionAnimation: ScreenTransitionAnimation(
          duration: Duration(milliseconds: 250),
          curve: Curves.ease,
        ),
      ),
    );
  }
}
