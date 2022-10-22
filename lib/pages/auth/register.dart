import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:koalla/others/renkler.dart';
import 'package:koalla/pages/anasayfa.dart';
import 'package:koalla/pages/auth/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

TextEditingController t1 = TextEditingController();
TextEditingController t2 = TextEditingController();

kayitOl() {
  FirebaseAuth.instance
      .createUserWithEmailAndPassword(email: t1.text, password: t2.text);
}

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: renkler.arkaPlan,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: size.height * 0.1),
            Center(child: logo()),
            SizedBox(height: size.height * 0.1),
            mailR(size: size),
            SizedBox(height: size.height * 0.02),
            passwordR(size: size),
            SizedBox(height: size.height * 0.035),
            girisYap(),
            SizedBox(height: size.height * 0.055),
            registerButton(size: size),
          ],
        ),
      ),
    );
  }
}

class girisYap extends StatelessWidget {
  const girisYap({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusColor: renkler.seffaf,
      hoverColor: renkler.seffaf,
      splashColor: renkler.seffaf,
      highlightColor: renkler.seffaf,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Login()),
        );
      },
      child: Text(
        '                                                       Giriş Yap',
        style: TextStyle(color: renkler.beyaz, fontSize: 15),
      ),
    );
  }
}

class registerButton extends StatelessWidget {
  const registerButton({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(25),
      onTap: () {
        kayitOl();
      },
      child: Container(
        width: size.width * 0.75,
        height: size.height * 0.075,
        decoration: BoxDecoration(
          color: renkler.turuncu2,
          borderRadius: BorderRadius.circular(25),
        ),
        alignment: Alignment.center,
        child: Text(
          'Kayıt Ol',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: renkler.beyaz,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}

class passwordR extends StatelessWidget {
  const passwordR({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.85,
      decoration: BoxDecoration(
        color: renkler.acikBackg,
        borderRadius: BorderRadius.circular(23),
      ),
      child: TextField(
        controller: t2,
        obscureText: true,
        textInputAction: TextInputAction.next,
        style: TextStyle(color: renkler.beyaz),
        textAlign: TextAlign.left,
        cursorColor: renkler.beyaz,
        decoration: InputDecoration(
          filled: true,
          labelText: "Şifre",
          labelStyle: TextStyle(color: renkler.beyaz),
          hintText: "Şifre",
          hintStyle: TextStyle(color: renkler.beyaz),
          prefixIcon: Icon(
            IconlyBroken.lock,
            color: renkler.beyaz,
            size: 26,
          ),
          iconColor: renkler.beyaz,
          fillColor: renkler.acikBackg,
          hoverColor: renkler.beyaz,
          prefixIconColor: renkler.beyaz,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: renkler.acikGri),
            borderRadius: BorderRadius.all(
              Radius.circular(23),
            ),
          ),
          focusColor: renkler.turuncu1,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: renkler.turuncu1),
            borderRadius: BorderRadius.all(
              Radius.circular(23),
            ),
          ),
        ),
      ),
    );
  }
}

class mailR extends StatelessWidget {
  const mailR({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.85,
      decoration: BoxDecoration(
          color: renkler.acikBackg, borderRadius: BorderRadius.circular(23)),
      child: TextField(
        controller: t1,
        textInputAction: TextInputAction.next,
        style: TextStyle(color: renkler.beyaz),
        textAlign: TextAlign.left,
        cursorColor: renkler.beyaz,
        onChanged: (value) {},
        decoration: InputDecoration(
          filled: true,
          labelText: "E-Mail",
          labelStyle: TextStyle(color: renkler.beyaz),
          hintText: "E-Mail",
          hintStyle: TextStyle(color: renkler.beyaz),
          prefixIcon: Icon(
            IconlyBroken.profile,
            color: renkler.beyaz,
            size: 26,
          ),
          iconColor: renkler.beyaz,
          fillColor: renkler.acikBackg,
          hoverColor: renkler.beyaz,
          prefixIconColor: renkler.beyaz,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: renkler.acikGri),
            borderRadius: BorderRadius.all(
              Radius.circular(23),
            ),
          ),
          focusColor: renkler.turuncu1,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: renkler.turuncu1),
            borderRadius: BorderRadius.all(
              Radius.circular(23),
            ),
          ),
        ),
      ),
    );
  }
}
