import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);
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
                "Masuk",
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
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
                height: 20,
              ),
              TextField(
                obscureText: true,
                controller: controller.pass,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    hintText: 'Password'),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.greenAccent,
                ),
                onPressed: () {
                  isKlik.value = false;
                  // print(isKlik.value);
                  Future.delayed(Duration(seconds: 3), () {
                    isKlik.value = true;
                  });
                  controller.login();
                },
                child: Obx(() {
                  return isKlik.value == false
                      ? SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator.adaptive(),
                        )
                      : Text('Masuk');
                }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('belum punya akun ?'),
                  TextButton(
                      onPressed: () {
                        Get.toNamed(Routes.SIGN_UP);
                      },
                      child: const Text(
                        'daftar',
                        style: TextStyle(color: Colors.greenAccent),
                      )),
                ],
              ),
            ],
          ),
        ));
  }
}
