import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rumah_sakit/api.dart';
import 'package:rumah_sakit/app/modules/homePage/controllers/home_page_controller.dart';

class PasienController extends GetxController {
  var id = Get.put<HomePageController>(HomePageController()).id;
  Future onRefresh() async {
    await Future.delayed(Duration(milliseconds: 1000), () {
      getDataPasien();
      update();
    });
  }

  List? semuaPasien;
  getDataPasien() async {
    Uri url = Uri.parse(localApi + 'getDataPasien.php');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      List? semuaDataPasien = (json.decode(response.body));
      List? allPasien = [];

      semuaDataPasien!.forEach((element) {
        allPasien.add(element);
      });

      semuaPasien = allPasien;
      
    }
    update();
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    getDataPasien();
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
