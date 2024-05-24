import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/Screens/Guids/guid3.dart';
import 'package:flutter_application_1/Models/detel/detel3.dart';
import 'package:flutter_application_1/Models/plant_widge/plant_widge3.dart';
import 'package:flutter_application_1/cons.dart';
import 'package:page_transition/page_transition.dart';

class tabThree extends StatefulWidget {
  const tabThree({super.key});

  @override
  State<tabThree> createState() => _tabThreeState();
}

class _tabThreeState extends State<tabThree> {
  List<Plant3> __plantList = Plant3.plantList3;
  List<Plant3> favourites = [];
  bool loading = true;

  Future<void> addToFavourite(Plant3 plant) async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    try {
      await db
          .collection('Users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('Favourites')
          .doc(plant.plantId3.toString())
          .set(plant.toJson());
    } catch (e) {
      print("Firebase Error: $e");
    }
  }

  Future<void> getAllFavourite() async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    List<Plant3> updatedFavourites = [];

    try {
      QuerySnapshot querySnapshot = await db
          .collection('Users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('Favourites')
          .get();
      querySnapshot.docs.forEach((DocumentSnapshot doc) {
        updatedFavourites.add(Plant3.fromSnapshot(doc as DocumentSnapshot<Map<String, dynamic>>));
      });
    } catch (e) {
      print("Firebase Error: $e");
    }

    setState(() {
      favourites = updatedFavourites;
      loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getAllFavourite();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    if (loading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return Column(
        children: [
          SizedBox(
            height: size.height * .3,
            child: ListView.builder(
              itemCount: __plantList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                favourites.forEach((element) {
                  if (__plantList[index].plantId3 == element.plantId3) {
                    __plantList[index].isFavorated3 = element.isFavorated3;
                  }
                });
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        child: DetailPage3(
                          plantId3: index,
                        ),
                        type: PageTransitionType.bottomToTop,
                      ),
                    );
                  },
                  child: Container(
                    width: 200,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 10,
                          right: 20,
                          child: Container(
                            height: 50,
                            width: 50,
                            child: IconButton(
                              onPressed: () async {
                                bool isFavorited = !__plantList[index].isFavorated3;
                                setState(() {
                                  __plantList[index].isFavorated3 = isFavorited;
                                });
                                await addToFavourite(__plantList[index]);
                                await getAllFavourite();
                              },
                              icon: Icon(
                                __plantList[index].isFavorated3
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: cons.primaryColor,
                              ),
                              iconSize: 30,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 50,
                          right: 50,
                          top: 50,
                          bottom: 50,
                          child: Image.network(__plantList[index].imageURL),
                        ),
                        Positioned(
                          left: 15,
                          right: 20,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                __plantList[index].Catagoris,
                                style: const TextStyle(color: Colors.black, fontSize: 16),
                              ),
                              Text(
                                __plantList[index].name,
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              Positioned(
                                bottom: 15,
                                right: 20,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    r'' + __plantList[index].plantId3.toString(),
                                    style: TextStyle(color: Colors.white, fontSize: 16),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: cons.primaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 16, bottom: 20, top: 20),
            child: Center(
              child: const Text(
                "بەرهەمی نوێ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            height: size.height * .5,
            child: ListView.builder(
              itemCount: __plantList.length,
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return PlantWidget3(
                  index: index,
                  plantList3: [__plantList],
                );
              },
            ),
          ),
        ],
      );
    }
  }
}
