import 'package:crisis_app/constant/global_variables.dart';
import 'package:crisis_app/features/home/home.dart';
import 'package:flutter/material.dart';
// import 'package:badges/badges.dart' as badges;

class BottomBar extends StatefulWidget {
  static const String routeName = '/actual-home';
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  double bottomBarWidth = 42;
  double bottomBarBorderWidth = 5;
  List<Widget> pages = [
    const HomeScreen(),
  ];

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
        currentIndex: _page,
        selectedItemColor: GlobalVariables.selectedNavBarColor,
        unselectedItemColor: GlobalVariables.unselectedNavBarColor,
        backgroundColor: GlobalVariables.backgroundColor,
        iconSize: 28,
        onTap: updatePage,
        items: [
          // Home
          BottomNavigationBarItem(
            icon: SizedBox(
              width: bottomBarWidth,
              child: const Padding(
                padding: EdgeInsets.only(top: 2.0),
                child: Icon(Icons.home),
              ),
            ),
            label: "Home",
          ),
          // Account
        ],
      ),
    );
  }
}
