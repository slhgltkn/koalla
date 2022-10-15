import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:koalla/others/filmler/Avatar.dart';
import 'package:koalla/others/renkler.dart';
import 'package:koalla/others/API.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:koalla/pages/anasayfa.dart';
import 'package:koalla/pages/details.dart';
import 'package:koalla/pages/filmler.dart';
import 'package:flutter/src/rendering/box.dart';
import 'package:koalla/pages/search.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

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
            SizedBox(height: size.height * 0.08),
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
  var date;
  var rate;
  var time;
  var name;
  var details;
  var image;

  /*final ref = FirebaseDatabase.instance.ref().child('movies');

  Future<void> GetData() async {
    final response = await ref.get();
    if (response.value != null) {
      //Map<String, dynamic> data = response.value as Map<String, dynamic>;
      //Map<String, dynamic>;
      //name = response.value[0]['name'];
      //Map<String, dynamic> value =
      //Map<String, dynamic>.from(response.value as Map);

      //setState(() {});
      print(response.value ?? [0]);
      //name = response.value['0']['name'];

      /*name = response.value ?? [name];
      date = response.value ?? [date];
      time = response.value ?? [time];
      details = response.value ?? [details];
      rate = response.value ?? [rate];*/
      //name = response.value[0]['name'];
      //name = response[0].value["name"];
    }
  }

  /*Future<void> GetData() async {
    final ref = FirebaseDatabase.instance.ref('movies');
    final snapshot = await ref.child('movies').get();
    if (snapshot.exists) {
      print(snapshot.value);
    } else {
      print('No data available.');
    }
  }

  @override
  void initState() {
    super.initState();
    GetData();
  }*/*/

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size.width * 0.9,
      height: widget.size.height * 0.25,
      decoration: BoxDecoration(
        color: renkler.acikBackg,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          SizedBox(width: widget.size.width * 0.05),
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image(
              width: widget.size.width * 0.25,
              image: NetworkImage(
                  "https://upload.wikimedia.org/wikipedia/tr/1/12/Avatar-Film-Posteri.jpg"),
            ),
          ),
          Container(
            width: widget.size.width * 0.6,
            child: Column(
              children: [
                SizedBox(height: widget.size.height * 0.02),
                Text(
                  'name',
                  style: TextStyle(
                      color: renkler.beyaz,
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                ),
                SizedBox(height: widget.size.height * 0.015),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Spacer(flex: 1),
                    Text(
                      'date',
                      style: TextStyle(
                          color: renkler.beyaz,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Spacer(flex: 1),
                    Text(
                      "rate",
                      style: TextStyle(
                          color: renkler.beyaz,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Spacer(flex: 1),
                    Text(
                      "time",
                      style: TextStyle(
                          color: renkler.beyaz,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Spacer(flex: 1),
                  ],
                ),
                SizedBox(height: widget.size.height * 0.02),
                Container(
                  width: widget.size.width * 0.5,
                  child: Text(
                    "details",
                    style: TextStyle(color: renkler.beyaz, fontSize: 13),
                  ),
                ),
                SizedBox(height: widget.size.height * 0.012),
                InkWell(
                  onTap: (() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Details(),
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
