import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:koalla/others/filmler/Avatar.dart';
import 'package:koalla/others/renkler.dart';
import 'package:koalla/others/API.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:koalla/pages/anasayfa.dart';
import 'package:flutter/src/rendering/box.dart';

class Filmler extends StatefulWidget {
  const Filmler({super.key});

  @override
  State<Filmler> createState() => FfilmlerState();
}

class FfilmlerState extends State<Filmler> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final ref = FirebaseDatabase.instance.ref().child('movies');
    return Container(
      height: size.height * 1,
      child: FirebaseAnimatedList(
        query: ref,
        itemBuilder: (context, snapshot, animation, index) {
          Size size = MediaQuery.of(context).size;
          Map movie = snapshot.value as Map;
          movie['key'] = snapshot.key;

          return Container(
            width: size.width * 0.25,
            child: Column(
              children: [
                Container(
                  height: size.height * 0.225,
                  width: size.width * 0.38,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                    child: Image(
                      image: NetworkImage(
                        movie['image'],
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                Text(
                  movie['name'],
                  style: TextStyle(color: renkler.beyaz),
                ),
                SizedBox(height: size.height * 0.02),
              ],
            ),
          );
        },
      ),
    );
  }
}
