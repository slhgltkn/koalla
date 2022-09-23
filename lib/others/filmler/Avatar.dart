import 'package:flutter/material.dart';
import 'package:koalla/others/renkler.dart';
import 'package:koalla/pages/anasayfa.dart';

class avatarCard extends StatelessWidget {
  const avatarCard({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.38,
      height: size.height * 0.3,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25), color: renkler.acikBackg),
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
                  "https://upload.wikimedia.org/wikipedia/tr/1/12/Avatar-Film-Posteri.jpg",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text("Avatar"),
        ],
      ),
    );
  }
}
