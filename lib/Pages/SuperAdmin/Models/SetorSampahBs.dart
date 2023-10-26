// To parse this JSON data, do
//
//     final setorSampahBsModel = setorSampahBsModelFromJson(jsonString);

import 'dart:convert';

SetorSampahBsModel setorSampahBsModelFromJson(String str) => SetorSampahBsModel.fromJson(json.decode(str));

String setorSampahBsModelToJson(SetorSampahBsModel data) => json.encode(data.toJson());

class SetorSampahBsModel {
    String? kodeSusutSampahBs;
    int? berat;
    int? harga;
    String? catatan;
    String? kodeAdminBs;
    String? kodeSuperAdmin;
    String? kodeSampah;
    String? kodeBarang;
    DateTime? createdAt;
    DateTime? updatedAt;

    SetorSampahBsModel({
        this.kodeSusutSampahBs,
        this.berat,
        this.harga,
        this.catatan,
        this.kodeAdminBs,
        this.kodeSuperAdmin,
        this.kodeSampah,
        this.kodeBarang,
        this.createdAt,
        this.updatedAt,
    });

    factory SetorSampahBsModel.fromJson(Map<String, dynamic> json) => SetorSampahBsModel(
        kodeSusutSampahBs: json["kode_susut_sampah_bs"],
        berat: json["berat"],
        harga: json["harga"],
        catatan: json["catatan"],
        kodeAdminBs: json["kode_admin_bs"],
        kodeSuperAdmin: json["kode_super_admin"],
        kodeSampah: json["kode_sampah"],
        kodeBarang: json["kode_barang"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "kode_susut_sampah_bs": kodeSusutSampahBs,
        "berat": berat,
        "harga": harga,
        "catatan": catatan,
        "kode_admin_bs": kodeAdminBs,
        "kode_super_admin": kodeSuperAdmin,
        "kode_sampah": kodeSampah,
        "kode_barang": kodeBarang,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
    };
}
