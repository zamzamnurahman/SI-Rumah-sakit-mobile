import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rumah_sakit/app/routes/app_pages.dart';

class DrawerWidget extends StatelessWidget {
  String? nama;
  String? email;
  DrawerWidget({this.nama, this.email});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          _drawerHeader(nama, email),
          _drawerItem(
              icon: Icons.person,
              text: 'Profile',
              onTap: () => print('Tap profile menu')),
          _drawerItem(
              icon: Icons.personal_injury_rounded,
              text: 'Menu Pasien',
              onTap: () => Get.toNamed(Routes.PASIEN)),
          _drawerItem(
              icon: Icons.local_hospital,
              text: 'Jadwal Dokter',
              onTap: () => Get.toNamed(Routes.JADWAL_DOKTER)),
          _drawerItem(
              icon: Icons.bed,
              text: 'Daftar Kamar inap',
              onTap: () => print('Tap kamar inap menu')),
          const Divider(height: 25, thickness: 1),
          _drawerItem(
            icon: Icons.logout_outlined,
            color: Colors.red,
            text: 'Logout',
            colorText: Colors.red,
            onTap: () => showDialog(
                context: context, builder: (context) => _alertDialog()),
          ),
        ],
      ),
    );
  }
}

Widget _drawerHeader(String? nama, String? email) {
  return Center(
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Column(children: [
        Container(
          height: 150,
          width: double.infinity,
          child: Image.asset(
            'assets/images/illustration_rumah_sakit.png',
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          '$nama',
          style: TextStyle(
              fontFamily: 'Poppins', fontWeight: FontWeight.bold, fontSize: 16),
        ),
        Text(
          '$email',
          style: TextStyle(fontFamily: 'Poppins', fontSize: 12),
        ),
      ]),
    ),
  );
}

Widget _drawerItem(
    {IconData? icon,
    Color? color,
    String? text,
    Color? colorText,
    GestureTapCallback? onTap}) {
  return ListTile(
    title: Row(
      children: <Widget>[
        Icon(
          icon,
          color: color ?? Colors.black,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: Text(
            text ?? '',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: colorText ?? Colors.black),
          ),
        ),
      ],
    ),
    onTap: onTap,
  );
}

AlertDialog _alertDialog() {
  return AlertDialog(
    title: Text("Logout"),
    content: Text("apakah anda yakin untuk keluar?"),
    actions: [
      OutlinedButton(
          onPressed: () {
            Get.offAllNamed(Routes.LOGIN);
          },
          child: Text('ya')),
      OutlinedButton(
          onPressed: () {
            Get.back();
          },
          child: Text('tidak')),
    ],
  );
}
