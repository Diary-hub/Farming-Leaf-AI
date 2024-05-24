import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/Models/Screens/Guids/guid2.dart';
import 'package:flutter_application_1/Models/detel/detel2.dart';
import 'package:flutter_application_1/cons.dart';
import 'package:page_transition/page_transition.dart';

class PlantWidget2 extends StatelessWidget {
  const PlantWidget2({
    Key? key2,
    required this.index,
    required this.plantList2,
  }) : super(key: key2);

  final int index;
  final List plantList2;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Plant2> _plantList = Plant2.plantList2;
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            PageTransition(
                child: DetailPage2(
                  plantId: index,
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
                "" + plantList2[index].plantId.toString(),
                style: TextStyle(fontSize: 18, color: cons.primaryColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}
