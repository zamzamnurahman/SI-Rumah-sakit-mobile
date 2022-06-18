import 'dart:async';
import 'package:get/get.dart';
import 'package:rumah_sakit/app/routes/app_pages.dart';

class SplashScreenController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    loading();
  }

  Future<void> loading() async {
    Timer(Duration(seconds: 5), () {
      Get.offAndToNamed(Routes.LOGIN);
    });
  }
}
