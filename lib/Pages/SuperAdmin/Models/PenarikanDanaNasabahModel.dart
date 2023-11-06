import 'dart:convert';

PenarikanDanaNasabahModel penarikanDanaNasabahModelFromJson(String str) => PenarikanDanaNasabahModel.fromJson(json.decode(str));

String penarikanDanaNasabahModelToJson(PenarikanDanaNasabahModel data) => json.encode(data.toJson());

class PenarikanDanaNasabahModel {
    String? nomorInvoice;
    String? kodeNasabah;
    String? namaNasabah;
    String? kodeAdmin;
    String? namaAdmin;
    int? jumlahPenarikan;
    bool? status;
    
    DateTime? createdAt;
    BiayaAdmin? biayaAdmin;

    PenarikanDanaNasabahModel({
        this.nomorInvoice,
        this.kodeNasabah,
        this.namaNasabah,
        this.kodeAdmin,
        this.jumlahPenarikan,
        this.namaAdmin,
        this.status,
        this.createdAt,
        this.biayaAdmin,
    });

    factory PenarikanDanaNasabahModel.fromJson(Map<String, dynamic> json) => PenarikanDanaNasabahModel(
        nomorInvoice: json["nomor_invoice"],
        kodeNasabah: json["kode_nasabah"],
        namaNasabah: json["nama_nasabah"],
        kodeAdmin: json["kode_admin"],
        namaAdmin: json["namaAdmin"],
        jumlahPenarikan: json["jumlah_penarikan"],
        status: json["status"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        biayaAdmin: json["BiayaAdmin"] == null ? null : BiayaAdmin.fromJson(json["BiayaAdmin"]),
    );

    Map<String, dynamic> toJson() => {
        "nomor_invoice": nomorInvoice,
        "kode_nasabah": kodeNasabah,
        "nama_nasabah": namaNasabah,
        "kode_admin": kodeAdmin,
        "namaAdmin": namaAdmin,
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
