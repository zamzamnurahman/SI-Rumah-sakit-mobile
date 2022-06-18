import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:rumah_sakit/app/routes/app_pages.dart';

import '../controllers/pasien_controller.dart';

class PasienView extends GetView<PasienController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  controller.getDataPasien();
                },
                icon: const Icon(Icons.refresh))
          ],
          backgroundColor: Colors.greenAccent,
          title: const Text(
            'Menu Pasien',
          ),
          centerTitle: true,
        ),
        body: RefreshIndicator(
          onRefresh: controller.onRefresh,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Daftar Pasien',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 24,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold),
                      ),
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.green)),
                          onPressed: () {
                            Get.toNamed(Routes.TAMBAH_PASIEN,
                                arguments: controller.semuaPasien!.length != 0
                                    ? controller.semuaPasien![
                                            controller.semuaPasien!.length - 1]
                                        ['antrian']
                                    : '0');
                          },
                          child: const Text('Check-in'))
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  color: Colors.grey.withOpacity(0.07),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Icon(
                        Icons.person,
                        color: Colors.green,
                      ),
                      Text(
                        'laki-laki',
                        style: TextStyle(fontFamily: 'Poppins'),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.person,
                        color: Colors.pink,
                      ),
                      Text('perempuan',
                          style: TextStyle(fontFamily: 'Poppins')),
                    ],
                  ),
                ),
                GetBuilder<PasienController>(builder: (_) {
                  return controller.semuaPasien != null
                      ? Column(
                          children: List.generate(
                              controller.semuaPasien!.length,
                              (index) => Card(
                                    child: ListTile(
                                        selected: controller.semuaPasien![index]
                                                    ['id user'] ==
                                                controller.id
                                            ? true
                                            : false,
                                        onTap: () {},
                                        leading: Text(
                                          '${controller.semuaPasien![index]['antrian']}',
                                          style: const TextStyle(
                                              fontSize: 26,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        title: Text(
                                          '${controller.semuaPasien?[index]['nama']}',
                                          style: const TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        subtitle: Text(
                                            "${controller.semuaPasien?[index]['alamat']}"),
                                        trailing: Icon(
                                          Icons.person,
                                          color: controller.semuaPasien![index]
                                                      ['jenis kelamin'] ==
                                                  'laki-laki'
                                              ? Colors.green
                                              : Colors.pink,
                                        )),
                                  )))
                      : Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.2,
                          child: Center(
                            child: LoadingAnimationWidget.beat(
                                color: Colors.greenAccent, size: 20),
                          ),
                        );
                })
              ],
            ),
          ),
        ));
  }
}
