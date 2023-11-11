import 'dart:typed_data';

import 'package:banksampah_application/Pages/Admin/Models/UserAdminModel.dart';
import 'package:flutter/material.dart';
import 'package:printing/printing.dart';

import '../../Admin/controller/userController.dart';
import '../../Nasabah/Models/UserNasabahModel.dart';
import '../../Penimbang/Models/UsersModel.dart';


import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../SuperAdmin/Controllers/sampahController.dart';
import '../../SuperAdmin/Controllers/user_controller.dart';
import '../../SuperAdmin/Models/LaporanSemuaModel.dart';
import '../../SuperAdmin/Models/PenarikanDanaAdminModel.dart';
import '../../SuperAdmin/Models/PenarikanDanaNasabahModel.dart';
import '../../SuperAdmin/Models/SetorSampahBs.dart';
import '../../SuperAdmin/Models/SetorSampahModel.dart';
import '../../SuperAdmin/Models/SusutSampahAdminModel.dart';
import '../../SuperAdmin/Models/TotalSampahModel.dart';
import '../../SuperAdmin/Models/UsersSuperAdminModel.dart';
import '../Models/LaporanAdminModel.dart';
import '../controller/LaporanAdminController.dart';
import 'LaporanController.dart';

class PDFLaporanAdminScreen extends StatefulWidget {
  final int kas;
  final int pemblihanbahan;
  final int pengeluaran;
  final num penjualan;
  const PDFLaporanAdminScreen({
    super.key,
    required this.kas,
    required this.pemblihanbahan,
    required this.pengeluaran,
    required this.penjualan,
  });

  @override
  State<PDFLaporanAdminScreen> createState() => _PDFLaporanAdminScreenState();
}

class _PDFLaporanAdminScreenState extends State<PDFLaporanAdminScreen> {
  // PdfController pdfController = PdfController();
  // PdfLaporanSemua pdfLaporanSemua = PdfLaporanSemua();

  List datas = [];
  List penj = [];
  List pem = [];
  List peng = [];

  List datashutang = [];

  List _users = [];
  List _userAdmin = [];
  List _userPenimbang = [];
  List _userNasabah = [];
  List _sampahAdmin = [];
  List _setorSampahNasabah = [];
  List _getSusutSampahAdmin = [];
  List _penarikanDanaAdmin = [];
  List _penarikanDanaNasabah = [];
  List _totalSampah = [];

  Future getDatas() async {
    List users = await UserControllerAdmin().getUser();
    List userPenimbang = await UserControllerAdmin().getPenimbang();
    List userNasabah = await UserControllerAdmin().getNasabah();
    List sampahAdmin = await UserControllerAdmin().listJualSampah();
    List setorSampahNasabah =
        await  UserControllerAdmin().listSetorSampah();
    List getSusutSampahAdmin =
        await SampahSuperAdminController().getSusutSampahAdmin();
    List penarikanDanaAdmin =
        await UserControllerAdmin().getPenarikanSaldoBS();
    List penarikanDanaNasabah =
        await LaporanAdminController().getPenarikanNasabahAdmin();
    // List totalSampah = await SampahSuperAdminController().totalSampah();
    setState(() {
      _users = users;
      _userPenimbang = userPenimbang;
      _userNasabah = userNasabah;
      _sampahAdmin = sampahAdmin;
      _setorSampahNasabah = setorSampahNasabah;
      _getSusutSampahAdmin = getSusutSampahAdmin;
      _penarikanDanaAdmin = penarikanDanaAdmin;
      _penarikanDanaNasabah = penarikanDanaNasabah;
      // _totalSampah = totalSampah;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getDatas();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(_penarikanDanaNasabah);
    List<UserAdminModel> itemsPenggunaAdmin = _userAdmin.map((category) {
      return UserAdminModel(
          createdAt: DateTime.parse(category['createdAt']),
          kodeAdmin: category['kode_admin'],
          namaBs: category['nama_bs'],
          noTelp: category['no_telp'],
          berat: category['DetailSampahBs'][0]['berat'],
          saldo: category['DetailSampahBs'][0]['saldo']
         );
    }).toList();
    List<UsersModel> itemsPenggunaPenimbang = _userPenimbang.map((category) {
      return UsersModel(
        createdAt: DateTime.parse(category['createdAt']),
        kodePenimbang: category['kode_penimbang'],
        namaPenimbang: category['nama_penimbang'],

        alamat: category['alamat'],
        noTelp: category['no_telp'],
      );
    }).toList();

    List<NasbahRowModel> itemsPenggunaNasabah = _userNasabah.map((category) {
      return NasbahRowModel(
        createdAt: DateTime.parse(category['createdAt']),
        kodeNasabah: category['kode_nasabah'],
        namaNasabah: category['nama_nasabah'],
        alamat: category['alamat'],
        noTelp: category['no_telp'],
        berat: category['DetailSampahNasabahs'][0]['berat'],
        saldo: category['DetailSampahNasabahs'][0]['saldo']
      );
    }).toList();

    List<SusutSampahAdminModel> itemsPenjualanSampahInduk =
        _getSusutSampahAdmin.map((category) {
      return SusutSampahAdminModel(
        createdAt: DateTime.parse(category['createdAt']),
        kodeSusutInduk: category["kode_susut_induk"],
        namaPembeli: category['nama_pembeli'],
        barang: category['JenisBarang']['jenis_barang'],
        berat: category["berat"],
        harga: category["harga"],
        total: category["total"],
      );
    }).toList();

    List<SetorSampahNasabahModel> itemsSetorSampahNasabah =
        _setorSampahNasabah.map((category) {
      return SetorSampahNasabahModel(
        createdAt: DateTime.parse(category['createdAt']),
        kodeSetor: category["kode_setor"],
        nasabah: category["Nasabah"]["nama_nasabah"],
        penimbang: category["Penimbang"]["nama_penimbang"],
        barang: category['JenisBarang']['jenis_barang'],
        berat: category["berat"],
        total: category["total"],
      );
    }).toList();

    List<SetorSampahBsModel> itemsSetorSampahAdmin =
        _sampahAdmin.map((category) {
      return SetorSampahBsModel(
        createdAt: DateTime.parse(category['createdAt']),
        kodeSusutSampahBs: category["kode_susut_sampah_bs"],
        admin: category["Admin"]["nama_bs"],
        barang: category['JenisBarang']['jenis_barang'],
        berat: category["berat"] ,
        harga: category["harga"],
      );
    }).toList();

    List<PenarikanDanaAdminModel> itemspenarikanDanaAdmin =
        _penarikanDanaAdmin.map((category) {
      return PenarikanDanaAdminModel(
        createdAt: DateTime.parse(category['createdAt']),
        nomorInvoice : category["nomor_invoice"],
        jumlahPenarikan : category["jumlah_penarikan"],
        namaAdmin: category["Admin"]["nama_bs"]
      );
    }).toList();
    List<PenarikanDanaNasabahModel> itemspenarikanDanaNasabah =
        _penarikanDanaNasabah.map((category) {
      return PenarikanDanaNasabahModel(
        createdAt: DateTime.parse(category['createdAt']),
        nomorInvoice : category["nomor_invoice"],
        namaNasabah : category["Nasabah"]["nama_nasabah"],
        namaAdmin:category["Admin"]["nama_bs"],
        jumlahPenarikan : category["jumlah_penarikan"],
        
      );
    }).toList();

    List<TotalSampah> itemsTotalSampah=
        _totalSampah.map((category) {
      return TotalSampah(
        // createdAt: DateTime.parse(category['createdAt']),
        // nomorInvoice : category["nomor_invoice"],
        // namaNasabah : category["Nasabah"]["nama_nasabah"],
        // namaAdmin:category["Admin"]["nama_bs"],
        // jumlahPenarikan : category["jumlah_penarikan"],
        
      );
    }).toList();

    final laporan = LaporanAdmin(
      userModel: UsersSuperAdmin(
          namaSuperAdmin:  _users.length > 0 ? _users[0]["nama_bs"] : '',
          alamat:  'Rt ${_users.length > 0 ? _users[0]["rt"] : ''}  Rw ${_users.length > 0 ? _users[0]["rt"] : ''}'),
      itemsAdmin: itemsPenggunaAdmin,
      itemsPenimbang: itemsPenggunaPenimbang,
      itemsNasabah: itemsPenggunaNasabah,
      itemsSetorNasabah: itemsSetorSampahNasabah,
      itemsSetorAdmin: itemsSetorSampahAdmin,
      itemsSusutSampahInduk: itemsPenjualanSampahInduk,
      itemspenarikanDanaAdmin: itemspenarikanDanaAdmin,
      itemspenarikanDanaNasabah: itemspenarikanDanaNasabah,
      // itemsTotalSampah: itemsTotalSampah,
      all: Semua(
          kas: widget.kas,
          pemblihanbahan: widget.pemblihanbahan,
          pengeluaran: widget.pengeluaran,
          // totalhpp: 2929,
          penjualan: widget.penjualan,
          ),
    );


    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Preview'),
      ),
      body: PdfPreview(
        build: (context) => PdfLaporanAdmin().generate(laporan),
        pdfFileName: 'LaporanSemuaAdmin.pdf',
      ),
    );
  }
}
