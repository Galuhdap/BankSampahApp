

import '../../Admin/Models/UserAdminModel.dart';
import '../../Nasabah/Models/UserNasabahModel.dart';
import '../../Penimbang/Models/UsersModel.dart';
import 'PenarikanDanaAdminModel.dart';
import 'PenarikanDanaNasabahModel.dart';
import 'SetorSampahBs.dart';
import 'SetorSampahModel.dart';
import 'SusutSampahAdminModel.dart';
import 'TarikKeuntunganAdminModel.dart';
import 'TotalSampahModel.dart';
import 'UsersSuperAdminModel.dart';

class LaporanSemua {

  final UsersSuperAdmin userModel;
  final List<UserAdminModel> itemsAdmin;
  final List<UsersModel> itemsPenimbang;
  final List<NasbahRowModel> itemsNasabah;
  final List<SetorSampahNasabahModel> itemsSetorNasabah;
  final List<SetorSampahBsModel> itemsSetorAdmin;
  final List<SusutSampahAdminModel> itemsSusutSampahInduk;
  final List<PenarikanDanaAdminModel> itemspenarikanDanaAdmin;
  final List<PenarikanDanaNasabahModel> itemspenarikanDanaNasabah;
  final List<TarikKeuntunganAdmin> itemstarikKeuntungan;
  final List<CatatPengeluaranModel> itemsCatatPengeluaran;
  final Alls all;


  const LaporanSemua({

    required this.userModel,
    required this.itemsAdmin,
    required this.itemsPenimbang,
    required this.itemsNasabah,
    required this.itemsSetorNasabah,
    required this.itemsSetorAdmin,
    required this.itemsSusutSampahInduk,
    required this.itemspenarikanDanaAdmin,
    required this.itemspenarikanDanaNasabah,
    required this.itemstarikKeuntungan,
    required this.itemsCatatPengeluaran,
    // required this.itemsTotalSampah,
    required this.all,
  });
}
 

class Alls {
  final int kas;
  final int saldo_penjualan;
  final int pemblihanbahan;
  final int pengeluaran;
  final int penjualan;
  

  const Alls({
    required this.kas,
    required this.saldo_penjualan,
    required this.pemblihanbahan,
    required this.pengeluaran,
    required this.penjualan,
  });
}
