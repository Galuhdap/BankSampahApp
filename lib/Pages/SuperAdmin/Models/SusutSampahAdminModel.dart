// To parse this JSON data, do
//
//     final susutSampahAdminModel = susutSampahAdminModelFromJson(jsonString);

import 'dart:convert';

SusutSampahAdminModel susutSampahAdminModelFromJson(String str) => SusutSampahAdminModel.fromJson(json.decode(str));

String susutSampahAdminModelToJson(SusutSampahAdminModel data) => json.encode(data.toJson());

class SusutSampahAdminModel {
    String? kodeSusutInduk;
    int? berat;
    int? harga;
    int? total;
    String? catatan;
    String? namaPembeli;
    String? kodeSuperAdmin;
    String? kodeSampah;
    String? kodeBarang;
    DateTime? createdAt;
    DateTime? updatedAt;

    SusutSampahAdminModel({
        this.kodeSusutInduk,
        this.berat,
        this.harga,
        this.total,
        this.catatan,
        this.namaPembeli,
        this.kodeSuperAdmin,
        this.kodeSampah,
        this.kodeBarang,
        this.createdAt,
        this.updatedAt,
    });

    factory SusutSampahAdminModel.fromJson(Map<String, dynamic> json) => SusutSampahAdminModel(
        kodeSusutInduk: json["kode_susut_induk"],
        berat: json["berat"],
        harga: json["harga"],
        total: json["total"],
        catatan: json["catatan"],
        namaPembeli: json["nama_pembeli"],
        kodeSuperAdmin: json["kode_super_admin"],
        kodeSampah: json["kode_sampah"],
        kodeBarang: json["kode_barang"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "kode_susut_induk": kodeSusutInduk,
        "berat": berat,
        "harga": harga,
        "total": total,
        "catatan": catatan,
        "nama_pembeli": namaPembeli,
        "kode_super_admin": kodeSuperAdmin,
        "kode_sampah": kodeSampah,
        "kode_barang": kodeBarang,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
    };
}
