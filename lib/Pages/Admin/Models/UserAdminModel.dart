import 'DetailSampahBs.dart';

class UserAdminModel {
    String? kodeAdmin;
    String? namaBs;
    String? noTelp;
    String? rt;
    String? rw;
    String? kodeUser;
    String? kode_super_admin;
    DateTime? createdAt;
    DateTime? updatedAt;
    List<DetailSampahBs>? detailSampahBs;

    UserAdminModel({
       this.kodeAdmin,
       this.namaBs,
       this.noTelp,
       this.rt,
       this.rw,
       this.kodeUser,
       this.kode_super_admin,
       this.createdAt,
       this.updatedAt,
       this.detailSampahBs,
    });

    factory UserAdminModel.fromJson(Map<String, dynamic> json) => UserAdminModel(
        kodeAdmin: json["kode_admin"],
        namaBs: json["nama_bs"],
        noTelp: json["no_telp"],
        rt: json["rt"],
        rw: json["rw"],
        kodeUser: json["kode_user"],
        kode_super_admin: json["kode_super_admin"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        detailSampahBs: List<DetailSampahBs>.from(json["DetailSampahBs"].map((x) => DetailSampahBs.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "kode_admin": kodeAdmin,
        "nama_bs": namaBs,
        "no_telp": noTelp,
        "rt": rt,
        "rw": rw,
        "kode_user": kodeUser,
        "kode_super_admin": kode_super_admin,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "DetailSampahBs": List<dynamic>.from(detailSampahBs!.map((x) => x.toJson())),
    };
}