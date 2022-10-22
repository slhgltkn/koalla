import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_launcher_icons/main.dart';
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

/*Future queryData(String queryString) async {
  return FirebaseDatabase.instance.ref('movies');
}*/

class Search extends StatefulWidget {
  Search({
    super.key,
  });

  @override
  State<Search> createState() => SsearchState();
}

class SsearchState extends State<Search> {
  TextEditingController editingController = TextEditingController();

  String SName = '';

  @override
  Widget build(BuildContext context) {
    FirebaseDatabase.instance.ref().child('movies');

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: navBar(),
      backgroundColor: renkler.arkaPlan,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: size.height * 0.065),
            logo(),
            SizedBox(height: size.height * 0.04),
            aramaButon(size: size, editingController: editingController),
            Container(
              width: size.width * 0.85,
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(''),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class aramaButon extends StatelessWidget {
  const aramaButon({
    Key? key,
    required this.size,
    required this.editingController,
  }) : super(key: key);

  final Size size;
  final TextEditingController editingController;

  @override
  Widget build(BuildContext context) {
    return Center(
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
    );
  }
}
