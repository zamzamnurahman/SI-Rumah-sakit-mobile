import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rumah_sakit/api.dart';
import 'package:http/http.dart' as http;
import 'package:rumah_sakit/app/modules/homePage/controllers/home_page_controller.dart';
import 'package:rumah_sakit/app/routes/app_pages.dart';

class TambahPasienController extends GetxController {
  RxString isGender = 'jenis kelamin'.obs;
  RxString isjenisPemeriksaan = 'jenis pemeriksaan'.obs;
  int pj_antrian = int.parse(Get.arguments);
  var id = Get.put<HomePageController>(HomePageController()).id;
  var nama = TextEditingController();
  var no_telp = TextEditingController();
  var tanggal_lahir = TextEditingController();
  var alamat = TextEditingController();
  var keluhan = TextEditingController();
  var j_pengobatan = TextEditingController();

  Future tambahPasien() async {
    Uri url = Uri.parse(localApi + 'addData.php');

    if (nama.text != '' && alamat.text != '' && keluhan.text != '') {
      pj_antrian++;
      var response = await http.post(url, body: {
        "nama_pasien": nama.text,
        "jenis_kelamin": isGender.value,
        "no_telp": no_telp.text,
        "tanggal_lahir": tanggal_lahir.text,
        "alamat": alamat.text,
        "keluhan": keluhan.text,
        "jenis_pemeriksaan": isjenisPemeriksaan.value,
        "jenis_pengobatan": '0',
        "id_user": '$id',
        "antrian": '${pj_antrian}',
      });

      if (response.statusCode == 200) {
        print('berhasil tambah pasien');
        Get.back();
        Get.snackbar('Berhasil Check-in', 'Pasien harap tunggu sesuai antrian');
        print(response.body);
      } else {
        print(response.statusCode);
        print(response.body);
      }
    } else {
      Get.snackbar("Gagal Check-in", 'Harap isi semua Formulir');
    }
  }

  final count = 0.obs;
  @override
  void onInit() {
    nama;
    no_telp;
    tanggal_lahir;
    alamat;
    keluhan;
    j_pengobatan;
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
