import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:koalla/others/renkler.dart';
import 'package:koalla/pages/anasayfa.dart';
import 'package:koalla/pages/auth/register.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => LloginState();
}

class LloginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    TextEditingController editingController = TextEditingController();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: renkler.arkaPlan,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: size.height * 0.1),
            Center(child: logo()),
            SizedBox(height: size.height * 0.1),
            mail(size: size),
            SizedBox(height: size.height * 0.02),
            password(size: size),
            SizedBox(height: size.height * 0.035),
            uyeOl(),
            SizedBox(height: size.height * 0.055),
            loginButton(size: size),
          ],
        ),
      ),
    );
  }
}

class loginButton extends StatelessWidget {
  const loginButton({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(25),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => anasayfa()),
        );
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
          'Giriş Yap',
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

class uyeOl extends StatelessWidget {
  const uyeOl({
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
          MaterialPageRoute(builder: (context) => Register()),
        );
      },
      child: Text(
        'Hâlâ üye değil misiniz?                    Üye Ol',
        style: TextStyle(color: renkler.beyaz, fontSize: 15),
      ),
    );
  }
}

class password extends StatelessWidget {
  const password({
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
        textInputAction: TextInputAction.done,
        style: TextStyle(color: renkler.beyaz),
        textAlign: TextAlign.left,
        cursorColor: renkler.beyaz,
        obscureText: true,
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

class mail extends StatelessWidget {
  const mail({
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
