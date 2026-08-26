import 'dart:async';

import 'package:flutter/material.dart';

import 'package:testapp/controal_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
   static const Color darkBlue = Color(0xFF112B4A);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () {
        if (!mounted) return;
          
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => ControllerScreen (),
          ),
        );
      
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:darkBlue,
      body: Center(
        child: Image.asset('assets/logo.png'),
      ),
    );
  }
}
