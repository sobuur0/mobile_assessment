import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobile_assessment/constants/colors.dart';
import 'package:mobile_assessment/pages/sign_up_page.dart';

class SplashPage extends StatefulWidget {
  static String routeName = '/splashScren';

  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void splash() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const SignUpPage(),
        ),
        (route) => false,
      );
    });
  }

  @override
  void initState() {
    super.initState();
    splash();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kHeaderTextColor,
      body: Center(
        child: Text(
          "Saocorp",
          style: TextStyle(
            color: Colors.white,
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
