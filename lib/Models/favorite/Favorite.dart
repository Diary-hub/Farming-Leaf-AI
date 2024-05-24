import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/Screens/Guids/guid.dart';
import 'package:flutter_application_1/Models/plant_widge/fav_widget.dart';
import 'package:flutter_application_1/cons.dart';

class Favorite extends StatefulWidget {
  final List<Plant> favoratedPlants;
  const Favorite({Key? key, required this.favoratedPlants}) : super(key: key);

  @override
  State<Favorite> createState() => _favoriteState();
}

class _favoriteState extends State<Favorite> {
  List<Plant> favorites = [];
  bool loading = true;

  Future<void> getAllFavourite() async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    List<Plant> updatedFavourites = [];

    try {
      QuerySnapshot querySnapshot = await db
          .collection('Users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('Favourites')
          .where('IsFavorated', isEqualTo: true)
          .get();
      querySnapshot.docs.forEach((DocumentSnapshot doc) {
        updatedFavourites.add(Plant.fromSnapshot(doc as DocumentSnapshot<Map<String, dynamic>>));
      });
    } catch (e) {
      print("Firebase Error: $e");
    }

    setState(() {
      favorites = updatedFavourites;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    getAllFavourite().then((value) => setState(() {}));
    return Scaffold(
      body: favorites.isEmpty
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
                  itemCount: favorites.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, index) {
                    return PlantWidgetAll(index: index, plantList: favorites);
                  })),
    );
  }
}
