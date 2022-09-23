import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:koalla/others/renkler.dart';

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
            SizedBox(height: size.height * 0.11),
            Row(
              children: [
                Spacer(flex: 1),
                Container(
                  decoration: BoxDecoration(
                      color: renkler.acikGri,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          bottomLeft: Radius.circular(40))),
                  width: size.width * 0.5,
                  height: size.height * 0.35,
                  child: ClipRRect(
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
                ),
                Container(
                  height: size.height * 0.35,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: renkler.acikGri,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          ),
                        ),
                        width: size.width * 0.25,
                        height: size.height * 0.11,
                        child: Column(
                          children: [
                            Icon(
                              IconlyBroken.star,
                              color: Colors.yellow,
                            ),
                            Text("8.6"),
                            Text("Puan"),
                          ],
                        ),
                      ),
                      Spacer(flex: 1),
                      Container(
                        decoration: BoxDecoration(
                            color: renkler.acikGri,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30),
                                bottomRight: Radius.circular(30))),
                        width: size.width * 0.25,
                        height: size.height * 0.11,
                      ),
                      Spacer(flex: 1),
                      Container(
                        decoration: BoxDecoration(
                          color: renkler.acikGri,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              bottomRight: Radius.circular(30)),
                        ),
                        width: size.width * 0.25,
                        height: size.height * 0.11,
                      ),
                    ],
                  ),
                ),
                Spacer(flex: 1),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
