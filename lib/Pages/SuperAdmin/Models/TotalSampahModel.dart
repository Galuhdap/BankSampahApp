// To parse this JSON data, do
//
//     final totalSampah = totalSampahFromJson(jsonString);

import 'dart:convert';

TotalSampah totalSampahFromJson(String str) => TotalSampah.fromJson(json.decode(str));

String totalSampahToJson(TotalSampah data) => json.encode(data.toJson());

class TotalSampah {
    String? kodeAdminBs;
    String? kodeSampah;
    String? kodeBarang;
    String? barang;
    String? admin;
    int? totalBarang;

    TotalSampah({
        this.kodeAdminBs,
        this.kodeSampah,
        this.kodeBarang,
        this.barang,
        this.admin,
        this.totalBarang,
    });

    factory TotalSampah.fromJson(Map<String, dynamic> json) => TotalSampah(
        kodeAdminBs: json["kode_admin_bs"],
        kodeSampah: json["kode_sampah"],
        kodeBarang: json["kode_barang"],
        barang: json["barang"],
        admin: json["admin"],
        totalBarang: json["total Barang"],
    );

    Map<String, dynamic> toJson() => {
        "kode_admin_bs": kodeAdminBs,
        "kode_sampah": kodeSampah,
        "kode_barang": kodeBarang,
        "barang": barang,
        "admin": admin,
        "total Barang": totalBarang,
    };
}