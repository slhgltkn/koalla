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
import 'package:koalla/pages/details.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
      height: 315,
      child: FirebaseAnimatedList(
        shrinkWrap: true,
        query: ref,
        itemBuilder: (context, snapshot, animation, index) {
          Map movie = snapshot.value as Map;
          movie['key'] = snapshot.key;

          return Column(
            children: [
              InkWell(
                onTap: (() {}),
                hoverColor: renkler.seffaf,
                highlightColor: renkler.seffaf,
                focusColor: renkler.seffaf,
                splashColor: renkler.seffaf,
                child: Container(
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
                            movie['image'],
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: size.width * 0.025),
                      Column(
                        children: [
                          Spacer(flex: 1),
                          Container(
                            width: size.width * 0.45,
                            child: Center(
                              child: Text(
                                movie['name'],
                                style: TextStyle(
                                    color: renkler.beyaz,
                                    fontSize: 16,
                                    height: 1.25,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.clip,
                                softWrap: true,
                              ),
                            ),
                          ),
                          SizedBox(height: size.height * 0.02),
                          Container(
                            width: size.width * 0.45,
                            child: Row(
                              children: [
                                Spacer(flex: 1),
                                Text(
                                  movie['date'],
                                  style: TextStyle(color: renkler.koyuBeyaz),
                                ),
                                Spacer(flex: 1),
                                Text(
                                  movie['rate'],
                                  style: TextStyle(color: renkler.koyuBeyaz),
                                ),
                                Spacer(flex: 1),
                                Text(
                                  movie['time'],
                                  style: TextStyle(color: renkler.koyuBeyaz),
                                ),
                                SizedBox(width: size.width * 0.01),
                                Text(
                                  'dk',
                                  style: TextStyle(color: renkler.koyuBeyaz),
                                ),
                                Spacer(flex: 1),
                              ],
                            ),
                          ),
                          SizedBox(height: size.height * 0.035),
                          WatchButton(movie: movie),
                          Spacer(flex: 1),
                        ],
                      ),
                    ],
                  ),
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

class WatchButton extends StatefulWidget {
  WatchButton({super.key, required this.movie});
  final Map movie;
  @override
  State<WatchButton> createState() => _WatchButtonState();
}

class _WatchButtonState extends State<WatchButton> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: (() {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Details(
              details: widget.movie['details'],
              image: widget.movie['image'],
              name: widget.movie['name'],
              date: widget.movie['date'],
              imdbPuan: widget.movie['rate'],
              time: widget.movie['time'],
              link: widget.movie['link'],
            ),
          ),
        );
      }),
      borderRadius: BorderRadius.circular(13),
      child: Container(
        width: size.width * 0.3,
        height: size.height * 0.05,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              renkler.turuncu2,
              renkler.turuncu4,
            ],
          ),
          borderRadius: BorderRadius.circular(13),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Spacer(flex: 2),
            Icon(
              IconlyBroken.play,
              color: renkler.beyaz,
              size: 21,
            ),
            Spacer(flex: 1),
            Text(
              "Şimdi İzle",
              style: TextStyle(
                  color: renkler.beyaz,
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
            ),
            Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}

/*Container(
                child: Image(
                  width: size.width * 0.6,
                  image: NetworkImage(
                    movie['image'],
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                movie['name'],
                style: TextStyle(color: renkler.beyaz),
              ), */