// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_manager/file_manager.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:nico_tna/Login/loginPage.dart'; 
// import 'package:firebase_core/firebase_core.dart';

// main bg colourr greyy 900 and shdes
// accensts green 400
// font:   Monstreat  final = quicksand,   ibm plex mono , zila slab

Future main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();

  // initialze our database which is hive
  await Hive.initFlutter();

  // open the box [which basically database]
  var box = await Hive.openBox('mybox');

  // another box for styles data
  // pp box
  var ppBox = await Hive.openBox('ppBox');

  //fit box
  var fitBox = await Hive.openBox('fitBox');

  //controlers for id and password

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: loginPage(),
      theme: ThemeData(brightness: Brightness.dark),
    );
  }
}
