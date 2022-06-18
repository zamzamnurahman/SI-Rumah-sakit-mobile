import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rumah_sakit/api.dart';
import 'package:rumah_sakit/app/routes/app_pages.dart';

class SignUpController extends GetxController {
  TextEditingController nama = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  Future signUp() async {
    Uri url = Uri.parse(localApi + 'signUp.php');

    print(nama.text);
    if (nama.text == '' && email.text == '' && pass.text == '') {
      Get.snackbar("Gagal Daftar", "isi Form di bawah terlebih dahulu");
      print('tidak boleh kosong');
    } else {
      final response = await http.post(url, body: {
        'nama_user': nama.text,
        'email': email.text,
        'password': pass.text,
      });
      if (response.statusCode == 200) {
        // print('berhasil daftar');
        Get.snackbar("Berhasil", "Daftar, silahkan Login");
        Get.offAllNamed(Routes.LOGIN);
      } else {
        print(response.statusCode);
      }
    }
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
