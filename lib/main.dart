import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:koalla/pages/anasayfa.dart';

import 'package:koalla/pages/details.dart';
import 'package:firebase_database/firebase_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "Comfortaa"),
      home: Scaffold(
        body: anasayfa(),
      ),
    );
  }
}
