// To parse this JSON data, do
//
//     final catatPengeluaranModel = catatPengeluaranModelFromJson(jsonString);

import 'dart:convert';

CatatPengeluaranModel catatPengeluaranModelFromJson(String str) => CatatPengeluaranModel.fromJson(json.decode(str));

String catatPengeluaranModelToJson(CatatPengeluaranModel data) => json.encode(data.toJson());

class CatatPengeluaranModel {
    String? kodePengeluaran;
    String? namaPengeluaran;
    int? harga;
    String? catatan;
    String? kodeSuperAdmin;
    DateTime? createdAt;
    DateTime? updatedAt;

    CatatPengeluaranModel({
        this.kodePengeluaran,
        this.namaPengeluaran,
        this.harga,
        this.catatan,
        this.kodeSuperAdmin,
        this.createdAt,
        this.updatedAt,
    });

    factory CatatPengeluaranModel.fromJson(Map<String, dynamic> json) => CatatPengeluaranModel(
        kodePengeluaran: json["kode_pengeluaran"],
        namaPengeluaran: json["nama_pengeluaran"],
        harga: json["harga"],
        catatan: json["catatan"],
        kodeSuperAdmin: json["kode_super_admin"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "kode_pengeluaran": kodePengeluaran,
        "nama_pengeluaran": namaPengeluaran,
        "harga": harga,
        "catatan": catatan,
        "kode_super_admin": kodeSuperAdmin,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
    };
}
