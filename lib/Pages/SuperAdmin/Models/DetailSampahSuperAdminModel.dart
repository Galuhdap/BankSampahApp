class DetailSampahSuperAdmin {
    String kodeDetailSampah;
    String kodeSuperAdmin;
    double berat;
    int saldo;
    DateTime createdAt;
    DateTime updatedAt;

    DetailSampahSuperAdmin({
        required this.kodeDetailSampah,
        required this.kodeSuperAdmin,
        required this.berat,
        required this.saldo,
        required this.createdAt,
        required this.updatedAt,
    });

    factory DetailSampahSuperAdmin.fromJson(Map<String, dynamic> json) => DetailSampahSuperAdmin(
        kodeDetailSampah: json["kode_detail_sampah"],
        kodeSuperAdmin: json["kode_super_admin"],
        berat: json["berat"],
        saldo: json["saldo"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "kode_detail_sampah": kodeDetailSampah,
        "kode_super_admin": kodeSuperAdmin,
        "berat": berat,
        "saldo": saldo,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}