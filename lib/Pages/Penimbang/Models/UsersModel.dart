class UsersModel {
    String kodePenimbang;
    String namaPenimbang;
    String rt;
    String rw;
    String noTelp;
    String alamat;
    String kodeAdmin;
    String kodeUser;
    DateTime createdAt;
    DateTime updatedAt;

    UsersModel({
        required this.kodePenimbang,
        required this.namaPenimbang,
        required this.rt,
        required this.rw,
        required this.noTelp,
        required this.alamat,
        required this.kodeAdmin,
        required this.kodeUser,
        required this.createdAt,
        required this.updatedAt,
    });

    factory UsersModel.fromJson(Map<String, dynamic> json) => UsersModel(
        kodePenimbang: json["kode_penimbang"],
        namaPenimbang: json["nama_penimbang"],
        rt: json["rt"],
        rw: json["rw"],
        noTelp: json["no_telp"],
        alamat: json["alamat"],
        kodeAdmin: json["kode_admin"],
        kodeUser: json["kode_user"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "kode_penimbang": kodePenimbang,
        "nama_penimbang": namaPenimbang,
        "rt": rt,
        "rw": rw,
        "no_telp": noTelp,
        "alamat": alamat,
        "kode_admin": kodeAdmin,
        "kode_user": kodeUser,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}