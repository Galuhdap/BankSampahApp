import 'DetailSampahNasabah.dart';

class NasbahRowModel {
    String? kodeNasabah;
    String? namaNasabah;
    String? rt;
    String? rw;
    String? noTelp;
    String? alamat;
    String? pin;
    String? kodeUser;
    String? kodeAdmin;
    DateTime? createdAt;
    DateTime? updatedAt;
    List<DetailSampahNasabah>? detailSampahNasabahs;

    NasbahRowModel({
        this.kodeNasabah,
        this.namaNasabah,
        this.rt,
        this.rw,
        this.noTelp,
        this.alamat,
        this.pin,
        this.kodeUser,
        this.kodeAdmin,
        this.createdAt,
        this.updatedAt,
        this.detailSampahNasabahs,
    });

    factory NasbahRowModel.fromJson(Map<String, dynamic> json) => NasbahRowModel(
        kodeNasabah: json["kode_nasabah"],
        namaNasabah: json["nama_nasabah"],
        rt: json["rt"],
        rw: json["rw"],
        noTelp: json["no_telp"],
        alamat: json["alamat"],
        pin: json["pin"],
        kodeUser: json["kode_user"],
        kodeAdmin: json["kode_admin"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        detailSampahNasabahs: List<DetailSampahNasabah>.from(json["DetailSampahNasabahs"].map((x) => DetailSampahNasabah.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "kode_nasabah": kodeNasabah,
        "nama_nasabah": namaNasabah,
        "rt": rt,
        "rw": rw,
        "no_telp": noTelp,
        "alamat": alamat,
        "pin": pin,
        "kode_user": kodeUser,
        "kode_admin": kodeAdmin,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "DetailSampahNasabahs": List<dynamic>.from(detailSampahNasabahs!.map((x) => x.toJson())),
    };
}