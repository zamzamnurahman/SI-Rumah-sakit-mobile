// To parse this JSON data, do
//
//     final kamar = kamarFromJson(jsonString);

import 'dart:convert';

List<Kamar> kamarFromJson(String str) =>
    List<Kamar>.from(json.decode(str).map((x) => Kamar.fromJson(x)));

String kamarToJson(List<Kamar> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Kamar {
Kamar({
    this.noKamar,
    this.namaKamar,
    this.jenisKamar,
    this.kapasitas,
    this.fasilitas,
  });

  String? noKamar;
  String? namaKamar;
  String? jenisKamar;
  String? kapasitas;
  String? fasilitas;

  factory Kamar.fromJson(Map<String, dynamic> json) => Kamar(
        noKamar: json["no kamar"],
        namaKamar: json["nama kamar"],
        jenisKamar: json["jenis kamar"],
        kapasitas: json["kapasitas"],
        fasilitas: json["fasilitas"],
      );

  Map<String, dynamic> toJson() => {
        "no kamar": noKamar,
        "nama kamar": namaKamar,
        "jenis kamar": jenisKamar,
        "kapasitas": kapasitas,
        "fasilitas": fasilitas,
      };
}
