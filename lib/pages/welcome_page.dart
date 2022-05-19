import 'package:flutter/material.dart';
import 'package:mobile_assessment/constants/colors.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Welcome to Saocorp',
          style: TextStyle(
            color: kHeaderTextColor,
            fontSize: 28.0,
          ),
        ),
      ),
    );
  }
}
