import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/Screens/Guids/guid2.dart';
import 'package:flutter_application_1/cons.dart';

class DetailPage2 extends StatefulWidget {
  final int plantId;
  const DetailPage2({Key? key, required this.plantId}) : super(key: key);

  @override
  State<DetailPage2> createState() => _DetailPage2State();
}

class _DetailPage2State extends State<DetailPage2> {
  bool toggleIsFavotarited2(bool isFavorited2) {
    return !isFavorited2;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Plant2> plantList2 = Plant2.plantList2;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 10,
            left: -100,
            child: SizedBox(
              height: 350,
              child: Image.network(plantList2[widget.plantId].imageURL),
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //  crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: cons.primaryColor.withOpacity(.15)),
                    child: Icon(
                      Icons.close,
                      color: cons.primaryColor,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    debugPrint('favorite2');
                  },
                  child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: cons.primaryColor.withOpacity(.15)),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            bool isFavorited2 =
                                toggleIsFavotarited2(plantList2[widget.plantId].isFavorated2);
                            plantList2[widget.plantId].isFavorated2 = isFavorited2;
                          });
                        },
                        icon: Icon(
                          plantList2[widget.plantId].isFavorated2 == true
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: cons.primaryColor,
                        ),
                      )),
                ),
              ],
            ),
          ),
          Positioned(
              top: 100,
              left: 20,
              right: 20,
              child: Container(
                width: size.width * .8,
                height: size.height * .8,
                padding: const EdgeInsets.all(20),
                child: Stack(
                  children: [
                    Positioned(
                        top: 10,
                        right: 0,
                        child: SizedBox(
                          height: 150,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              PlantFeature2(
                                title2: 'وەرز',
                                plantFeature2: plantList2[widget.plantId].Catagoris,
                              ),
                              PlantFeature2(
                                title2: 'ناوی بەرهەم',
                                plantFeature2: plantList2[widget.plantId].name,
                              ),
                              PlantFeature2(
                                title2: 'پلەی گەرمی',
                                plantFeature2: plantList2[widget.plantId].temperature.toString(),
                              ),
                            ],
                          ),
                        ))
                  ],
                ),
              )),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.only(top: 0, left: 30, right: 30),
              height: size.height * .5,
              width: size.width,
              decoration: BoxDecoration(
                color: cons.primaryColor.withOpacity(.4),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                              plantList2[widget.plantId].name,
                              style: TextStyle(
                                color: cons.primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 30.0,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        softWrap: true,
                        plantList2[widget.plantId].Decription,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            height: 1.5, fontSize: 18, color: cons.blackcolor.withOpacity(.7)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PlantFeature2 extends StatelessWidget {
  final String plantFeature2;
  final String title2;

  const PlantFeature2({
    super.key,
    required this.plantFeature2,
    required this.title2,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title2,
          style: TextStyle(color: cons.blackcolor),
        ),
        Text(
          plantFeature2,
          style: TextStyle(color: cons.primaryColor, fontSize: 18, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
