import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/Balancing/Balancing.dart';
import 'package:flutter_application_1/Models/Balancing/statistics.dart';
import 'package:flutter_application_1/Models/BottomScreens/Home.dart';
import 'package:flutter_application_1/Models/Screens/Guids/guid2.dart';
import 'package:flutter_application_1/Models/favorite/Favorite2.dart';
import 'package:flutter_application_1/cons.dart';
import 'package:flutter_application_1/displayFruit.dart';
import 'package:page_transition/page_transition.dart';

class secand2 extends StatefulWidget {
  final List<Plant2> favoratedPlants2;
  secand2({Key? key2, required this.favoratedPlants2}) : super(key: key2);

  @override
  State<secand2> createState() => _secand2State();
}

class _secand2State extends State<secand2> {
  List<Plant2> favorite = [];

  int currentIndex = 0;
  int _bottomNaigation = 0;
  List<Widget> _widgetOptions() {
    return [
      const home1(),
      Favorite2(favoratedPlants2: favorite),
      Statistics(
        plantId: currentIndex,
      ),
      balancing(
        plantId: currentIndex,
      ),
    ];
  }

  List<IconData> iconList = [
    Icons.home,
    Icons.favorite,
    Icons.account_balance,
    Icons.work_history,
  ];

  List<String> titleList = [
    'Home',
    'Favorite2',
    'HisTory',
    'Balancing',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: Text(
                'پەرەی سەرەکی',
                style: TextStyle(color: cons.blackcolor, fontWeight: FontWeight.w500, fontSize: 24),
              ),
            ),
            Icon(
              Icons.notifications,
              color: cons.blackcolor,
              size: 30,
            )
          ],
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: IndexedStack(
        index: _bottomNaigation,
        children: _widgetOptions(),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                PageTransition(child: displayFruit(), type: PageTransitionType.bottomToTop));
          },
          child: Icon(
            Icons.camera,
            size: 30,
          ),
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        splashColor: cons.primaryColor,
        activeColor: cons.primaryColor,
        inactiveColor: Colors.black.withOpacity(1),
        icons: iconList,
        activeIndex: _bottomNaigation,
        gapLocation: GapLocation.none,
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: (index) {
          setState(() {
            _bottomNaigation = index;
            final List<Plant2> favoratedPlants2 = Plant2.getFavoratedPlants2();
            favorite = favoratedPlants2;
          });
        },
      ),
    );
  }
}
