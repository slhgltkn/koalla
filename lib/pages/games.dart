import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:koalla/others/filmler/Avatar.dart';
import 'package:koalla/others/renkler.dart';
import 'package:koalla/others/API.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:koalla/pages/WebViewGame.dart';
import 'package:koalla/pages/anasayfa.dart';
import 'package:flutter/src/rendering/box.dart';
import 'package:koalla/pages/details.dart';
import 'package:webview_flutter/webview_flutter.dart';

class games extends StatefulWidget {
  const games({super.key});

  @override
  State<games> createState() => _gamesState();
}

class _gamesState extends State<games> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final ref = FirebaseDatabase.instance.ref().child('games');
    return Container(
      height: size.height * 1,
      child: FirebaseAnimatedList(
        query: ref,
        itemBuilder: (context, snapshot, animation, index) {
          Map game = snapshot.value as Map;
          game['key'] = snapshot.key;
          return Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: renkler.acikBackg,
                  borderRadius: BorderRadius.circular(25),
                ),
                height: size.height * 0.2,
                width: size.width * 0.8,
                child: Row(
                  children: [
                    SizedBox(width: size.width * 0.02),
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(21),
                        bottomLeft: Radius.circular(21),
                        topRight: Radius.circular(21),
                        bottomRight: Radius.circular(21),
                      ),
                      child: Image(
                        width: size.width * 0.28,
                        height: size.height * 0.18,
                        image: NetworkImage(
                          game['gameImage'],
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: size.width * 0.025),
                    Column(
                      children: [
                        Spacer(flex: 2),
                        Container(
                          width: size.width * 0.45,
                          child: Center(
                            child: Text(
                              game['gameName'],
                              style: TextStyle(
                                  color: renkler.beyaz,
                                  fontSize: 20,
                                  height: 1.25,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.clip,
                              softWrap: true,
                            ),
                          ),
                        ),
                        Spacer(flex: 3),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => webViewGame(
                                  gameUrl: game['gameUrl'],
                                ),
                              ),
                            );
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: size.width * 0.35,
                            height: size.height * 0.065,
                            decoration: BoxDecoration(
                                color: renkler.turuncu2,
                                borderRadius: BorderRadius.circular(20)),
                            child: Text(
                              'Oyunu Oyna',
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: renkler.beyaz, fontSize: 16),
                            ),
                          ),
                        ),
                        Spacer(flex: 2),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.02),
            ],
          );
        },
      ),
    );
  }
}
