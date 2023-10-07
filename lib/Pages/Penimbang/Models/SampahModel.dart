class Sampah {
    String kodeDetailSampah;
    String kodeAdmin;
    int berat;
    int saldo;
    int beratSekarang;
    int saldoSekarang;
    DateTime createdAt;
    DateTime updatedAt;

    Sampah({
        required this.kodeDetailSampah,
        required this.kodeAdmin,
        required this.berat,
        required this.saldo,
        required this.beratSekarang,
        required this.saldoSekarang,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Sampah.fromJson(Map<String, dynamic> json) => Sampah(
        kodeDetailSampah: json["kode_detail_sampah"],
        kodeAdmin: json["kode_admin"],
        berat: json["berat"],
        saldo: json["saldo"],
        beratSekarang: json["berat_sekarang"],
        saldoSekarang: json["saldo_sekarang"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "kode_detail_sampah": kodeDetailSampah,
        "kode_admin": kodeAdmin,
        "berat": berat,
        "saldo": saldo,
        "berat_sekarang": beratSekarang,
        "saldo_sekarang": saldoSekarang,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}