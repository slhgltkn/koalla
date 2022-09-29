import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:koalla/others/filmler/Avatar.dart';
import 'package:koalla/others/renkler.dart';
import 'package:koalla/others/API.dart';
import 'package:http/http.dart' as http;

bool showTextField = false;

class anasayfa extends StatefulWidget {
  const anasayfa({super.key});

  @override
  State<anasayfa> createState() => _anasayfaState();
}

class _anasayfaState extends State<anasayfa> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: renkler.arkaPlan,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: size.height * 0.04),
              Row(
                children: [
                  Spacer(flex: 1),
                  logo(),
                  Spacer(flex: 7),
                  SearchBox(),
                  Spacer(flex: 1),
                ],
              ),
              SizedBox(height: size.height * 0.06),
              ustFilm(size: size),
              SizedBox(height: size.height * 0.06),
              avatarCard(),
            ],
          ),
        ));
  }
}

class SearchBox extends StatelessWidget {
  const SearchBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() {}),
      borderRadius: BorderRadius.circular(15),
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(color: renkler.beyaz, width: 0.7),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              renkler.turuncu2,
              renkler.turuncu4,
            ],
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Icon(
          IconlyBroken.search,
          color: renkler.beyaz,
          size: 25,
        ),
      ),
    );
  }
}

class ustFilm extends StatelessWidget {
  const ustFilm({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.9,
      height: size.height * 0.25,
      decoration: BoxDecoration(
        color: renkler.acikBackg,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          SizedBox(width: size.width * 0.05),
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image(
              width: size.width * 0.25,
              image: NetworkImage(
                  "https://upload.wikimedia.org/wikipedia/tr/1/12/Avatar-Film-Posteri.jpg"),
            ),
          ),
          Container(
            width: size.width * 0.6,
            child: Column(
              children: [
                SizedBox(height: size.height * 0.02),
                Text(
                  "Avatar",
                  style: TextStyle(
                      color: renkler.beyaz,
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                ),
                SizedBox(height: size.height * 0.015),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Spacer(flex: 1),
                    Text(
                      "2022",
                      style: TextStyle(
                          color: renkler.beyaz,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Spacer(flex: 1),
                    Text(
                      "8.6",
                      style: TextStyle(
                          color: renkler.beyaz,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Spacer(flex: 1),
                    Text(
                      "8.6",
                      style: TextStyle(
                          color: renkler.beyaz,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Spacer(flex: 1),
                  ],
                ),
                SizedBox(height: size.height * 0.02),
                Container(
                  width: size.width * 0.5,
                  child: Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                    style: TextStyle(color: renkler.beyaz, fontSize: 13),
                  ),
                ),
                SizedBox(height: size.height * 0.012),
                InkWell(
                  onTap: (() {}),
                  borderRadius: BorderRadius.circular(13),
                  child: Container(
                    width: 130,
                    height: 40,
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
                        ),
                        Spacer(flex: 1),
                        Text(
                          "Şimdi İzle",
                          style: TextStyle(
                              color: renkler.beyaz,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        Spacer(flex: 2),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class logo extends StatelessWidget {
  const logo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 175,
      child: Image(
        image: AssetImage("assets/pictures/koallaLogoGradyan.png"),
      ),
    );
  }
}
