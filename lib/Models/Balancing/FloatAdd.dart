import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/Balancing/Balancing.dart';

class floatadd extends StatefulWidget {
  floatadd({super.key});
  @override
  State<floatadd> createState() => _floataddState();
}

class _floataddState extends State<floatadd> {
  int index_color = 0;
  int currentIndex = 0;

  List Screen = [
    balancing(plantId: 3),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Screen[index_color],
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
