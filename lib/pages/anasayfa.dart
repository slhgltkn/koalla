import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconly/iconly.dart';
import 'package:koalla/others/NavBar.dart';
import 'package:koalla/others/filmler/Avatar.dart';
import 'package:koalla/others/renkler.dart';
import 'package:koalla/others/API.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:koalla/pages/anasayfa.dart';
import 'package:koalla/pages/details.dart';
import 'package:koalla/pages/filmler.dart';
import 'package:flutter/src/rendering/box.dart';
import 'package:koalla/pages/gamesScreen.dart';
import 'package:koalla/pages/search.dart';

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
      bottomNavigationBar: navBar(),
      backgroundColor: renkler.arkaPlan,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: size.height * 0.06),
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
            SizedBox(height: size.height * 0.025),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => profile()),
                );
              },
              child: Container(
                alignment: Alignment.center,
                width: size.width * 0.9,
                height: size.height * 0.075,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: renkler.turuncu2),
                child: Text(
                  'Oyun Kategorimiz Açıldı\n Oynamak İçin Lütfen Tıklayın',
                  style: TextStyle(
                      color: renkler.beyaz, fontSize: 17, height: 1.35),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: size.height * 0.025),
            //SizedBox(height: size.height * 0.06),
            Filmler(),
          ],
        ),
      ),
    );
  }
}

class SearchBox extends StatefulWidget {
  const SearchBox({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Search(),
          ),
        );
      }),
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

class ustFilm extends StatefulWidget {
  const ustFilm({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<ustFilm> createState() => _ustFilmState();
}

class _ustFilmState extends State<ustFilm> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final ref = FirebaseDatabase.instance.ref().child('movies');
    return Container(
      width: widget.size.width * 0.9,
      height: widget.size.height * 0.25,
      decoration: BoxDecoration(
        color: renkler.acikBackg,
        borderRadius: BorderRadius.circular(30),
      ),
      child: FirebaseAnimatedList(
        scrollDirection: Axis.horizontal,
        query: ref,
        itemBuilder: (context, snapshot, animation, index) {
          Map movie = snapshot.value as Map;

          movie['key'] = snapshot.key;
          return Row(
            children: [
              SizedBox(width: widget.size.width * 0.05),
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image(
                  width: widget.size.width * 0.25,
                  image: NetworkImage(
                    movie['image'],
                  ),
                ),
              ),
              Container(
                width: widget.size.width * 0.6,
                child: Column(
                  children: [
                    SizedBox(height: widget.size.height * 0.02),
                    Text(
                      movie['name'],
                      style: TextStyle(
                        color: renkler.beyaz,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.clip,
                      softWrap: true,
                    ),
                    SizedBox(height: widget.size.height * 0.015),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Spacer(flex: 1),
                        Text(
                          movie['date'],
                          style: TextStyle(
                              color: renkler.beyaz,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        Spacer(flex: 1),
                        Text(
                          movie['rate'],
                          style: TextStyle(
                              color: renkler.beyaz,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        Spacer(flex: 1),
                        Text(
                          movie['time'],
                          style: TextStyle(
                              color: renkler.beyaz,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: size.width * 0.005),
                        Text(
                          'dk',
                          style: TextStyle(color: renkler.beyaz, fontSize: 16),
                        ),
                        Spacer(flex: 1),
                      ],
                    ),
                    SizedBox(height: widget.size.height * 0.02),
                    Container(
                      width: widget.size.width * 0.5,
                      child: Text(
                        movie['details'],
                        maxLines: 3,
                        style: TextStyle(
                          color: renkler.beyaz,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    SizedBox(height: widget.size.height * 0.012),
                    InkWell(
                      onTap: (() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Details(
                              details: movie['details'],
                              image: movie['image'],
                              name: movie['name'],
                              date: movie['date'],
                              imdbPuan: movie['rate'],
                              time: movie['time'],
                              link: movie['link'],
                            ),
                          ),
                        );
                      }),
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
          );
        },
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
