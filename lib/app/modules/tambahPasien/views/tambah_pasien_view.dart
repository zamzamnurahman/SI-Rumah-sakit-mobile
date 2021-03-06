import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tambah_pasien_controller.dart';

class TambahPasienView extends GetView<TambahPasienController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.greenAccent,
          title: const Text('Check-in Rawat'),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            Image.asset(
              'assets/images/pasien.jpg',
              width: 150,
              height: 150,
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.13,
              ),
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Text(
                      "Check In",
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Data Diri",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: controller.nama,
                    decoration: InputDecoration(
                      hintText: 'Nama Lengkap',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(15)),
                    child: Obx(
                      () => DropdownButton<String>(
                        alignment: Alignment.centerLeft,
                        isExpanded: true,
                        isDense: true,
                        borderRadius: BorderRadius.circular(15),
                        items: const <DropdownMenuItem<String>>[
                          DropdownMenuItem(
                            enabled: false,
                            child: Text(
                              'Pilih Jenis Kelamin',
                            ),
                            value: 'jenis kelamin',
                          ),
                          DropdownMenuItem(
                            child: Text('Laki-laki'),
                            value: 'laki-laki',
                          ),
                          DropdownMenuItem<String>(
                            value: 'Perempuan',
                            child: Text('Perempuan'),
                          ),
                        ],
                        value: controller.isGender.value,
                        hint: Text('jenis kelamin'),
                        onChanged: (value) {
                          controller.isGender.value = value!;
                          print(controller.isGender.value);
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    keyboardType: TextInputType.phone,
                    controller: controller.no_telp,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      hintText: 'No Telepon',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: controller.tanggal_lahir,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        hintText: '(yyyy-mm-dd)',
                        labelText: 'Tanggal Lahir'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: controller.alamat,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        hintText: 'Alamat'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.13,
              ),
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Keluhan",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: controller.keluhan,
                    maxLines: 5,
                    decoration: InputDecoration(
                      hintText: 'isi keluhan anda secara jelas..',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(15)),
                    child: Obx(
                      () => DropdownButton<String>(
                        alignment: Alignment.centerLeft,
                        isExpanded: true,
                        isDense: true,
                        borderRadius: BorderRadius.circular(15),
                        items: const <DropdownMenuItem<String>>[
                          DropdownMenuItem(
                            enabled: false,
                            child: Text(
                              'Pilih Jenis Pemeriksaan',
                            ),
                            value: 'jenis pemeriksaan',
                          ),
                          DropdownMenuItem(
                            child: Text('Pemeriksaan Umum'),
                            value: '0',
                          ),
                          DropdownMenuItem<String>(
                            child: Text('Pemeriksaan Khusus'),
                            value: '1',
                          ),
                          DropdownMenuItem<String>(
                            child: Text('Pemeriksaan Darurat'),
                            value: '2',
                          ),
                        ],
                        value: controller.isjenisPemeriksaan.value,
                        hint: Text('jenis Pemeriksaan'),
                        onChanged: (value) {
                          controller.isjenisPemeriksaan.value = value!;
                          print(controller.isjenisPemeriksaan.value);
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        controller.tambahPasien();
                      },
                      child: const Text(
                        'Check In',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.greenAccent)),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
