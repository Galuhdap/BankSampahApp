class RowSampahModel {
    String? kodeSetor;
    int? berat;
    int? total;
    String? catatan;
    String? kodeNasabah;
    String? kodeAdmin;
    String? kodePenimbang;
    String? kodeSampah;
    String? kodeBarang;
    DateTime? createdAt;
    DateTime? updatedAt;

    RowSampahModel({
        this.kodeSetor,
        this.berat,
        this.total,
        this.catatan,
        this.kodeNasabah,
        this.kodeAdmin,
        this.kodePenimbang,
        this.kodeSampah,
        this.kodeBarang,
        this.createdAt,
        this.updatedAt,
    });

    factory RowSampahModel.fromJson(Map<String, dynamic> json) => RowSampahModel(
        kodeSetor: json["kode_setor"],
        berat: json["berat"],
        total: json["total"],
        catatan: json["catatan"],
        kodeNasabah: json["kode_nasabah"],
        kodeAdmin: json["kode_admin"],
        kodePenimbang: json["kode_penimbang"],
        kodeSampah: json["kode_sampah"],
        kodeBarang: json["kode_barang"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    // Map<String, dynamic> toJson() => {
    //     "kode_setor": kodeSetor,
    //     "berat": berat,
    //     "total": total,
    //     "catatan": catatan,
    //     "kode_nasabah": kodeNasabah,
    //     "kode_admin": kodeAdmin,
    //     "kode_penimbang": kodePenimbang,
    //     "kode_sampah": kodeSampah,
    //     "kode_barang": kodeBarang,
    //     "createdAt": createdAt.toIso8601String(),
    //     "updatedAt": updatedAt.toIso8601String(),
    // };
}