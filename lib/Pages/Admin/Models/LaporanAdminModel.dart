

import '../../Admin/Models/UserAdminModel.dart';
import '../../Nasabah/Models/UserNasabahModel.dart';
import '../../Penimbang/Models/UsersModel.dart';
import '../../SuperAdmin/Models/PenarikanDanaAdminModel.dart';
import '../../SuperAdmin/Models/PenarikanDanaNasabahModel.dart';
import '../../SuperAdmin/Models/SetorSampahBs.dart';
import '../../SuperAdmin/Models/SetorSampahModel.dart';
import '../../SuperAdmin/Models/SusutSampahAdminModel.dart';
import '../../SuperAdmin/Models/UsersSuperAdminModel.dart';

class LaporanAdmin {

  final UsersSuperAdmin userModel;
  // final List<PembelianModel> setorSampahAdmin;
  // final List<PenjualanModel> itemsPenjualan;
  // final List<PenjualanModel> itemsHutangPenjualan;
  final List<UserAdminModel> itemsAdmin;
  final List<UsersModel> itemsPenimbang;
  final List<NasbahRowModel> itemsNasabah;
  final List<SetorSampahNasabahModel> itemsSetorNasabah;
  final List<SetorSampahBsModel> itemsSetorAdmin;
  final List<SusutSampahAdminModel> itemsSusutSampahInduk;
  final List<PenarikanDanaAdminModel> itemspenarikanDanaAdmin;
  final List<PenarikanDanaNasabahModel> itemspenarikanDanaNasabah;
  // final List<TotalSampah> itemsTotalSampah;
  final Semua all;


  const LaporanAdmin({

    required this.userModel,
    required this.itemsAdmin,
    required this.itemsPenimbang,
    required this.itemsNasabah,
    required this.itemsSetorNasabah,
    required this.itemsSetorAdmin,
    required this.itemsSusutSampahInduk,
    required this.itemspenarikanDanaAdmin,
    required this.itemspenarikanDanaNasabah,
    // required this.itemsTotalSampah,
    required this.all,
  });
}
 

class Semua {
  final int kas;
  final int pemblihanbahan;
  final int pengeluaran;
  final num penjualan;
  

  const Semua({
    required this.kas,
    required this.pemblihanbahan,
    required this.pengeluaran,
    required this.penjualan,
  });
}
