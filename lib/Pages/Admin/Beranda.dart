
import 'package:banksampah_application/Pages/Admin/ListNasabah.dart';
import 'package:banksampah_application/Pages/Admin/ListPengepul.dart';
import 'package:banksampah_application/Pages/Admin/Models/AdminModel.dart';
import 'package:banksampah_application/Pages/Login/login.dart';
import 'package:banksampah_application/Pages/Penimbang/Setor_Sampah.dart';
import 'package:banksampah_application/Pages/SuperAdmin/JualSampah/SelectJual.dart';
import 'package:banksampah_application/Pages/SuperAdmin/SusutSampah/SusutSampah.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Components/AppBar.dart';
import '../../Components/MenuKategori.dart';
import '../../Components/PointCard.dart';
import '../../Data/curentFormat.dart';
import 'Kas/CatatanPengeluaran.dart';
import 'Laporan/LaporanScreen.dart';
import 'ListPenarikanKeuntungan.dart';
import 'ListPenarikanSaldo.dart';
import 'ListPenarikanSaldoBS.dart';
import 'ListPenjualanSampah.dart';
import 'Register/register.dart';
import 'SetorSampahNasabah.dart';
import 'SusutSampah/SusutSampah.dart';
import 'controller/userController.dart';

class BerandaAdmin extends StatefulWidget {
  const BerandaAdmin({super.key});

  @override
  State<BerandaAdmin> createState() => _BerandaAdminState();
}

class _BerandaAdminState extends State<BerandaAdmin> {
  Future<List<dynamic>>? _futureData;

  Future<void> removeToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return LoginScreen();
        },
      ),
      (_) => false,
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    // _futureData = UserControllerAdmin().getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBarNew(size, () {
                removeToken();
              }),
              FutureBuilder<List<dynamic>>(
                  future: UserControllerAdmin().getUser(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      // var admin = snapshot.data!.['nama_bs'];
                      final List<dynamic> filteredData = snapshot.data!;
                      final namaAdmin = filteredData[0]['nama_bs'];
                      final kodeAdmin = filteredData[0]['kode_admin'];
                      final totalsampah =
                          filteredData[0]['DetailSampahBs'][0]['berat'];
                      final saldo =
                          filteredData[0]['DetailSampahBs'][0]['saldo'];
                      final saldos = filteredData[0]['DetailSampahBs'][0]
                          ['saldo_sekarang'];
                      final saldoKeuntungan = filteredData[0]['DetailSampahBs'][0]
                          ['keuntungan_cash'];
                      final saldoCash = filteredData[0]['DetailSampahBs'][0]
                          ['saldo_cash'];
                      return PoinCard4(
                          size,
                          'Hi, $namaAdmin',
                          'Kode Admin : ${kodeAdmin}',
                          '$totalsampah Kg',
                          CurrencyFormat.convertToIdr(saldo, 0),
                          CurrencyFormat.convertToIdr(saldoKeuntungan, 0),
                          'Saldo Keuntungan',
                          'Keuntungan Cash',
                          'Saldo Penjualan',
                          CurrencyFormat.convertToIdr(saldos, 0),
                          'Saldo Penjualan Cash',
                           CurrencyFormat.convertToIdr(saldoCash, 0));
                    }
                  }),
              Padding(
                padding: const EdgeInsets.only(left: 28, top: 20),
                child: Text(
                  'Menu Kategori',
                  style: TextStyle(
                    color: Color(0xFF333333),
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 35, top: 15, right: 35),
                child: Column(
                  children: [
                    menuKategori(
                      [
                        subMenu(size, 'assets/img/listnas.png', 'LIST NASABAH',
                            () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (builde) {
                                return ListNasabahScreen();
                              },
                            ),
                          ).then((value) {
                            setState(() {});
                          });
                        }),
                        subMenu(
                          size,
                          'assets/img/regnas.png',
                          'TAMBAH\nPENGGUNA',
                          () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (builde) {
                                  return TambahPengguna();
                                },
                              ),
                            ).then((value) {
                              setState(() {});
                            });
                          },
                        ),
                      ],
                    ),
                    menuKategori(
                      [
                        subMenu(size, 'assets/img/listpe.png', 'LIST PENGEPUL',
                            () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (builde) {
                                return ListPenimbangScreen();
                              },
                            ),
                          ).then((value) {
                            setState(() {});
                          });
                        }),
                        subMenu(size, 'assets/img/money.png',
                            'List PENARIKAN\nSALDO BS', () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (builde) {
                                return ListPenarikanSaldoBSScreen();
                              },
                            ),
                          ).then((value) {
                            setState(() {});
                          });
                        }),
                      ],
                    ),
                    menuKategori(
                      [
                        subMenu(size, 'assets/img/recycle.png',
                            'LIST SETOR\nSAMPAH', () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (builde) {
                                return SetorSampahScreen();
                              },
                            ),
                          ).then((value) {
                            setState(() {});
                          });
                        }),
                        subMenu(size, 'assets/img/money-w.png',
                            'VALIDASI PENARIKAN SALDO', () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (builde) {
                                return ListPenarikanSaldoScreen();
                              },
                            ),
                          ).then((value) {
                            setState(() {});
                          });
                        }),
                        // subMenu(size, 'assets/img/money-w.png',
                        //     '', () async {
                        //   Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (builde) {
                        //         return ListPenarikanSaldoScreen();
                        //       },
                        //     ),
                        //   ).then((value) {
                        //     setState(() {});
                        //   });
                        // }),
                      ],
                    ),
                    menuKategori(
                      [
                        subMenu(size, 'assets/img/rupiah.png', 'LIST PENARIKAN KEUNTUNGAN',
                            () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (builde) {
                                return ListPenarikanKeuntunganScreen();
                              },
                            ),
                          ).then((value) {
                            setState(() {});
                          });
                        }),
                        subMenu(size, 'assets/img/ceklist.png', 'CATAT PENGELUARAN',
                            () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (builde) {
                                return CatatanPengeluaranAdminScreen();
                              },
                            ),
                          ).then((value) {
                            setState(() {});
                          });
                        }),
                      ],
                    ),
                    menuKategori(
                      [
                        subMenu(size, 'assets/img/gram.png', 'SAMPAH TERJUAL',
                            () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (builde) {
                                return ListPenjualanSampahScreen();
                              },
                            ),
                          ).then((value) {
                            setState(() {});
                          });
                        }),
                        subMenu(size, 'assets/img/books.png', 'LAPORAN',
                            () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (builde) {
                                return LaporanAdminScreen();
                              },
                            ),
                          ).then((value) {
                            setState(() {});
                          });
                        }),
                      ],
                    ),
                    const SizedBox(height: 15.0)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
