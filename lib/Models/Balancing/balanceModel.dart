import 'package:cloud_firestore/cloud_firestore.dart';

class BalanceItem {
  final String? id;
  final int plantId;
  final String name;
  final double money;
  final String imageURL;
  final String date;
  final String type;
  final String tip;

  BalanceItem({
    required this.plantId,
    required this.date,
    required this.name,
    required this.imageURL,
    required this.money,
    required this.tip,
    required this.type,
    this.id,
  });

  Map<String, dynamic> toJson() {
    return {
      'PlantID': plantId,
      'Name': name,
      'Money': money,
      'ImageURL': imageURL,
      'Date': date,
      'Type': type,
      'Tip': tip,
    };
  }

  static BalanceItem empty() => BalanceItem(
        date: DateTime.now().toString(),
        imageURL: '',
        money: 0,
        name: '',
        plantId: 0,
        tip: '',
        type: '',
        id: '',
      );

  factory BalanceItem.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    try {
      if (document.data() != null) {
        final data = document.data()!;

        return BalanceItem(
          date: data['Date'] ?? DateTime.now(),
          money: data['Money'] ?? 0,
          imageURL: data['ImageURL'] ?? '',
          tip: data['Tip'] ?? false,
          type: data['Type'] ?? '',
          name: data['Name'] ?? '',
          plantId: data['PlantID'] ?? 0,
          id: document.id,
        );
      } else {
        return BalanceItem.empty();
      }
    } catch (e) {
      print(e.toString());
      print("Model Error");
      return BalanceItem.empty();
    }
  }
}
