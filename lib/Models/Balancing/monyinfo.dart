import 'package:flutter_application_1/Models/Balancing/mony.dart';

List<mony> geter() {
  mony uPwork = mony();
  uPwork.name = 'گەنم';
  uPwork.buy = '100';
  //uPwork.sell='300';
  uPwork.time = '4/2/2022';
  uPwork.image =
      "https://static.vecteezy.com/system/resources/thumbnails/024/865/644/small/wheat-with-ai-generated-free-png.png";
  mony sew = mony();
  sew.name = 'سێو';
  sew.buy = '100';
  //uPwork.sell='300';
  sew.time = '4/2/2022';
  sew.image =
      "https://static.vecteezy.com/system/resources/thumbnails/028/172/671/small/ripe-ears-of-wheat-isolated-ai-generated-png.png";
  mony limo = mony();
  limo.name = 'سێو';
  limo.buy = '100';
  //uPwork.sell='300';
  limo.time = '4/2/2022';
  limo.image =
      "https://static.vecteezy.com/system/resources/thumbnails/021/596/755/small/fennel-seeds-isolated-on-a-transparent-background-png.png";
  return [uPwork, sew, limo];
}
