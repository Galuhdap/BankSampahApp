// To parse this JSON data, do
//
//     final penarikanDanaAdminModel = penarikanDanaAdminModelFromJson(jsonString);

import 'dart:convert';

PenarikanDanaAdminModel penarikanDanaAdminModelFromJson(String str) => PenarikanDanaAdminModel.fromJson(json.decode(str));

String penarikanDanaAdminModelToJson(PenarikanDanaAdminModel data) => json.encode(data.toJson());

class PenarikanDanaAdminModel {
    String? nomorInvoice;
    String? kodeSuperAdmin;
    String? kodeAdmin;
    String? namaAdmin;
    int? jumlahPenarikan;
    bool? status;
    DateTime? createdAt;
    BiayaAdmin? biayaAdmin;

    PenarikanDanaAdminModel({
        this.nomorInvoice,
        this.kodeSuperAdmin,
        this.kodeAdmin,
        this.namaAdmin,
        this.jumlahPenarikan,
        this.status,
        this.createdAt,
        this.biayaAdmin,
    });

    factory PenarikanDanaAdminModel.fromJson(Map<String, dynamic> json) => PenarikanDanaAdminModel(
        nomorInvoice: json["nomor_invoice"],
        kodeSuperAdmin: json["kode_super_admin"],
        kodeAdmin: json["kode_admin"],
        namaAdmin: json["nama_admin"],
        jumlahPenarikan: json["jumlah_penarikan"],
        status: json["status"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        biayaAdmin: json["BiayaAdmin"] == null ? null : BiayaAdmin.fromJson(json["BiayaAdmin"]),
    );

    Map<String, dynamic> toJson() => {
        "nomor_invoice": nomorInvoice,
        "kode_super_admin": kodeSuperAdmin,
        "kode_admin": kodeAdmin,
        "nama_admin": namaAdmin,
        "jumlah_penarikan": jumlahPenarikan,
        "status": status,
        "createdAt": createdAt?.toIso8601String(),
        "BiayaAdmin": biayaAdmin?.toJson(),
    };
}

class BiayaAdmin {
    String? kodeBiayaAdmin;
    int? harga;
    String? kodeSuperInduk;
    DateTime? createdAt;
    DateTime? updatedAt;

    BiayaAdmin({
        this.kodeBiayaAdmin,
        this.harga,
        this.kodeSuperInduk,
        this.createdAt,
        this.updatedAt,
    });

    factory BiayaAdmin.fromJson(Map<String, dynamic> json) => BiayaAdmin(
        kodeBiayaAdmin: json["kode_biayaAdmin"],
        harga: json["harga"],
        kodeSuperInduk: json["kode_super_induk"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "kode_biayaAdmin": kodeBiayaAdmin,
        "harga": harga,
        "kode_super_induk": kodeSuperInduk,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
    };
}
