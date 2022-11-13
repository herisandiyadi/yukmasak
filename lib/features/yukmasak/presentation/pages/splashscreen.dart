import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double opacityLevel = 1.0;

  Future<Timer> splashScreenStart() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, () {
      Navigator.of(context).pushReplacementNamed('/homepage');
    });
  }

  @override
  void initState() {
    splashScreenStart();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: size.width * 0.5,
              height: size.height * 0.5,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/yukmasak_logos.png'))),
            )
          ],
        ),
      ),
    );
  }
}
