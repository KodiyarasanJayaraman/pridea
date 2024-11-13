import 'package:flutter/material.dart';
import 'package:pridea/home_screen.dart';
import 'package:pridea/widgets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [
              .0,
              0.0,
              0.0,
              1
            ],
                colors: [
              HexColor("#1B2047"),
              HexColor("#030A49CC").withOpacity(.8),
              HexColor("#030A49CC").withOpacity(.8),
              HexColor("#2C2D57"),
            ])),
        alignment: Alignment.center,
        child: Image.asset(
          'assets/logo.png',
          scale: 2.3,
        ),
      ),
    );
  }
}
