import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newtruck/constants/constants.dart';
import 'package:newtruck/dashboard_screen.dart';
import 'package:newtruck/navigation_pages/garage.dart';
import 'package:newtruck/navigation_pages/mappage.dart';
import 'package:newtruck/detail_screen.dart';

class mainPage extends StatefulWidget {
  const mainPage({Key? key}) : super(key: key);

  @override
  _mainPage createState() => _mainPage();
}

class _mainPage extends State<mainPage> {
  List pages = [
    mappingPage(),
    DashboardScreen(),
    garageScreen(),
  ];

  int currentIndex = 1;

  void onTAP(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        onTap: onTAP,
        currentIndex: currentIndex,
        selectedItemColor: kPrimaryColor,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showUnselectedLabels: false,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
              label: 'Go-Map', icon: Icon(CommunityMaterialIcons.map_marker)),
          BottomNavigationBarItem(
              label: 'Gotruck',
              icon: Icon(CommunityMaterialIcons.alpha_g_circle_outline)),
          BottomNavigationBarItem(
              label: 'Go-Garage',
              icon: Icon(CommunityMaterialIcons.garage_open_variant))
        ],
      ),
    );
  }
}
