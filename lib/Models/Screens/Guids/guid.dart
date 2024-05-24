import 'package:cloud_firestore/cloud_firestore.dart';

class Plant {
  final int plantId;
  final String Catagoris;
  final String name;
  final String imageURL;
  final String temperature;
  bool isFavorated;
  final String Decription;
  bool isSelected;

  Plant(
      {required this.plantId,
      required this.Catagoris,
      required this.name,
      required this.imageURL,
      required this.temperature,
      required this.Decription,
      required this.isFavorated,
      required this.isSelected});

  Map<String, dynamic> toJson() {
    return {
      'PlantID': plantId,
      'Name': name,
      'Catagoris': Catagoris,
      'ImageURL': imageURL,
      'Temperature': temperature,
      'Decription': Decription,
      'IsFavorated': isFavorated,
      'IsSelected': isSelected,
    };
  }

  static Plant empty() => Plant(
        Catagoris: '',
        Decription: '',
        imageURL: '',
        isFavorated: false,
        isSelected: false,
        name: '',
        plantId: 0,
        temperature: '',
      );

  factory Plant.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    try {
      if (document.data() != null) {
        final data = document.data()!;

        return Plant(
          Catagoris: data['Catagoris'] ?? '',
          Decription: data['Decription'] ?? '',
          imageURL: data['ImageURL'] ?? '',
          isFavorated: data['IsFavorated'] ?? false,
          temperature: data['Temperature'] ?? '',
          name: data['Name'] ?? '',
          plantId: data['PlantID'] ?? 0,
          isSelected: data['IsSelected'] ?? false,
        );
      } else {
        return Plant.empty();
      }
    } catch (e) {
      print(e.toString());
      print("Model Error");
      return Plant.empty();
    }
  }

  static List<Plant> plantList = [
    Plant(
      plantId: 1,
      Catagoris: 'زستان',
      name: 'گەنم',
      imageURL:
          "https://static.vecteezy.com/system/resources/thumbnails/024/865/644/small/wheat-with-ai-generated-free-png.png",
      temperature: '١٥-٢٤',
      Decription:
          'بە گشتی گەنم بەرهەمێکی هەمەلایەنەیە کە دەتوانرێت لە کەشوهەوای جۆراوجۆر و بارودۆخی خاکدا بچێنرێت، بەڵام لە ناوچە مامناوەندەکاندا باشترین ئەنجام دەدات کە پلەی گەرمی فێنک و شێی گونجاوە.  بەزۆری گەنم لە وەرزی پایز یان سەرەتای زستاندا دەچێنرێت، ئەمەش بەپێی شوێن و جۆری. وەرزی تایبەت و پێداویستی پلەی گەرمی بۆ گەشەکردنی گەنم بەندە بە جۆراوجۆری گەنم و ئەو ناوچەیەی کە تێیدا دەچێنرێت. گەنم بەرهەمێکی وەرزی فێنک و بە شێوەیەکی گشتی لە کەشوهەوای مامناوەنددا باشترین گەشە دەکات.',
      isFavorated: false,
      isSelected: true,
    ),
    Plant(
      plantId: 2,
      Catagoris: 'پایز',
      name: 'جۆ',
      imageURL:
          "https://static.vecteezy.com/system/resources/thumbnails/028/172/671/small/ripe-ears-of-wheat-isolated-ai-generated-png.png",
      temperature: '٧-٢٤',
      Decription:
          'بە دابینکردنی بارودۆخی ژینگەیی گونجاو، بەرهەمهێنەران دەتوانن ڕووەکی زیرەی تەندروست بچێنن و تۆوی تامدار دروێنە بکەن بۆ بەکارهێنانی چێشتلێنان. هەروەها ئامادەیە بۆ ئاوگرتن، بۆیە ئاوەڕۆی دروست زۆر گرنگە بۆ ڕێگریکردن لە ڕوتانەوەی ڕەگ و نەخۆشییە گواستراوەکانی تری خاک. بارودۆخی گەشەکردن: زیرە هەستیارە بە بەستەڵەک، بۆیە گرنگە دوای دوایین بەرواری بەستەڵەک لە بەهاردا لە ناوچە مامناوەندەکاندا بچێنرێت. توانای بەرگەگرتنی پلەی گەرمی فێنکتر و گونجاندنی لەگەڵ وەرزە جیاوازەکانی چاندن وای لێدەکات ببێتە بەرهەمێکی بەنرخ بۆ جووتیارانی ناوچە کشتوکاڵییە جۆراوجۆرەکان. بە گشتی جۆ بەرهەمێکی هەمەلایەنەیە کە دەتوانرێت لە کەشوهەوا و بارودۆخی خاکی جیاوازدا بچێنرێت، بەڵام لە ژینگەی وەرزی فێنکدا باشترین ئەنجام دەدات کە شێی گونجاو و ئاوەڕۆی باشی خاکە. جۆ زیاتر بەرگەی سەرما دەگرێت لە گەنم و لە قۆناغە سەرەتاییەکانی گەشەکردنیدا بەرگەی بەستەڵەک دەگرێت، ئەمەش وایکردووە گونجاو بێت بۆ چاندن لە کەشوهەوای فێنکتردا. لە پاییزدا دەچێنرێت، بەزۆری لە نێوان مانگی ئەیلول و تشرینی دووەمدا، لە کۆتایی بەهار یان سەرەتای هاوینی ساڵی دواتردا دروێنە دەکرێت. جۆ، دانەوێڵەیەکی دانەوێڵە وەک گەنم و وەرزێڕ، بە شێوەیەکی گشتی لە بارودۆخی وەرزی فێنکدا گەشە دەکات.',
      isFavorated: false,
      isSelected: true,
    ),
    Plant(
      plantId: 3,
      Catagoris: 'هاوین',
      name: 'زیرە',
      imageURL:
          "https://static.vecteezy.com/system/resources/thumbnails/021/596/755/small/fennel-seeds-isolated-on-a-transparent-background-png.png",
      temperature: '٢٠-٣٠',
      Decription:
          'بە دابینکردنی بارودۆخی ژینگەیی گونجاو، بەرهەمهێنەران دەتوانن ڕووەکی زیرەی تەندروست بچێنن و تۆوی تامدار دروێنە بکەن بۆ بەکارهێنانی چێشتلێنان. بە گشتی زیرە بەرهەمێکی وەرزی گەرمە و لە بارودۆخی خۆرگیر و خاکی ئاوڕێژکراودا گەشە دەکات. بە دابینکردنی بارودۆخی ژینگەیی گونجاو، بەرهەمهێنەران دەتوانن ڕووەکی زیرەی تەندروست بچێنن و تۆوی تامدار دروێنە بکەن بۆ بەکارهێنانی چێشتلێنان. بە گشتی زیرە بەرهەمێکی وەرزی گەرمە و لە بارودۆخی خۆرگیر و خاکی ئاوڕێژکراودا گەشە دەکات. زیرە ڕووەکێکی ساڵانەی ڕووەکییە و بۆ تۆوەکەی دەچێنرێت، کە وەک بەهاراتێک لە چێشت لێناندا بەکاردەهێنرێت.',
      isFavorated: false,
      isSelected: true,
    ),
    Plant(
      plantId: 4,
      Catagoris: 'بەهار',
      name: 'برنج',
      imageURL:
          "https://static.vecteezy.com/system/resources/previews/021/217/432/original/wooden-spoon-with-white-rice-png.png",
      temperature: '٢٠-٤٠',
      Decription:
          'بەگشتی، برنج بەرهەمێکی گشتگیرە کە دەتوانرێت لە بارودۆخی کشتوکاڵی ئیکۆلۆژی جۆراوجۆردا بچێنرێت، لە کێڵگە لافاواویەکانەوە تا کێڵگە بەرزەکانی باراناوی. لە ناوچە مامناوەندەکاندا، برنج بە شێوەیەکی گشتی لە بەهاردا دەچێنرێت و لە پاییزدا دروێنە دەکرێت. لە ناوچە گەرم و ژێر گەرمەکاندا زۆرجار برنج لە وەرزی تەڕدا دەچێنرێت، کە بارانبارین زۆرە و پلەکانی گەرما گەرمن. برنج بە پلەی یەکەم لە کێڵگە لافاواوییەکاندا دەچێنرێت کە پێیان دەوترێت پادی، هەرچەندە دەتوانرێت لە ناوچە بەرزەکان یان سیستەمی باراناویشدا بچێنرێت. برنج بەرهەمێکی سەرەکی خۆراکییە و یەکێکە لە گرنگترین دانەوێڵەکانی دانەوێڵە لە سەرانسەری جیهاندابە دابینکردنی تێکەڵەیەکی دروستی پلەی گەرمی، ئاو، خاک و شێوازەکانی بەڕێوەبردن، جووتیاران دەتوانن بەرهەمی تەندروست برنجی بچێنن و بەرهەمی بەرز بەدەستبهێنن. .',
      isFavorated: false,
      isSelected: true,
    ),
    Plant(
      plantId: 5,
      Catagoris: 'هاوین',
      name: 'گەنمە شامی',
      imageURL:
          "https://static.vecteezy.com/system/resources/previews/029/332/671/original/corn-transparent-background-png.png",
      temperature: '٢٥-٣٥',
      Decription:
          'بە گشتی گەنمەشامی بەرهەمێکی گشتگیرە کە دەتوانرێت لە کەشوهەوا و بارودۆخی خاکی جۆراوجۆردا گەشە بکات، بەڵام لە پلەی گەرمی گەرمدا گەشە دەکات و پێویستی بە شێ و تیشکی خۆری گونجاوە بۆ گەشەکردن و گەشەکردنی گونجاو. باشترین ئەنجام دەدات لەو شوێنانەی کە ڕۆژانە لانیکەم ٦ بۆ ٨ کاتژمێر تیشکی ڕاستەوخۆی خۆریان تێدایە. تیشکی خۆر: گەنمەشامی بەرهەمێکی خۆشەویستی خۆرە و پێویستی بە خۆری تەواو هەیە بۆ گەشەکردن و گەشەکردنی گونجاو. گەنمەشامی بەرهەمێکی دانەوێڵەی وەرزی گەرمە و بە شێوەیەکی بەرفراوان بۆ دانەوێڵە خواردنەکانی دەچێنرێت.',
      isFavorated: false,
      isSelected: true,
    ),
  ];
  static List<Plant> getFavoratedPlants() {
    List<Plant> _travelList = Plant.plantList;
    return _travelList.where((element) => element.isFavorated == true).toList();
  }
}
