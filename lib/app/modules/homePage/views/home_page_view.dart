import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rumah_sakit/app/routes/app_pages.dart';
import 'package:rumah_sakit/model/darawer.dart';

import '../controllers/home_page_controller.dart';

class HomePageView extends GetView<HomePageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            titleSpacing: 20,
            toolbarHeight: 70,
            backgroundColor: Colors.white,
            foregroundColor: Colors.black87,
            title: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Selamat Datang,',
                    style: TextStyle(fontFamily: 'Poppins', fontSize: 12),
                  ),
                  GetBuilder<HomePageController>(
                      builder: (_) => controller.nama != null
                          ? Text(
                              '${controller.nama}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  fontFamily: 'Poppins'),
                              overflow: TextOverflow.ellipsis,
                            )
                          : Text(
                              'Pasien',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  fontFamily: 'Poppins'),
                              overflow: TextOverflow.ellipsis,
                            ))
                ],
              ),
            )),
        endDrawer: GetBuilder<HomePageController>(
          builder: (_) => DrawerWidget(
            nama: controller.nama,
            email: controller.email,
          ),
        ),
        body: RefreshIndicator(
          onRefresh: controller.onRefresh,
          child: ListView(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                width: double.infinity,
                child: FutureBuilder(
                  future: controller.timeNow(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    return Text(
                      '${controller.hari}, ${controller.tanggal} ${controller.bulan} ${controller.tahun}',
                      style: const TextStyle(
                        fontSize: 17,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    );
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                margin: const EdgeInsets.symmetric(horizontal: 15),
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GetBuilder<HomePageController>(
                          builder: (_) => controller.semuaPasien == null
                              ? Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  decoration: BoxDecoration(
                                      color: Colors.greenAccent,
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Colors.black26,
                                            offset: Offset(2, 4),
                                            blurRadius: 3.0)
                                      ]),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text(
                                        '0',
                                        style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Poppins',
                                            color: Colors.white),
                                      ),
                                      Text(
                                        'Jumlah Pasien',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            color: Colors.white),
                                      )
                                    ],
                                  ),
                                )
                              : Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  decoration: BoxDecoration(
                                      color: Colors.greenAccent,
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Colors.black26,
                                            offset: Offset(2, 4),
                                            blurRadius: 3.0)
                                      ]),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${controller.semuaPasien?.length}',
                                        style: const TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Poppins',
                                            color: Colors.white),
                                      ),
                                      const Text(
                                        'Jumlah Pasien',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            color: Colors.white),
                                      )
                                    ],
                                  ),
                                )),
                      // tengah
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.greenAccent,
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(2, 4),
                                  blurRadius: 3.0)
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Antrian ke',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                            GetBuilder<HomePageController>(
                                builder: (_) =>
                                    controller.semuaPasien!.length != 0
                                        ? Text(
                                            '${controller.semuaPasien![0]['antrian']}',
                                            style: const TextStyle(
                                                fontSize: 35,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Poppins',
                                                color: Colors.white),
                                          )
                                        : Text(
                                            '0',
                                            style: const TextStyle(
                                                fontSize: 35,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Poppins',
                                                color: Colors.white),
                                          ))
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                            color: Colors.greenAccent,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(2, 4),
                                  blurRadius: 3.0)
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FutureBuilder(
                              future: controller.getDataKamar(),
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
                                return controller.semuaKamar != null
                                    ? Text(
                                        '0/${controller.semuaKamar!.length}',
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Poppins'),
                                      )
                                    : const Text(
                                        '0',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Poppins'),
                                      );
                              },
                            ),
                            const Text(
                              'Jumlah kamar',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )
                          ],
                        ),
                      )
                    ]),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                      height: 170,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset(
                                'assets/images/hospital.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              width: 352,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.asset(
                                  'assets/images/pasien.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.all(15),
                                  primary: Colors.greenAccent,
                                  onPrimary: Colors.green,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  )),
                              onPressed: () {
                                Get.toNamed(Routes.PASIEN);
                              },
                              child: const Text(
                                'Menu Pasien',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'poppins'),
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  primary:
                                      const Color.fromARGB(255, 81, 214, 150),
                                  padding: const EdgeInsets.all(15)),
                              onPressed: () {
                                Get.toNamed(Routes.JADWAL_DOKTER);
                              },
                              child: const Text(
                                'jadwal praktek dokter',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'poppins'),
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.all(15),
                                primary:
                                    const Color.fromARGB(255, 56, 173, 117),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: () {},
                              child: const Text(
                                'data kamar inap',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'poppins'),
                              )),
                        ]),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
