import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconly/iconly.dart';
import 'package:koalla/others/renkler.dart';
import 'package:koalla/pages/WebViewVideo.dart';
import 'package:koalla/pages/anasayfa.dart';
import 'package:webview_flutter/webview_flutter.dart';

final ref = FirebaseDatabase.instance.ref().child('movies');

class Details extends StatefulWidget {
  Details({
    required this.date,
    required this.imdbPuan,
    required this.time,
    required this.image,
    required this.name,
    required this.link,
    required this.details,
  });
  final String details;
  final String imdbPuan;
  final String time;
  final String date;
  final String image;
  final String name;
  final String link;

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    SystemUiOverlayStyle(
      statusBarColor: renkler.arkaPlan,
      systemNavigationBarColor: renkler.arkaPlan,
    );
    final ref = FirebaseDatabase.instance.ref().child('movies');
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: renkler.arkaPlan,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: size.height * 0.075),
            UstTaraf(),
            SizedBox(height: size.height * 0.05),
            Row(
              children: [
                Spacer(flex: 1),
                resim(
                  link: widget.link,
                  size: size,
                  image: widget.image,
                ),
                kenarcontainer(
                  size: size,
                  date: widget.date,
                  rate: widget.imdbPuan,
                  time: widget.time,
                ),
                Spacer(flex: 1),
              ],
            ),
            SizedBox(height: size.height * 0.05),
            baslik(
              name: widget.name,
            ),
            SizedBox(height: size.height * 0.03),
            aciklama(
              details: widget.details,
            ),
            /*Container(
              width: size.width * 1,
              height: size.height * 1,
              child: WebView(
                javascriptMode: JavascriptMode.unrestricted,
                initialUrl: 'https://vidmoxy.com/f/v1xf335d6b8?vst=1',
              ),
            ),*/
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
  resim({
    Key? key,
    required this.size,
    required this.image,
    required this.link,
  }) : super(key: key);

  final Size size;
  final String link;
  final String image;

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
                widget.image,
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
            onTap: (() {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => webViewVideo(link: widget.link),
                ),
              );
            }),
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
    required this.date,
    required this.rate,
    required this.time,
    required this.size,
  }) : super(key: key);

  final Size size;
  final String date;
  final String rate;
  final String time;

  @override
  State<kenarcontainer> createState() => _kenarcontainerState();
}

class _kenarcontainerState extends State<kenarcontainer> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
              children: [
                Spacer(flex: 3),
                Icon(
                  IconlyBroken.star,
                  color: renkler.turuncu4,
                  size: 35,
                ),
                Spacer(flex: 4),
                Text(
                  widget.rate,
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
                bottomRight: Radius.circular(30),
              ),
            ),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.time,
                      style: TextStyle(
                          color: renkler.beyaz,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: size.width * 0.01),
                    Text(
                      'dk',
                      style: TextStyle(
                          color: renkler.beyaz,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
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
                  widget.date,
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

class baslik extends StatelessWidget {
  const baslik({
    super.key,
    required this.name,
  });
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          name,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: renkler.beyaz,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
    );
  }
}

class aciklama extends StatelessWidget {
  const aciklama({
    super.key,
    required this.details,
  });
  final String details;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(
          left: size.width * 0.1,
          right: size.width * 0.1,
          bottom: size.height * 0.04),
      child: Text(
        details,
        textAlign: TextAlign.left,
        style: TextStyle(
          color: renkler.beyaz,
          fontSize: 16,
          height: 1.32,
        ),
      ),
    );
  }
}
