import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/Screens/Guids/guid.dart';
import 'package:flutter_application_1/cons.dart';

class DetailPage extends StatefulWidget {
  final int plantId;
  const DetailPage({Key? key, required this.plantId}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool toggleIsFavotarited(bool isFavorited) {
    return !isFavorited;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Plant> __plantList = Plant.plantList;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 10,
            left: -100,
            child: SizedBox(
              height: 350,
              child: Image.network(__plantList[widget.plantId].imageURL),
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
                    debugPrint('favorite');
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
                            bool isFavorited =
                                toggleIsFavotarited(__plantList[widget.plantId].isFavorated);
                            __plantList[widget.plantId].isFavorated = isFavorited;
                          });
                        },
                        icon: Icon(
                          __plantList[widget.plantId].isFavorated == true
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
                              PlantFeature(
                                title: 'وەرز',
                                plantFeature: __plantList[widget.plantId].Catagoris,
                              ),
                              PlantFeature(
                                title: 'ناوی بەرهەم',
                                plantFeature: __plantList[widget.plantId].name,
                              ),
                              PlantFeature(
                                title: 'پلەی گەرمی',
                                plantFeature: __plantList[widget.plantId].temperature.toString(),
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
                              __plantList[widget.plantId].name,
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
                        __plantList[widget.plantId].Decription,
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

class PlantFeature extends StatelessWidget {
  final String plantFeature;
  final String title;

  const PlantFeature({
    super.key,
    required this.plantFeature,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(color: cons.blackcolor),
        ),
        Text(
          plantFeature,
          style: TextStyle(color: cons.primaryColor, fontSize: 18, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
