import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rumah_sakit/api.dart';
import 'package:rumah_sakit/app/routes/app_pages.dart';

class LoginController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  Future login() async {
    Uri url = Uri.parse(localApi + 'getDataUser.php');

    if (email.text != '' && pass.text != '') {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List semuadataUser = (json.decode(response.body));
        List? alluser = [];
        List? alluserEmail = [];
        List? alluserPass = [];

        semuadataUser.forEach((element) {
          alluser.add(element);
          alluserEmail.add(element['email']);
          alluserPass.add(element['password']);
        });
        var id;
        for (var i = 0; i < semuadataUser.length; i++) {
          if (alluserEmail[i] == email.text && alluserPass[i] == pass.text) {
            id = alluser[i]['id'];
          }
        }

        var cekEmail = alluserEmail.contains(email.text);
        var cekPass = alluserPass.contains(pass.text);
        print(alluserEmail);
        print(email.text);
        print(alluserPass);
        print(pass.text);
        if (cekEmail == true && cekPass == true) {
          print('Berhasil login');
          Get.offAllNamed(Routes.HOME_PAGE, arguments: id);
        } else {
          Get.snackbar("Gagal Login", "email dan Password salah");
          print('user belum terdaftar');
        }
      } else {
        throw 'gagal';
      }
    } else {
      Get.snackbar("Information", "Isi email dan password terlebih dahulu");
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
