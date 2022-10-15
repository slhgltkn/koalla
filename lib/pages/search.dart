import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_launcher_icons/main.dart';
import 'package:iconly/iconly.dart';
import 'package:koalla/others/filmler/Avatar.dart';
import 'package:koalla/others/renkler.dart';
import 'package:koalla/others/API.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:koalla/pages/anasayfa.dart';
import 'package:koalla/pages/details.dart';
import 'package:koalla/pages/filmler.dart';
import 'package:flutter/src/rendering/box.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => SsearchState();
}

class SsearchState extends State<Search> {
  TextEditingController editingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: renkler.arkaPlan,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: size.height * 0.09),
            Center(
              child: Container(
                width: size.width * 0.85,
                child: TextField(
                  textInputAction: TextInputAction.search,
                  style: TextStyle(color: renkler.beyaz),
                  textAlign: TextAlign.left,
                  cursorColor: renkler.beyaz,
                  onChanged: (value) {},
                  controller: editingController,
                  decoration: InputDecoration(
                    filled: true,
                    labelText: "Ara",
                    labelStyle: TextStyle(color: renkler.beyaz),
                    hintText: "Ara",
                    hintStyle: TextStyle(color: renkler.beyaz),
                    prefixIcon: Icon(
                      IconlyBroken.search,
                      color: renkler.beyaz,
                    ),
                    iconColor: renkler.beyaz,
                    fillColor: renkler.acikBackg,
                    hoverColor: renkler.beyaz,
                    prefixIconColor: renkler.beyaz,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: renkler.acikGri),
                      borderRadius: BorderRadius.all(
                        Radius.circular(25),
                      ),
                    ),
                    focusColor: renkler.turuncu1,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: renkler.turuncu1),
                      borderRadius: BorderRadius.all(
                        Radius.circular(25),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
