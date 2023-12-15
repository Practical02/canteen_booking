import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:canteen_booking/consent/colors.dart';
import 'package:canteen_booking/screen/login.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset('images/icon.png'),
      title: Text(
        'Christ Canteen',
        style: TextStyle(
          color: Colors.blue,
          fontFamily: 'ro',
          fontSize: 19,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: background,
      showLoader: true,
      loaderColor: Colors.blue,
      navigator: Login(),
      durationInSeconds: 3,
    );
  }
}
