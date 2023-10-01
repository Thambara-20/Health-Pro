// import 'package:bmicalculator/constants.dart';
// import 'package:bmicalculator/explore/explore.dart';
// import 'package:bmicalculator/Calculator/Calculatormain.dart';
// import 'package:flutter/material.dart';
// import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
// import 'package:page_transition/page_transition.dart';
// import 'Home/Homepage.dart';
// import 'package:firebase_core/firebase_core.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),

//       initialRoute: '/',
//       onGenerateRoute: (settings) {
//          if (settings.name == '/') {
//           return MaterialPageRoute(builder: (context) => MainPage());
//         }
//         // H
//         if (settings.name == '/explore') {
//           return MaterialPageRoute(builder: (context) => Explore());
//         }
//         // Handle other routes here if needed
//       },
//     );
//   }
// }

// class MainPage extends StatelessWidget {
//   const MainPage({Key? key});

//   @override
//   Widget build(BuildContext context) {
//     return PersistentTabView(
//       context,
//       controller: _controller,
//       screens: _buildScreens(),
//       items: _navBarsItems(),
//       confineInSafeArea: true,
//       backgroundColor: Color.fromARGB(255, 0, 0, 0),
//       handleAndroidBackButtonPress: true,
//       resizeToAvoidBottomInset: true,
//       stateManagement: true,
//       hideNavigationBarWhenKeyboardShows: true,
//       decoration: NavBarDecoration(
//           border:
//               Border.all(color: Color.fromARGB(255, 255, 255, 255), width: 1.0),
//           borderRadius: BorderRadius.circular(10.0)),
//       popAllScreensOnTapOfSelectedTab: true,
//       popActionScreens: PopActionScreensType.all,
//       itemAnimationProperties: const ItemAnimationProperties(
//         duration: Duration(milliseconds: 500),
//         curve: Curves.ease,
//       ),
//       screenTransitionAnimation: const ScreenTransitionAnimation(
//         animateTabTransition: true,
//         curve: Curves.ease,
//         duration: Duration(milliseconds: 500),
//         // Use the custom transition here
//       ),
//       navBarStyle: NavBarStyle.style9,
//     );
//   }

//   static final PersistentTabController _controller =
//       PersistentTabController(initialIndex: 0);

//   List<Widget> _buildScreens() {
//     return [
//       HomePage(),
//       Explore(),
//       const Calculator(),
//       const Text('Profile', style: TextStyle(color: Colors.black)),
//     ];
//   }

//   List<PersistentBottomNavBarItem> _navBarsItems() {
//     return [
//       PersistentBottomNavBarItem(
//         icon: Icon(
//           Icons.home,
//         ),
//         title: 'Home',
//         activeColorPrimary: knavbarActive,
//         inactiveColorPrimary: Colors.grey,
//       ),
//       PersistentBottomNavBarItem(
//         icon: Icon(Icons.explore),
//         title: 'Explore',
//         activeColorPrimary: knavbarActive,
//         inactiveColorPrimary: Colors.grey,
//       ),
//       PersistentBottomNavBarItem(
//         icon: Icon(Icons.calculate),
//         title: 'Calculator',
//         activeColorPrimary: knavbarActive,
//         inactiveColorPrimary: Colors.grey,
//       ),
//       PersistentBottomNavBarItem(
//         icon: Icon(Icons.person),
//         title: 'Profile',
//         activeColorPrimary: knavbarActive,
//         inactiveColorPrimary: Colors.grey,
//       ),
//     ];
//   }

//   PageTransition buildCustomTransition(Widget page) {
//     return PageTransition(
//       type: PageTransitionType.fade, // You can choose different animation types
//       child: page,
//       duration:
//           const Duration(milliseconds: 500), // Adjust the duration as needed
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:bmicalculator/constants.dart';
import 'package:bmicalculator/explore/explore.dart';
import 'package:bmicalculator/Calculator/Calculatormain.dart';
import 'package:bmicalculator/Home/Homepage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      initialRoute: '/',
      routes: {
        '/': (context) =>
            const MainPage(), // This is the route for the main page
        '/bmi': (context) => Calculator(),
        '/explore': (context) => Explore(),
        '/profile': (context) =>
            Text('Profile', style: TextStyle(color: Colors.black)),
        // Add more routes as needed
      },
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomePage(),
    Explore(),
    Calculator(),
    const Text('Profile', style: TextStyle(color: Colors.black)),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        color: Colors.black,
        child: BottomNavigationBar(
          backgroundColor: Colors.blue, // Change this to your desired color
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calculate),
              label: 'Calculator',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: knavbarActive,
          unselectedItemColor: Colors.black, // Set the unselected color here
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
