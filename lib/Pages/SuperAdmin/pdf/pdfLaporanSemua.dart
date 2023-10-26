import 'dart:typed_data';

import 'package:banksampah_application/Pages/Admin/Models/UserAdminModel.dart';
import 'package:flutter/material.dart';
import 'package:printing/printing.dart';

import '../../Admin/controller/userController.dart';
import '../../Nasabah/Models/UserNasabahModel.dart';
import '../../Penimbang/Models/UsersModel.dart';
import '../Controllers/pdf/pdf_laporansemua.dart';
import '../Controllers/sampahController.dart';
import '../Controllers/user_controller.dart';
import '../Models/LaporanSemuaModel.dart';
import '../Models/PenarikanDanaAdminModel.dart';
import '../Models/PenarikanDanaNasabahModel.dart';
import '../Models/SetorSampahBs.dart';
import '../Models/SetorSampahModel.dart';
import '../Models/SusutSampahAdminModel.dart';
import '../Models/UsersSuperAdminModel.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PDFLaporanSemuaScreen extends StatefulWidget {
  final int kas;
  final int pemblihanbahan;
  final int pengeluaran;
  final int penjualan;
  final int total;
  const PDFLaporanSemuaScreen({
    super.key,
    required this.kas,
    required this.pemblihanbahan,
    required this.pengeluaran,
    required this.penjualan,
    required this.total,
  });

  @override
  State<PDFLaporanSemuaScreen> createState() => _PDFLaporanSemuaScreenState();
}

class _PDFLaporanSemuaScreenState extends State<PDFLaporanSemuaScreen> {
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

  Future getDatas() async {
    // datas = await pdfController.allPenjualan();
    // List _datashutang = await pdfController.allHutang();
    // List pems = await pdfController.allPem();
    // List pengs = await pdfController.allPeng();
    List users = await UsersSuperAdminController().getUsers();
    List userAdmin = await SampahSuperAdminController().getAdmin();
    List userPenimbang = await SampahSuperAdminController().getPenimbang();
    List userNasabah = await SampahSuperAdminController().getNasabah();
    List sampahAdmin = await SampahSuperAdminController().getPenjalanBs();
    List setorSampahNasabah =
        await SampahSuperAdminController().setorSampahNasabahCek();
    List getSusutSampahAdmin =
        await SampahSuperAdminController().getSusutSampahAdmin();
    List penarikanDanaAdmin =
        await SampahSuperAdminController().getPenarikanAdmin();
    List penarikanDanaNasabah =
        await SampahSuperAdminController().getPenarikanNasabah();
    setState(() {
      // penj = datas;
      // pem = pems;
      // peng = pengs;
      // datashutang = _datashutang;
      _users = users;
      _userAdmin = userAdmin;
      _userPenimbang = userPenimbang;
      _userNasabah = userNasabah;
      _sampahAdmin = sampahAdmin;
      _setorSampahNasabah = setorSampahNasabah;
      _getSusutSampahAdmin = getSusutSampahAdmin;
      _penarikanDanaAdmin = penarikanDanaAdmin;
      _penarikanDanaNasabah = penarikanDanaNasabah;
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
          detailSampahBs: category[2000]);
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
      );
    }).toList();

    List<SusutSampahAdminModel> itemsPenjualanSampahInduk =
        _getSusutSampahAdmin.map((category) {
      return SusutSampahAdminModel(
        createdAt: DateTime.parse(category['createdAt']),
        kodeSusutInduk: category["kode_susut_induk"],
        namaPembeli: category['nama_pembeli'],
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
        kodeNasabah: category["kode_nasabah"],
        kodePenimbang: category["kode_penimbang"],
        berat: category["berat"],
        total: category["total"],
      );
    }).toList();

    List<SetorSampahBsModel> itemsSetorSampahAdmin =
        _sampahAdmin.map((category) {
      return SetorSampahBsModel(
        createdAt: DateTime.parse(category['createdAt']),
        kodeSusutSampahBs: category["kode_susut_sampah_bs"],
        kodeAdminBs: category["kode_admin_bs"],
        berat: category["berat"],
        harga: category["harga"],
      );
    }).toList();

    List<PenarikanDanaAdminModel> itemspenarikanDanaAdmin =
        _penarikanDanaAdmin.map((category) {
      return PenarikanDanaAdminModel(
        createdAt: DateTime.parse(category['createdAt']),
        nomorInvoice : category["nomor_invoice"],
        kodeAdmin : category["kode_admin"],
        jumlahPenarikan : category["jumlah_penarikan"],
        
      );
    }).toList();
    List<PenarikanDanaNasabahModel> itemspenarikanDanaNasabah =
        _penarikanDanaNasabah.map((category) {
      return PenarikanDanaNasabahModel(
        createdAt: DateTime.parse(category['createdAt']),
        nomorInvoice : category["nomor_invoice"],
        kodeNasabah : category["kode_nasabah"],
        jumlahPenarikan : category["jumlah_penarikan"],
        
      );
    }).toList();

    final laporan = LaporanSemua(
      userModel: UsersSuperAdmin(
       
          namaSuperAdmin:  _users.length > 0 ? _users[0]["nama_super_admin"] : '',
          alamat:  _users.length > 0 ? _users[0]["alamat"] : ''),
      itemsAdmin: itemsPenggunaAdmin,
      itemsPenimbang: itemsPenggunaPenimbang,
      itemsNasabah: itemsPenggunaNasabah,
      itemsSetorNasabah: itemsSetorSampahNasabah,
      itemsSetorAdmin: itemsSetorSampahAdmin,
      itemsSusutSampahInduk: itemsPenjualanSampahInduk,
      itemspenarikanDanaAdmin: itemspenarikanDanaAdmin,
      itemspenarikanDanaNasabah: itemspenarikanDanaNasabah,
      all: Alls(
          kas: widget.kas,
          pemblihanbahan: widget.pemblihanbahan,
          pengeluaran: widget.pengeluaran,
          // totalhpp: 2929,
          penjualan: widget.penjualan,
          total: widget.total),
    );
    // final laporan = LaporanSemua(
    //   userModel: UserModel(
    //       nama:  users.length > 0 ? users[0]['nama'] : "",
    //       alamat: '${users.length > 0 ? (users[0]['alamat']) : ""} ${users.length > 0 ? (users[0]['kota']) : ""} ${users.length > 0 ? (users[0]['prov']) : ""}'),
    //   items: itemsPembelian,
    //   itemsPengeluaran: itemsPengeluaran,
    //   itemsPenjualan: itemsPenjualans,
    //   itemsHutangPenjualan: itemsHutangPenjualans,
    //   all: Alls(
    //       kas: widget.kas,
    //       pemblihanbahan: widget.pemblihanbahan,
    //       pengeluaran: widget.pengeluaran,
    //       // totalhpp: 2929,
    //       penjualan: widget.penjualan,
    //       total: widget.total),
    // );

    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Preview'),
      ),
      body: PdfPreview(
        build: (context) => PdfLaporanSemuaInduk().generate(laporan),
        pdfFileName: 'LaporanSemua.pdf',
      ),
    );
  }
}
