// To parse this JSON data, do
//
//     final setorSampahNasabahModel = setorSampahNasabahModelFromJson(jsonString);

import 'dart:convert';

SetorSampahNasabahModel setorSampahNasabahModelFromJson(String str) => SetorSampahNasabahModel.fromJson(json.decode(str));

String setorSampahNasabahModelToJson(SetorSampahNasabahModel data) => json.encode(data.toJson());

class SetorSampahNasabahModel {
    String? kodeSetor;
    int? berat;
    int? total;
    String? catatan;
    String? kodeNasabah;
    String? kodeAdmin;
    String? kodePenimbang;
    String? kodeSuperAdmin;
    String? kodeSampah;
    String? kodeBarang;
    DateTime? createdAt;
    DateTime? updatedAt;

    SetorSampahNasabahModel({
        this.kodeSetor,
        this.berat,
        this.total,
        this.catatan,
        this.kodeNasabah,
        this.kodeAdmin,
        this.kodePenimbang,
        this.kodeSuperAdmin,
        this.kodeSampah,
        this.kodeBarang,
        this.createdAt,
        this.updatedAt,
    });

    factory SetorSampahNasabahModel.fromJson(Map<String, dynamic> json) => SetorSampahNasabahModel(
        kodeSetor: json["kode_setor"],
        berat: json["berat"],
        total: json["total"],
        catatan: json["catatan"],
        kodeNasabah: json["kode_nasabah"],
        kodeAdmin: json["kode_admin"],
        kodePenimbang: json["kode_penimbang"],
        kodeSuperAdmin: json["kode_super_admin"],
        kodeSampah: json["kode_sampah"],
        kodeBarang: json["kode_barang"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "kode_setor": kodeSetor,
        "berat": berat,
        "total": total,
        "catatan": catatan,
        "kode_nasabah": kodeNasabah,
        "kode_admin": kodeAdmin,
        "kode_penimbang": kodePenimbang,
        "kode_super_admin": kodeSuperAdmin,
        "kode_sampah": kodeSampah,
        "kode_barang": kodeBarang,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
    };
}
