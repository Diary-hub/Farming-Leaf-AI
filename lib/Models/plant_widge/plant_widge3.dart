import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/Models/Screens/Guids/guid3.dart';
import 'package:flutter_application_1/Models/detel/detel3.dart';
import 'package:flutter_application_1/cons.dart';
import 'package:page_transition/page_transition.dart';

class PlantWidget3 extends StatelessWidget {
  const PlantWidget3({
    Key? key,
    required this.index,
    required this.plantList3,
  }) : super(key: key);

  final int index;
  final List plantList3;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Plant3> _plantList = Plant3.plantList3;
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            PageTransition(
                child: DetailPage3(
                  plantId3: index,
                ),
                type: PageTransitionType.bottomToTop));
      },
      child: Container(
        decoration: BoxDecoration(
          color: cons.primaryColor.withOpacity(.1),
          borderRadius: BorderRadius.circular(10),
        ),
        height: 80,
        padding: const EdgeInsets.only(left: 10, top: 10),
        margin: const EdgeInsets.only(bottom: 10, top: 10),
        width: size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      color: cons.primaryColor.withOpacity(.8), shape: BoxShape.circle),
                ),
                Positioned(
                  bottom: -120,
                  left: 0,
                  right: 0,
                  child: SizedBox(
                    height: 300,
                    child: Image.network(_plantList[index].imageURL),
                  ),
                ),
                Positioned(
                    bottom: 5,
                    left: 80,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(_plantList[index].Catagoris),
                        Text(
                          _plantList[index].name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18, color: cons.primaryColor),
                        )
                      ],
                    )),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(right: 18),
              child: Text(
                "" + _plantList[index].plantId3.toString(),
                style: TextStyle(fontSize: 18, color: cons.primaryColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}
