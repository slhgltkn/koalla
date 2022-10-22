import 'package:flutter/material.dart';
import 'package:koalla/others/NavBar.dart';
import 'package:koalla/others/renkler.dart';
import 'package:koalla/pages/anasayfa.dart';
import 'package:koalla/pages/games.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: renkler.arkaPlan,
      bottomNavigationBar: navBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: size.height * 0.06),
            logo(),
            SizedBox(height: size.height * 0.06),
            games(),
          ],
        ),
      ),
    );
  }
}
