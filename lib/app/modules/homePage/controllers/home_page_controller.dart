import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:rumah_sakit/api.dart';

class HomePageController extends GetxController {
  Future onRefresh() async {
    await Future.delayed(Duration(milliseconds: 1000), () {
      getDataPasien();
      getDataKamar();
      update();
    });
  }

  var id = Get.arguments ?? null;

  DateTime now = DateTime.now();
  String? hari;
  String? tanggal;
  String? bulan;
  String? tahun;
  timeNow() async {
    hari = DateFormat.EEEE().format(now);
    tanggal = DateFormat.d().format(now);
    bulan = DateFormat.MMM().format(now);
    tahun = DateFormat.y().format(now);
    print('$hari $bulan $tahun');
  }

  String? nama;
  String? email;
  getDataUser_id() async {
    Uri url = Uri.parse('${localApi}getdataUser_id.php?id=' + id);
    print(id);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      nama = data['nama'];
      email = data['email'];
    } else {
      throw 'error get data user id';
    }
    update();
  }

  List? semuaPasien;
  getDataPasien() async {
    Uri url = Uri.parse(localApi + 'getDataPasien.php');

    final response = await http.get(url);
    print(response.statusCode);

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

  List? semuaKamar;
  Future getDataKamar() async {
    Uri url = Uri.parse(localApi + 'getDataKamar.php');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      List? semuaDataKamar = (json.decode(response.body));
      List? allKamar = [];

      semuaDataKamar?.forEach((element) {
        allKamar.add(element);
      });

      semuaKamar = allKamar;
      return allKamar;
    }
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getDataUser_id();
    getDataPasien();
  }

  @override
  void onReady() {
    super.onReady();
    getDataUser_id();
    getDataPasien();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
