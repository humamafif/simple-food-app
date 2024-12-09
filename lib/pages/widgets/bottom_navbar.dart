import 'package:flutter/material.dart';
import '/core/color_constant.dart';
import '/feature/profile/presentation/page/profile_page.dart';
import '/pages/home/home_page.dart';
import '/pages/search/search_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key, required this.username});
  final String username;

  @override
  _BottomNavbarState createState() => _BottomNavbarState(username: username);
}

class _BottomNavbarState extends State<BottomNavbar> {
  late PersistentTabController _controller;

  final String username;

  _BottomNavbarState({required this.username});
  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  List<Widget> _buildScreens() {
    return [
      const HomePage(),
      const SearchPage(),
      ProfilePage(
        username: username,
      ),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        activeColorPrimary: black,
        inactiveColorPrimary: secondary,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.search),
        activeColorPrimary: black,
        inactiveColorPrimary: secondary,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person),
        activeColorPrimary: black,
        inactiveColorPrimary: secondary,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      padding: const EdgeInsets.only(bottom: 3),
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      backgroundColor: primary,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      navBarStyle: NavBarStyle.style3,
    );
  }
}
