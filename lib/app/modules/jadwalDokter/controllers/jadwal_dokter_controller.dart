import 'dart:convert';

import 'package:get/get.dart';
import 'package:rumah_sakit/api.dart';
import 'package:http/http.dart' as http;

class JadwalDokterController extends GetxController {
  var tabIndex = 0.obs;

  List? semuaDokter;
  getDataDokter(String? id) async {
    Uri url = Uri.parse(localApi + "getDataDokter.php?id=$id");

    var response = await http.get(url);
    // print(response.body);

    if (response.statusCode == 200) {
      List? result = json.decode(response.body);
      List? inresult = [];

      result!.forEach((element) {
        inresult.add(element);
      });
      semuaDokter = inresult;
    }
    update();
  }

  final count = 0.obs;
  @override
  void onInit() {
    getDataDokter('1');
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
