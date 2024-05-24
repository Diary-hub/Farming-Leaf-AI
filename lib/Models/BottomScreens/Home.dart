import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/Screens/Tabs/TabOne.dart';
import 'package:flutter_application_1/Models/Screens/Tabs/tabThree.dart';
import 'package:flutter_application_1/Models/Screens/Tabs/tabtwo.dart';

class home1 extends StatefulWidget {
  const home1({super.key});

  @override
  State<home1> createState() => _home1State();
}

class _home1State extends State<home1> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    List<Widget> _plantList = [
      // 'دانەوێلە',
      // 'میوە',
      // 'سەوزەوات',
      // '',
      // '',
      Tab(
        child: Text('دانەوێلە'),
      ),
      Tab(
        child: Text('میوە'),
      ),
      Tab(
        child: Text('سەوزەوات'),
      ),
    ];
    TabController _tabController =
        TabController(length: _plantList.length, vsync: this, initialIndex: 0);

    return DefaultTabController(
        length: _plantList.length,
        child: Scaffold(
            body: SingleChildScrollView(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 50,
              width: size.width,
              child: TabBar(
                tabs: _plantList,
                controller: _tabController,
              )),
          Container(
            width: double.infinity,
            height: size.height,
            child: TabBarView(
              children: [TabOne(), tabtwo(), tabThree()],
              controller: _tabController,
            ),
          ),
        ]))));
  }
}
