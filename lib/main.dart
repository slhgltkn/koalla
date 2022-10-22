import 'dart:developer';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:koalla/others/renkler.dart';
import 'package:koalla/pages/anasayfa.dart';
import 'package:koalla/pages/auth/register.dart';
import 'package:koalla/pages/details.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:koalla/pages/auth/login.dart';
import 'package:koalla/pages/games.dart';
import 'package:koalla/pages/gamesScreen.dart';
import 'package:koalla/pages/search.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
