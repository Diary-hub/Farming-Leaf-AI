import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/Screens/Guids/guid2.dart';
import 'package:flutter_application_1/Models/plant_widge/plant_widge2.dart';
import 'package:flutter_application_1/cons.dart';

class Favorite2 extends StatefulWidget {
  final List<Plant2> favoratedPlants2;
  const Favorite2({Key? key2, required this.favoratedPlants2}) : super(key: key2);

  @override
  _favoriteState2 createState() => _favoriteState2();
}

class _favoriteState2 extends State<Favorite2> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: widget.favoratedPlants2.isEmpty
          ? Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      height: 100,
                      child: Image.network(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0tYVQVNqPK7VwhdMq1oVonZbNDxlNFO1_UA&usqp=CAU")),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "رووەکی دل خوازی تۆ",
                    style: TextStyle(
                      color: cons.primaryColor,
                      fontWeight: FontWeight.w300,
                      fontSize: 18,
                    ),
                  )
                ],
              ),
            )
          : Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 30),
              height: size.height * .9,
              child: ListView.builder(
                  itemCount: widget.favoratedPlants2.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, index) {
                    return PlantWidget2(index: index, plantList2: widget.favoratedPlants2);
                  })),
    );
  }
}
