// To parse this JSON data, do
//
//     final tarikKeuntunganAdmin = tarikKeuntunganAdminFromJson(jsonString);

import 'dart:convert';

TarikKeuntunganAdmin tarikKeuntunganAdminFromJson(String str) => TarikKeuntunganAdmin.fromJson(json.decode(str));

String tarikKeuntunganAdminToJson(TarikKeuntunganAdmin data) => json.encode(data.toJson());

class TarikKeuntunganAdmin {
    String? kodeTariksaldo;
    String? nomorInvoice;
    int? jumlahPenarikan;
    String? kodeAdmin;
    String? kodeSuperAdmin;
    DateTime? createdAt;
    DateTime? updatedAt;

    TarikKeuntunganAdmin({
        this.kodeTariksaldo,
        this.nomorInvoice,
        this.jumlahPenarikan,
        this.kodeAdmin,
        this.kodeSuperAdmin,
        this.createdAt,
        this.updatedAt,
    });

    factory TarikKeuntunganAdmin.fromJson(Map<String, dynamic> json) => TarikKeuntunganAdmin(
        kodeTariksaldo: json["kode_tariksaldo"],
        nomorInvoice: json["nomor_invoice"],
        jumlahPenarikan: json["jumlah_penarikan"],
        kodeAdmin: json["kode_admin"],
        kodeSuperAdmin: json["kode_super_admin"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "kode_tariksaldo": kodeTariksaldo,
        "nomor_invoice": nomorInvoice,
        "jumlah_penarikan": jumlahPenarikan,
        "kode_admin": kodeAdmin,
        "kode_super_admin": kodeSuperAdmin,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
    };
}
