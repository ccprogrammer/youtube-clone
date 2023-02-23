import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_clone/homepage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(milliseconds: 1200),
      () => Get.to(() => const Homepage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              'assets/icons/icon-logo-bg.png',
              height: 80,
            ),
            ElasticInLeft(
              child: Image.asset(
                'assets/icons/icon-logo-play.png',
                width: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
