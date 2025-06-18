import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:whatsappui/appbar.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState(){
    super.initState();
    Future.delayed(Duration(seconds: 3),(){
Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AppBarex()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Lottie.asset("assets/splash.json"))
        ],
      ),
    );
  }
}