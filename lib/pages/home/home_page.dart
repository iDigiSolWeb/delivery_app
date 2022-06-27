import 'package:delivery_app/pages/account/account_page.dart';
import 'package:delivery_app/pages/auth/sign_up_page.dart';
import 'package:delivery_app/pages/cart/cart_history.dart';
import 'package:delivery_app/pages/cart/cart_page.dart';
import 'package:delivery_app/pages/home/main_food_page.dart';
import 'package:delivery_app/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  late PersistentTabController _controller;

  List pages = [
    MainFoodPage(),
    Container(child: Center(child: const Text('Next Page'))),
    CartHistory(),
    Container(child: Center(child: const Text('Next Next Next Page'))),
  ];

  void onTapNav(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  @override
  void dispose() {
    super.dispose();
  }

  List<Widget> _buildScreens() {
    return [
      MainFoodPage(),
      SignUpPage(),
      CartHistory(),
      AccountPage(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.home),
        title: ("Home"),
        activeColorPrimary: AppColors.mainColor,
        inactiveColorPrimary: AppColors.yellowColor,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.archivebox),
        title: ("Archive"),
        activeColorPrimary: AppColors.mainColor,
        inactiveColorPrimary: AppColors.yellowColor,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.cart),
        title: ("Cart History"),
        activeColorPrimary: AppColors.mainColor,
        inactiveColorPrimary: AppColors.yellowColor,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.person),
        title: ("Me"),
        activeColorPrimary: AppColors.mainColor,
        inactiveColorPrimary: AppColors.yellowColor,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style1, // Choose the nav bar style with this property.
    );
  }
}

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     body: pages[_selectedIndex],
//     bottomNavigationBar: BottomNavigationBar(
//       selectedItemColor: AppColors.mainColor,
//       unselectedItemColor: AppColors.paraColor,
//       showSelectedLabels: false,
//       showUnselectedLabels: false,
//       selectedFontSize: 0.0,
//       unselectedFontSize: 0.0,
//       currentIndex: _selectedIndex,
//       onTap: onTapNav,
//       items: [
//         BottomNavigationBarItem(
//           icon: Icon(Icons.home_outlined),
//           label: 'Home',
//         ),
//         BottomNavigationBarItem(icon: Icon(Icons.archive_outlined), label: 'History'),
//         BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), label: 'Cart'),
//         BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'me'),
//       ],
//     ),
//   );
// }
