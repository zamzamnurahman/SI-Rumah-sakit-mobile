import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/sign_up_controller.dart';

class SignUpView extends GetView<SignUpController> {
  var isKlik = true.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.2,
          ),
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Daftar",
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: controller.nama,
                decoration: InputDecoration(
                  hintText: 'Nama',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: controller.email,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  hintText: 'Email',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: controller.pass,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    hintText: 'Password'),
                obscureText: true,
                obscuringCharacter: '*',
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  isKlik.value = isKlik.value ? false : true;
                  Future.delayed(
                      Duration(seconds: 3), () => isKlik.value = true);
                  controller.signUp();
                },
                child: Obx(() => isKlik.value
                    ? Text('Daftar')
                    : SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(),
                      )),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.greenAccent)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('sudah punya akun ?'),
                  TextButton(
                      onPressed: () {
                        isKlik.value = false;
                        Future.delayed(Duration(seconds: 1), () {
                          controller.signUp();
                        });
                      },
                      child: const Text(
                        'Masuk',
                        style: TextStyle(color: Colors.green),
                      ))
                ],
              )
            ],
          ),
        ));
  }
}
