class JenisBarang {
    String kodeBarang;
    String jenisBarang;
    int satuan;
    int hargaPertama;
    int hargaKedua;
    String kodeSampah;
    DateTime createdAt;
    DateTime updatedAt;

    JenisBarang({
        required this.kodeBarang,
        required this.jenisBarang,
        required this.satuan,
        required this.hargaPertama,
        required this.hargaKedua,
        required this.kodeSampah,
        required this.createdAt,
        required this.updatedAt,
    });

    factory JenisBarang.fromJson(Map<String, dynamic> json) => JenisBarang(
        kodeBarang: json["kode_barang"],
        jenisBarang: json["jenis_barang"],
        satuan: json["satuan"],
        hargaPertama: json["harga_pertama"],
        hargaKedua: json["harga_kedua"],
        kodeSampah: json["kode_sampah"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "kode_barang": kodeBarang,
        "jenis_barang": jenisBarang,
        "satuan": satuan,
        "harga_pertama": hargaPertama,
        "harga_kedua": hargaKedua,
        "kode_sampah": kodeSampah,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}