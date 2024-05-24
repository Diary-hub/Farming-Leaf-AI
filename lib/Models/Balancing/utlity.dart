import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/Models/Balancing/balanceModel.dart';
import 'package:hive/hive.dart';

int totals = 0;

Future<List<BalanceItem>> getAllFavourite() async {
  FirebaseFirestore db = FirebaseFirestore.instance;
  List<BalanceItem> updatedFavourites = [];

  try {
    QuerySnapshot querySnapshot = await db
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('Favourites')
        .where('IsFavorated', isEqualTo: true)
        .get();
    querySnapshot.docs.forEach((DocumentSnapshot doc) {
      updatedFavourites
          .add(BalanceItem.fromSnapshot(doc as DocumentSnapshot<Map<String, dynamic>>));
    });

    return updatedFavourites;
  } catch (e) {
    print("Firebase Error: $e");
    return [];
  }
}

List<BalanceItem> box = [];

final gg = getAllFavourite().then((value) => box = value);

int total() {
  var history2 = box;
  List a = [0, 0];
  for (var i = 0; i < history2.length; i++) {
    a.add(history2[i].type == 'داهات'
        ? int.parse(history2[i].money.toString())
        : int.parse(history2[i].money.toString()) * -1);
  }
  totals = a.reduce((value, element) => value + element);
  return totals;
}

int income() {
  var history2 = box;
  List a = [0, 0];
  for (var i = 0; i < history2.length; i++) {
    a.add(history2[i].type == 'داهات' ? int.parse(history2[i].money.toString()) : 0);
  }
  totals = a.reduce((value, element) => value + element);
  return totals;
}

int expenses() {
  var history2 = box;
  List a = [0, 0];
  for (var i = 0; i < history2.length; i++) {
    a.add(history2[i].type == 'داهات' ? 0 : int.parse(history2[i].money.toString()) * -1);
  }
  totals = a.reduce((value, element) => value + element);
  return totals;
}

List<BalanceItem> today() {
  List<BalanceItem> a = [];
  var history2 = box;
  DateTime date = new DateTime.now();
  for (var i = 0; i < history2.length; i++) {
    if (DateTime.parse(history2[i].date).day == date.day) {
      a.add(history2[i]);
    }
  }
  return a;
}

List<BalanceItem> week() {
  List<BalanceItem> a = [];
  DateTime date = new DateTime.now();
  var history2 = box;
  for (var i = 0; i < history2.length; i++) {
    if (date.day - 7 <= DateTime.parse(history2[i].date).day &&
        DateTime.parse(history2[i].date).day <= date.day) {
      a.add(history2[i]);
    }
  }
  return a;
}

List<BalanceItem> month() {
  List<BalanceItem> a = [];
  var history2 = box;
  DateTime date = new DateTime.now();
  for (var i = 0; i < history2.length; i++) {
    if (DateTime.parse(history2[i].date).month == date.month) {
      a.add(history2[i]);
    }
  }
  return a;
}

List<BalanceItem> year() {
  List<BalanceItem> a = [];
  var history2 = box;
  DateTime date = new DateTime.now();
  for (var i = 0; i < history2.length; i++) {
    if (DateTime.parse(history2[i].date).year == date.year) {
      a.add(history2[i]);
    }
  }
  return a;
}

int total_chart(List<BalanceItem> history2) {
  List a = [0, 0];

  for (var i = 0; i < history2.length; i++) {
    a.add(history2[i].type == 'داهات'
        ? int.parse(history2[i].money.toString())
        : int.parse(history2[i].money.toString()) * -1);
  }
  totals = a.reduce((value, element) => value + element);
  return totals;
}

List time(List<BalanceItem> history2, bool hour) {
  List<BalanceItem> a = [];
  List total = [];
  int counter = 0;
  for (var c = 0; c < history2.length; c++) {
    for (var i = c; i < history2.length; i++) {
      if (hour) {
        if (DateTime.parse(history2[i].date).hour == DateTime.parse(history2[i].date).hour) {
          a.add(history2[i]);
          counter = i;
        }
      } else {
        if (DateTime.parse(history2[i].date).day == DateTime.parse(history2[i].date).day) {
          a.add(history2[i]);
          counter = i;
        }
      }
    }
    total.add(total_chart(a));
    a.clear();
    c = counter;
  }
  print(total);
  return total;
}
