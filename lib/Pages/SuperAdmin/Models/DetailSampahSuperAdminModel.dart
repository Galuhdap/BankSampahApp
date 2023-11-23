class DetailSampahSuperAdmin {
    String kodeDetailSampah;
    String kodeSuperAdmin;
    double berat;
    int saldo;
    int saldo_penjualan;
    DateTime createdAt;
    DateTime updatedAt;

    DetailSampahSuperAdmin({
        required this.kodeDetailSampah,
        required this.kodeSuperAdmin,
        required this.berat,
        required this.saldo,
        required this.saldo_penjualan,
        required this.createdAt,
        required this.updatedAt,
    });

    factory DetailSampahSuperAdmin.fromJson(Map<String, dynamic> json) => DetailSampahSuperAdmin(
        kodeDetailSampah: json["kode_detail_sampah"],
        kodeSuperAdmin: json["kode_super_admin"],
        berat: json["berat"],
        saldo: json["saldo"],
        saldo_penjualan: json["saldo_penjualan"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "kode_detail_sampah": kodeDetailSampah,
        "kode_super_admin": kodeSuperAdmin,
        "berat": berat,
        "saldo": saldo,
        "saldo_penjualan": saldo_penjualan,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}