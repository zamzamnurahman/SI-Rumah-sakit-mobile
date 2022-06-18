// To parse this JSON data, do
//
//     final pasien = pasienFromJson(jsonString);

import 'dart:convert';

List<Pasien> pasienFromJson(String str) =>
    List<Pasien>.from(json.decode(str).map((x) => Pasien.fromJson(x)));

String pasienToJson(List<Pasien> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Pasien {
  Pasien({
    this.id,
    this.nama,
    this.jenisKelamin,
    this.noTelepon,
    this.tanggalLahir,
    this.alamat,
  });

  String? id;
  String? nama;
  String? jenisKelamin;
  String? noTelepon;
  DateTime? tanggalLahir;
  String? alamat;

  factory Pasien.fromJson(Map<String, dynamic> json) => Pasien(
        id: json["id"],
        nama: json["nama"],
        jenisKelamin: json["jenis kelamin"],
        noTelepon: json["no telepon"],
        tanggalLahir: DateTime.parse(json["tanggal lahir"]),
        alamat: json["alamat"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "jenis kelamin": jenisKelamin,
        "no telepon": noTelepon,
        "tanggal lahir":
            "${tanggalLahir?.year.toString().padLeft(4, '0')}-${tanggalLahir?.month.toString().padLeft(2, '0')}-${tanggalLahir?.day.toString().padLeft(2, '0')}",
        "alamat": alamat,
      };
}
