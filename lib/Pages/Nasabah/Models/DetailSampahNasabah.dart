class DetailSampahNasabah {
    String kodeDetailSampah;
    String kodeNasabah;
    int berat;
    int saldo;
    int beratSekarang;
    int saldoSekarang;
    String kodeAdmin;
    dynamic kodePenimbang;
    DateTime createdAt;
    DateTime updatedAt;

    DetailSampahNasabah({
        required this.kodeDetailSampah,
        required this.kodeNasabah,
        required this.berat,
        required this.saldo,
        required this.beratSekarang,
        required this.saldoSekarang,
        required this.kodeAdmin,
        required this.kodePenimbang,
        required this.createdAt,
        required this.updatedAt,
    });

    factory DetailSampahNasabah.fromJson(Map<String, dynamic> json) => DetailSampahNasabah(
        kodeDetailSampah: json["kode_detail_sampah"],
        kodeNasabah: json["kode_nasabah"],
        berat: json["berat"],
        saldo: json["saldo"],
        beratSekarang: json["berat_sekarang"],
        saldoSekarang: json["saldo_sekarang"],
        kodeAdmin: json["kode_admin"],
        kodePenimbang: json["kode_penimbang"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "kode_detail_sampah": kodeDetailSampah,
        "kode_nasabah": kodeNasabah,
        "berat": berat,
        "saldo": saldo,
        "berat_sekarang": beratSekarang,
        "saldo_sekarang": saldoSekarang,
        "kode_admin": kodeAdmin,
        "kode_penimbang": kodePenimbang,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}