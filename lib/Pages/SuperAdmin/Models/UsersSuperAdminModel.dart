import 'DetailSampahSuperAdminModel.dart';

class UsersSuperAdmin {
    String kodeSuperAdmin;
    String namaSuperAdmin;
    String noTelp;
    String alamat;
    String kodeUser;
    DateTime createdAt;
    DateTime updatedAt;
    List<DetailSampahSuperAdmin> detailSampahSuperAdmins;

    UsersSuperAdmin({
        required this.kodeSuperAdmin,
        required this.namaSuperAdmin,
        required this.noTelp,
        required this.alamat,
        required this.kodeUser,
        required this.createdAt,
        required this.updatedAt,
        required this.detailSampahSuperAdmins,
    });

    factory UsersSuperAdmin.fromJson(Map<String, dynamic> json) => UsersSuperAdmin(
        kodeSuperAdmin: json["kode_super_admin"],
        namaSuperAdmin: json["nama_super_admin"],
        noTelp: json["no_telp"],
        alamat: json["alamat"],
        kodeUser: json["kode_user"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        detailSampahSuperAdmins: List<DetailSampahSuperAdmin>.from(json["DetailSampahSuperAdmins"].map((x) => DetailSampahSuperAdmin.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "kode_super_admin": kodeSuperAdmin,
        "nama_super_admin": namaSuperAdmin,
        "no_telp": noTelp,
        "alamat": alamat,
        "kode_user": kodeUser,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "DetailSampahSuperAdmins": List<dynamic>.from(detailSampahSuperAdmins.map((x) => x.toJson())),
    };
}