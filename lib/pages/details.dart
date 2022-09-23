import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:koalla/others/renkler.dart';
import 'package:koalla/pages/anasayfa.dart';

class Details extends StatelessWidget {
  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: renkler.arkaPlan,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: size.height * 0.05),
            logo(),
            SizedBox(height: size.height * 0.05),
            Row(
              children: [
                Spacer(flex: 1),
                resim(size: size),
                kenarcontainer(size: size),
                Spacer(flex: 1),
              ],
            ),
            SizedBox(height: size.height * 0.05),
            baslik(),
            SizedBox(height: size.height * 0.01),
            aciklama()
          ],
        ),
      ),
    );
  }
}

class resim extends StatelessWidget {
  const resim({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: renkler.acikGri,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), bottomLeft: Radius.circular(40))),
      width: size.width * 0.55,
      height: size.height * 0.35,
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              bottomLeft: Radius.circular(40),
            ),
            child: Image(
              image: NetworkImage(
                "https://upload.wikimedia.org/wikipedia/tr/1/12/Avatar-Film-Posteri.jpg",
              ),
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              Spacer(flex: 1),
              Container(
                height: size.height * 0.25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(0, 253, 59, 33),
                      Color.fromARGB(200, 251, 102, 65),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Center(
              child: InkWell(
            onTap: (() {}),
            child: Icon(
              IconlyBroken.play,
              color: renkler.beyaz,
              size: 90,
            ),
          )),
        ],
      ),
    );
  }
}

class kenarcontainer extends StatelessWidget {
  const kenarcontainer({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.35,
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: renkler.acikBackg,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            width: size.width * 0.25,
            height: size.height * 0.11,
            child: Column(
              children: const [
                Spacer(flex: 3),
                Icon(
                  IconlyBroken.star,
                  color: renkler.turuncu4,
                  size: 35,
                ),
                Spacer(flex: 4),
                Text(
                  "8.6",
                  style: TextStyle(
                      color: renkler.beyaz,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                Spacer(flex: 1),
                Text(
                  "Puan",
                  style: TextStyle(
                    color: renkler.koyuBeyaz,
                    fontSize: 15,
                  ),
                ),
                Spacer(flex: 3),
              ],
            ),
          ),
          Spacer(flex: 1),
          Container(
            decoration: BoxDecoration(
                color: renkler.acikBackg,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
            width: size.width * 0.25,
            height: size.height * 0.11,
            child: Column(
              children: [
                Spacer(flex: 3),
                Icon(
                  IconlyBroken.time_circle,
                  color: renkler.turuncu4,
                  size: 35,
                ),
                Spacer(flex: 4),
                Text(
                  "150dk",
                  style: TextStyle(
                      color: renkler.beyaz,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                Spacer(flex: 1),
                Text(
                  "Zaman",
                  style: TextStyle(
                    color: renkler.koyuBeyaz,
                    fontSize: 15,
                  ),
                ),
                Spacer(flex: 3),
              ],
            ),
          ),
          Spacer(flex: 1),
          Container(
            decoration: BoxDecoration(
              color: renkler.acikBackg,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
            ),
            width: size.width * 0.25,
            height: size.height * 0.11,
            child: Column(
              children: [
                Spacer(flex: 3),
                Icon(
                  IconlyBroken.calendar,
                  color: renkler.turuncu4,
                  size: 35,
                ),
                Spacer(flex: 4),
                Text(
                  "2022",
                  style: TextStyle(
                      color: renkler.beyaz,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                Spacer(flex: 1),
                Text(
                  "Tarih",
                  style: TextStyle(
                    color: renkler.koyuBeyaz,
                    fontSize: 15,
                  ),
                ),
                Spacer(flex: 3),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class baslik extends StatelessWidget {
  const baslik({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Spacer(flex: 1),
          Text(
            "Avatar",
            style: TextStyle(
                color: renkler.beyaz,
                fontWeight: FontWeight.bold,
                fontSize: 22),
          ),
          Spacer(flex: 8),
        ],
      ),
    );
  }
}

class aciklama extends StatelessWidget {
  const aciklama({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.8,
      child: Row(
        children: [
          Flexible(
            child: SizedBox(
              width: size.width * 0.8,
              child: Text(
                "Avatar",
                style: TextStyle(
                  color: renkler.beyaz,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
