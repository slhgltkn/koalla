import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:koalla/others/renkler.dart';
import 'package:koalla/pages/anasayfa.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    final ref = FirebaseDatabase.instance.ref().child('movies');
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: renkler.arkaPlan,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: size.height * 0.05),
            UstTaraf(),
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
            aciklama(),
            Container(
              width: size.width * 1,
              height: size.height * 1,
              child: WebView(
                javascriptMode: JavascriptMode.unrestricted,
                initialUrl: 'https://vidmoxy.com/f/v1xf335d6b8?vst=1',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UstTaraf extends StatelessWidget {
  const UstTaraf({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(flex: 1),
        backButton(),
        Spacer(flex: 2),
        logo(),
        Spacer(flex: 5),
      ],
    );
  }
}

class backButton extends StatelessWidget {
  const backButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      highlightColor: renkler.seffaf,
      focusColor: renkler.seffaf,
      splashColor: renkler.seffaf,
      disabledColor: renkler.seffaf,
      hoverColor: renkler.seffaf,
      onPressed: () => Navigator.pop(context),
      icon: Icon(
        IconlyLight.arrow_left,
        size: 30,
        color: renkler.beyaz,
      ),
    );
  }
}

class resim extends StatefulWidget {
  const resim({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<resim> createState() => _resimState();
}

class _resimState extends State<resim> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: renkler.acikGri,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), bottomLeft: Radius.circular(40))),
      width: widget.size.width * 0.55,
      height: widget.size.height * 0.45,
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
                height: widget.size.height * 0.25,
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

class kenarcontainer extends StatefulWidget {
  const kenarcontainer({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<kenarcontainer> createState() => _kenarcontainerState();
}

class _kenarcontainerState extends State<kenarcontainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.size.height * 0.45,
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
            width: widget.size.width * 0.25,
            height: widget.size.height * 0.135,
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
                    fontSize: 14,
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
            width: widget.size.width * 0.25,
            height: widget.size.height * 0.135,
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
                    fontSize: 14,
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
            width: widget.size.width * 0.25,
            height: widget.size.height * 0.135,
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
                    fontSize: 14,
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

class baslik extends StatefulWidget {
  const baslik({super.key});

  @override
  State<baslik> createState() => _baslikState();
}

class _baslikState extends State<baslik> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Spacer(flex: 1),
          Text(
            "Başlık",
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

class aciklama extends StatefulWidget {
  const aciklama({super.key});

  @override
  State<aciklama> createState() => _aciklamaState();
}

class _aciklamaState extends State<aciklama> {
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
                "Açıklama",
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
