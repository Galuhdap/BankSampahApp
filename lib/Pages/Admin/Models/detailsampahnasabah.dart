class DetailSampahNasabahsModel {
 String? kode_detail_sampah ,kode_nasabah ,kode_admin ,kode_penimbang;
 int? berat ,saldo ,berat_sekarang , saldo_sekarang;


 String?  createdAt, updateAt;
 DetailSampahNasabahsModel({
    this.kode_detail_sampah,
    this.kode_nasabah,
    this.berat,
    this.saldo,
    this.berat_sekarang,
    this.saldo_sekarang,
    this.kode_penimbang,
    this.kode_admin,
    this.createdAt,
    this.updateAt,
  });

factory DetailSampahNasabahsModel.fromJson(Map<String, dynamic> json){


    return DetailSampahNasabahsModel(
       kode_detail_sampah: json['kode_detail_sampah'],
      kode_nasabah: json['kode_nasabah'],
      berat: json['berat'],
      saldo: json['saldo'],
      berat_sekarang: json['berat_sekarang'],
      saldo_sekarang: json['saldo_sekarang'],
      kode_penimbang: json['kode_penimbang'],
      kode_admin: json['kode_admin'],
      createdAt: json['createdAt'],
      updateAt: json['updateAt'],
    );
  }
 
}