import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: const Color(0xff64DDBB),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/dokter.png',
            width: 120,
          ),
          const Text(
            'Sistem Informasi\nrumah sakit',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
          LoadingAnimationWidget.staggeredDotsWave(
              color: Colors.white, size: 30)
        ],
      ),
    ));
  }
}
