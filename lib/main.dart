import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/Balancing/add_date.g.dart';
import 'package:flutter_application_1/Models/Balancing/adddata.dart';
import 'package:flutter_application_1/Models/root/secand.dart';
import 'package:flutter_application_1/firebase_options.dart';
import 'package:flutter_application_1/splash.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Hive.initFlutter();
  Hive.registerAdapter(AdddataAdapter());
  await Hive.openBox<Add_data>('data');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Directionality(
            textDirection: TextDirection.ltr,
            child: FirebaseAuth.instance.currentUser == null
                ? splash()
                : secand(
                    favoratedPlants: [],
                    favoratedPlants2: [],
                  )),
      ),
    );
  }
}
