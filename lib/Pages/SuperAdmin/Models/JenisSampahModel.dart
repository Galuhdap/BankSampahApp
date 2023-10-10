import 'dart:convert';

import 'JenisBarangModel.dart';

JenisSampah jenisSampahFromJson(String str) => JenisSampah.fromJson(json.decode(str));

String jenisSampahToJson(JenisSampah data) => json.encode(data.toJson());

class JenisSampah {
    String kodeSampah;
    String jenisSampah;
    DateTime createdAt;
    DateTime updatedAt;
    List<JenisBarang> jenisBarangs;

    JenisSampah({
        required this.kodeSampah,
        required this.jenisSampah,
        required this.createdAt,
        required this.updatedAt,
        required this.jenisBarangs,
    });

    factory JenisSampah.fromJson(Map<String, dynamic> json) => JenisSampah(
        kodeSampah: json["kode_sampah"],
        jenisSampah: json["jenis_sampah"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        jenisBarangs: List<JenisBarang>.from(json["JenisBarangs"].map((x) => JenisBarang.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "kode_sampah": kodeSampah,
        "jenis_sampah": jenisSampah,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "JenisBarangs": List<dynamic>.from(jenisBarangs.map((x) => x.toJson())),
    };
}