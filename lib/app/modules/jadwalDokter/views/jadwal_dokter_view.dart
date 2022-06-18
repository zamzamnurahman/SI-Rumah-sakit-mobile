import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/jadwal_dokter_controller.dart';

class JadwalDokterView extends GetView<JadwalDokterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Jadwal Dokter'),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Obx(() => IndexedStack(
                  index: controller.tabIndex.value,
                  children: [
                    Container(
                        margin: EdgeInsets.only(top: 70),
                        child: jadwalDokter()),
                    Container(
                        margin: EdgeInsets.only(top: 70),
                        child: jadwalDokter()),
                    Container(
                        margin: EdgeInsets.only(top: 70),
                        child: jadwalDokter()),
                    Container(
                        margin: EdgeInsets.only(top: 70),
                        child: jadwalDokter()),
                    Container(
                        margin: EdgeInsets.only(top: 70),
                        child: jadwalDokter()),
                    Container(
                        margin: EdgeInsets.only(top: 70),
                        child: jadwalDokter()),
                  ],
                )),
            Container(
              margin: EdgeInsets.all(15),
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  InkWell(
                      onTap: () {
                        controller.getDataDokter('1');
                        controller.tabIndex.value = 0;
                      },
                      child: hari('Senin', 0)),
                  InkWell(
                      onTap: () {
                        controller.getDataDokter('2');
                        controller.tabIndex.value = 1;
                      },
                      child: hari('Selasa', 1)),
                  InkWell(
                      onTap: () {
                        controller.getDataDokter('3');
                        controller.tabIndex.value = 2;
                      },
                      child: hari('Rabu', 2)),
                  InkWell(
                      onTap: () {
                        controller.getDataDokter('4');
                        controller.tabIndex.value = 3;
                      },
                      child: hari('Kamis', 3)),
                  InkWell(
                      onTap: () {
                        controller.getDataDokter('5');
                        controller.tabIndex.value = 4;
                      },
                      child: hari('Jumat', 4)),
                  InkWell(
                      onTap: () {
                        controller.getDataDokter('6');
                        controller.tabIndex.value = 5;
                      },
                      child: hari('Sabtu', 5)),
                ],
              ),
            ),
          ],
        ));
  }

  GetBuilder jadwalDokter() {
    return GetBuilder<JadwalDokterController>(
      builder: (_) {
        return controller.semuaDokter != null
            ? ListView.builder(
                itemCount: controller.semuaDokter!.length,
                itemBuilder: (context, index) => Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(2, 3),
                        blurRadius: 5,
                      )
                    ],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) =>
                              profileDokter(controller.semuaDokter![index]));
                    },
                    minVerticalPadding: 35,
                    leading: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                            '${controller.semuaDokter![index]['image']}')),
                    title: Text(
                      "${controller.semuaDokter?[index]['nama']}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                            '${controller.semuaDokter![index]['alamat'].toString().toUpperCase()}'),
                        SizedBox(
                          height: 3,
                        ),
                        Text('${controller.semuaDokter![index]['jadwal']}')
                      ],
                    ),
                    trailing: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          controller.semuaDokter![index]['jenis kelamin'] ==
                                  'laki-laki'
                              ? Icon(
                                  Icons.person,
                                  color: Colors.green,
                                )
                              : Icon(
                                  Icons.person,
                                  color: Colors.pink,
                                ),
                          Text(
                              "Dokter ${controller.semuaDokter![index]['jenis dokter']}"),
                        ]),
                  ),
                ),
              )
            : Center(child: Text('Tidak ditemukan'));
      },
    );
  }

  AlertDialog profileDokter(Map<String, dynamic>? dokter) {
    return AlertDialog(
      title: Column(
        children: [
          CircleAvatar(
            radius: 60,
            backgroundImage: NetworkImage("${dokter!['image']}"),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            dokter['nama'],
          ),
          Text(
            "Dokter " + dokter['jenis dokter'],
            style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
          ),
        ],
      ),
      content: Text(
        "${dokter['alamat'].toString().toUpperCase()}\n no.telepon : ${dokter['no telp']} \n${dokter['jadwal']}",
        textAlign: TextAlign.center,
      ),
    );
  }

  Card hari(String? hari, int? index) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 3,
        child: Obx(
          () => Container(
              decoration: BoxDecoration(
                  color: index == controller.tabIndex.value
                      ? Colors.green
                      : Colors.white,
                  borderRadius: BorderRadius.circular(15)),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Center(
                  child: Text(
                "$hari",
                style: TextStyle(
                  color: index == controller.tabIndex.value
                      ? Colors.white
                      : Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
              ))),
        ));
  }
}
