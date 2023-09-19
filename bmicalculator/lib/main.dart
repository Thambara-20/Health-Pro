import 'package:bmicalculator/explore/explore.dart';
import 'package:bmicalculator/main_page.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return  PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Color.fromARGB(255, 255, 196, 0),
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        hideNavigationBarWhenKeyboardShows: true,
       
        decoration:
            NavBarDecoration(border: Border.all(color: Color.fromARGB(255, 255, 255, 255), width: 1.0)
          , borderRadius: BorderRadius.circular(10.0)
      
       
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties(
          duration: Duration(milliseconds: 500),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 500),
         // Use the custom transition here
        ),
        navBarStyle: NavBarStyle.style17,
        
      );
    
  }

  static final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return [
      const Explore(),
      const HomePage(),
      const Text('Profile', style: TextStyle(color: Colors.black)),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.explore),
        title: 'Explore',
        activeColorPrimary: Color.fromARGB(255, 0, 0, 0),
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home, color: Colors.amber[400],),
        title: 'Home',
        activeColorPrimary: Color.fromARGB(255, 0, 0, 0),
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.person),
        title: 'Profile',
        activeColorPrimary: Color.fromARGB(255, 0, 0, 0),
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  PageTransition buildCustomTransition(Widget page) {
    return PageTransition(
      type: PageTransitionType.fade, // You can choose different animation types
      child: page,
      duration: const Duration(milliseconds: 500), // Adjust the duration as needed
    );
  }
}

