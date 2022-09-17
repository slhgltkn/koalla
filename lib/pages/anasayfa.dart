import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class anasayfa extends StatelessWidget {
  const anasayfa({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(color: Colors.amber),
            child: Icon(
              IconlyBroken.search,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
