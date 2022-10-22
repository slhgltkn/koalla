import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:koalla/others/renkler.dart';
import 'package:koalla/pages/anasayfa.dart';
import 'package:koalla/pages/gamesScreen.dart';
import 'package:koalla/pages/search.dart';

class navBar extends StatefulWidget {
  navBar({super.key});

  @override
  State<navBar> createState() => _navBarState();
}

class _navBarState extends State<navBar> {
  int currentIndex = 0;
  List pages = [anasayfa(), Search(), profile()];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: renkler.acikBackg,
      selectedItemColor: renkler.turuncu3,
      unselectedItemColor: renkler.beyaz,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      iconSize: 27,
      currentIndex: currentIndex,
      onTap: ((index) => setState(() => currentIndex = index)),
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            IconlyBroken.home,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            IconlyBroken.search,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            IconlyBroken.game,
          ),
          label: '',
        ),
      ],
    );
  }
}
