import 'package:flutter/material.dart';
import 'package:koalla/pages/anasayfa.dart';
import 'package:koalla/pages/details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
