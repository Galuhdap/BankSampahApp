class PenimbangModel {
  String? kode_penimbang,
      nama_penimbang,
      rt,
      rw,
      no_telp,
      alamat,
      kode_admin,
      kode_user;
  DateTime? createdAt, updateAt;

  PenimbangModel({
    this.kode_penimbang,
    this.nama_penimbang,
    this.rt,
    this.rw,
    this.no_telp,
    this.alamat,
    this.kode_admin,
    this.kode_user,
    this.createdAt,
    this.updateAt,
  });

  factory PenimbangModel.fromJson(Map<String, dynamic> json) {
    return PenimbangModel(
      kode_penimbang: json['kode_penimbang'],
      nama_penimbang: json['nama_penimbang'],
      rt: json['rt'],
      rw: json['rw'],
      alamat: json['alamat'],
      kode_admin: json['kode_admin'],
      kode_user: json['kode_user'],
      createdAt: json['createdAt'],
      updateAt: json['updateAt'],
    );
  }
}
