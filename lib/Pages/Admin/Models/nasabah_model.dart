import 'detailsampahnasabah.dart';

class NasabahModel {
String? kode_nasabah , nama_nasabah, rt ,rw, no_telp , alamat , pin, kode_user;
final List<DetailSampahNasabahsModel> DetailSampahNasabahs;
String? createdAt , updateAt;

   NasabahModel({
    this.kode_nasabah,
    this.nama_nasabah,
    this.rt,
    this.rw,
    this.no_telp,
    this.alamat,
    this.pin,
    this.kode_user,
    this.createdAt,
    this.updateAt,
    required this.DetailSampahNasabahs,
  });

  factory NasabahModel.fromJson(Map<String, dynamic> json){
    final List<dynamic> detailSampahJson = json['DetailSampahNasabahs'] ?? [];
    final List<DetailSampahNasabahsModel> detailSampahs = detailSampahJson.map((e) => DetailSampahNasabahsModel.fromJson(e)).toList();

    return NasabahModel(
       kode_nasabah: json['kode_nasabah'],
      nama_nasabah: json['nama_nasabah'],
      rt: json['rt'],
      rw: json['rw'],
      alamat: json['alamat'],
      pin: json['pin'],
      kode_user: json['kode_user'],
      createdAt: json['createdAt'],
      updateAt: json['updateAt'],
      DetailSampahNasabahs:detailSampahs,
    );
  }
}
