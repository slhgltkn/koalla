import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:koalla/others/renkler.dart';

class anasayfa extends StatelessWidget {
  const anasayfa({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: renkler.arkaPlan,
      body: Column(
        children: [
          SizedBox(height: size.height * 0.04),
          Row(
            children: [
              SizedBox(width: size.width * 0.05),
              logo(),
              SizedBox(width: size.width * 0.45),
              searchBox(),
            ],
          ),
          SizedBox(height: size.height * 0.06),
          Container(
            width: 450,
            height: 225,
            decoration: BoxDecoration(
              color: renkler.acikGri,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              children: [
                SizedBox(width: 25),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image(
                    width: 125,
                    image: NetworkImage(
                        "https://upload.wikimedia.org/wikipedia/tr/1/12/Avatar-Film-Posteri.jpg"),
                  ),
                ),
                Container(
                  width: 300,
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Text(
                        "Avatar",
                        style: TextStyle(
                            color: renkler.beyaz,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                      SizedBox(height: 15),
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
                            "165dk",
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
                      SizedBox(height: 15),
                      Container(
                        width: 265,
                        child: Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the...",
                          style: TextStyle(color: renkler.beyaz, fontSize: 13),
                        ),
                      ),
                      SizedBox(height: 13),
                      Row(
                        children: [
                          SizedBox(width: 16),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                      )
                    ],
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

class searchBox extends StatelessWidget {
  const searchBox({
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
