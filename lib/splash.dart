import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/indrodaction.dart';

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => indrodaction()));
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [Color(0xff368983), Color(0xff368983)],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        )),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Positioned(
              child: Container(
                  padding: EdgeInsets.only(right: 150),
                  width: 700,
                  height: 700,
                  child: Center(child: Image.asset('images/Farmer.png'))),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 320,
              ),
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    ));
  }
}
