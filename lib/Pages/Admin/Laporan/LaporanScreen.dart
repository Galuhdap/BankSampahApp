import 'package:d_chart/commons/config_render.dart';
import 'package:d_chart/commons/data_model.dart';
import 'package:d_chart/ordinal/pie.dart';

import 'package:flutter/material.dart';

import '../../../Components/AppBar.dart';
import '../../../Components/CardRiwayat.dart';
import '../../../Data/curentFormat.dart';
import '../../SuperAdmin/Controllers/laporanController.dart';
import '../../SuperAdmin/Controllers/user_controller.dart';
import '../../SuperAdmin/Models/SuperAdminModels.dart';
import '../controller/LaporanAdminController.dart';
import '../controller/userController.dart';
import 'PdfLaporanScreen.dart';

class LaporanAdminScreen extends StatefulWidget {
  const LaporanAdminScreen({super.key});

  @override
  State<LaporanAdminScreen> createState() => _LaporanAdminScreenState();
}

class _LaporanAdminScreenState extends State<LaporanAdminScreen> {
  Future<int>? _futureDataNasabah;
  Future<int>? _futureDataPenimbang;

  num totals = 0;
  int totalSampahMasuk = 0;
  int saldoMasuk = 0;
  int saldoKeluar = 0;
  int saldo = 0;

  Future fetchData() async {
    saldoMasuk = await LaporanAdminController().getsaldoMasuk();
    saldo = await LaporanAdminController().totalSaldo();
    saldoKeluar = await LaporanAdminController().getsaldoKeluar();
    totals = await LaporanAdminController().totalSampahBS();

    totalSampahMasuk = await LaporanAdminController().getsampahMasuk();

    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    fetchData();
    _futureDataNasabah = LaporanAdminController().totalNasabah();
    _futureDataPenimbang = LaporanAdminController().totalPenimbang();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('ini sampah masuk $totals');
    var size = MediaQuery.of(context).size;
    List<OrdinalData> ordinalDataList = [
      OrdinalData(
          domain: 'Pengeluaran',
          measure: saldoKeluar,
          color: Color(0xFFE91616)),
      OrdinalData(
        domain: 'Pemasukan',
        measure: saldoMasuk,
        color: Color(0xFF2196F3),
      ),
    ];

    return Scaffold(
      body: Container(
        width: size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 16,
                      offset: Offset(0, 0),
                      spreadRadius: -6,
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            appbar3(context, size, 'Laporan', () {
                              Navigator.pop(context);
                            }),
                            // Text(
                            //   'Nominal Keseluruhan',
                            //   style: TextStyle(
                            //     color: Color(0xFF333333),
                            //     fontSize: 15,
                            //     fontFamily: 'Poppins',
                            //     fontWeight: FontWeight.w400,
                            //     height: 0,
                            //   ),
                            // ),
                            // FutureBuilder<SuperAdmin?>(
                            //   future: UsersSuperAdminController().getUser(),
                            //   builder: (context, snapshot) {
                            //     if (snapshot.connectionState ==
                            //         ConnectionState.waiting) {
                            //       return Center(
                            //           child: CircularProgressIndicator());
                            //     } else {
                            //       final superAdmin = snapshot.data!;
                            //       final saldo = superAdmin
                            //           .row[0].detailSampahSuperAdmins![0].saldo;
                            //       return Text(
                            //         CurrencyFormat.convertToIdr(saldo, 0),
                            //         style: TextStyle(
                            //           color: Color(0xFF333333),
                            //           fontSize: 20,
                            //           fontFamily: 'Poppins',
                            //           fontWeight: FontWeight.w600,
                            //           height: 0,
                            //         ),
                            //       );
                            //     }
                            //   },
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: SizedBox(
                  width: size.width,
                  height: size.height * 0.89,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    padding: EdgeInsets.only(top: 10),
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 30, right: 30, top: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Statistik',
                                  style: TextStyle(
                                    color: Color(0xFF333333),
                                    fontSize: 16,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) {
                                      return PDFLaporanAdminScreen(
                                        kas: saldo,
                                        pengeluaran: totalSampahMasuk,
                                        penjualan: totals,
                                        pemblihanbahan: totalSampahMasuk,
                                      );
                                    }));
                                  },
                                  child: Container(
                                    width: size.width * 0.20,
                                    height: 29,
                                    decoration: ShapeDecoration(
                                      color: Colors.green,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 11, right: 11),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Icon(
                                            Icons.file_download_outlined,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                          Text(
                                            'PDF',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w400,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: size.width * 0.5,
                                  height: 200,
                                  child: DChartPieO(
                                    data: ordinalDataList,
                                    configRenderPie: const ConfigRenderPie(
                                      arcWidth: 30,
                                    ),
                                  ),
                                ),
                                Column(
                                  children: [
                                    Container(
                                      width: size.width * 0.35,
                                      height: 65,
                                      decoration: ShapeDecoration(
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        shadows: [
                                          BoxShadow(
                                            color: Color(0x3F000000),
                                            blurRadius: 16,
                                            offset: Offset(0, 0),
                                            spreadRadius: -6,
                                          )
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 13, top: 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  width: 10,
                                                  height: 10,
                                                  decoration: ShapeDecoration(
                                                    color: Color(0xFF2196F3),
                                                    shape: OvalBorder(),
                                                  ),
                                                ),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 5)),
                                                Text(
                                                  'Saldo Masuk',
                                                  style: TextStyle(
                                                    color: Color(0xFF333333),
                                                    fontSize: 13,
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            FutureBuilder<int>(
                                              future: LaporanAdminController()
                                                  .getsaldoMasuk(),
                                              builder: (context, snapshot) {
                                                if (snapshot.connectionState ==
                                                    ConnectionState.waiting) {
                                                  return CircularProgressIndicator();
                                                } else {
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 10),
                                                    child: Text(
                                                      CurrencyFormat
                                                          .convertToIdr(
                                                              snapshot.data ??
                                                                  0,
                                                              0),
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xFF333333),
                                                        fontSize: 15,
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        height: 1.15,
                                                      ),
                                                    ),
                                                  );
                                                }
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(padding: EdgeInsets.only(top: 15)),
                                    Container(
                                      width: size.width * 0.35,
                                      height: 65,
                                      decoration: ShapeDecoration(
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        shadows: [
                                          BoxShadow(
                                            color: Color(0x3F000000),
                                            blurRadius: 16,
                                            offset: Offset(0, 0),
                                            spreadRadius: -6,
                                          )
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 13, top: 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  width: 10,
                                                  height: 10,
                                                  decoration: ShapeDecoration(
                                                    color: Color(0xFFE91616),
                                                    shape: OvalBorder(),
                                                  ),
                                                ),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 5)),
                                                Text(
                                                  'Saldo Keluar',
                                                  style: TextStyle(
                                                    color: Color(0xFF333333),
                                                    fontSize: 13,
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            FutureBuilder<int>(
                                              future: LaporanAdminController()
                                                  .getsaldoKeluar(),
                                              builder: (context, snapshot) {
                                                if (snapshot.connectionState ==
                                                    ConnectionState.waiting) {
                                                  return CircularProgressIndicator();
                                                } else {
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 10),
                                                    child: Text(
                                                      CurrencyFormat
                                                          .convertToIdr(
                                                              snapshot.data ??
                                                                  0,
                                                              0),
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xFF333333),
                                                        fontSize: 15,
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        height: 1.15,
                                                      ),
                                                    ),
                                                  );
                                                }
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          FutureBuilder<List<dynamic>>(
                              future: UserControllerAdmin().getUser(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Center(
                                      child: CircularProgressIndicator());
                                } else {
                                  // var admin = snapshot.data!.['nama_bs'];
                                  final List<dynamic> filteredData =
                                      snapshot.data!;
                                  final saldo = filteredData[0]
                                      ['DetailSampahBs'][0]['saldo'];
                                  return contText(
                                    size,
                                    "Saldo Nasabah",
                                    CurrencyFormat.convertToIdr(saldo, 0),
                                  );
                                }
                              }),
                          FutureBuilder<List<dynamic>>(
                              future: UserControllerAdmin().getUser(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Center(
                                      child: CircularProgressIndicator());
                                } else {
                                  // var admin = snapshot.data!.['nama_bs'];
                                  final List<dynamic> filteredData =
                                      snapshot.data!;
                                  final saldo = filteredData[0]
                                      ['DetailSampahBs'][0]['saldo_sekarang'];
                                  return contText(
                                    size,
                                    "Saldo Keuntungan",
                                    CurrencyFormat.convertToIdr(saldo, 0),
                                  );
                                }
                              }),
                          FutureBuilder<int>(
                            future: LaporanAdminController().getsampahMasuk(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return CircularProgressIndicator();
                              } else {
                                return contText(
                                  size,
                                  "Total Sampah Masuk",
                                  '${snapshot.data ?? 0} Kg',
                                );
                              }
                            },
                          ),
                           FutureBuilder<List<dynamic>>(
                              future: UserControllerAdmin().getUser(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Center(
                                      child: CircularProgressIndicator());
                                } else {
                                  // var admin = snapshot.data!.['nama_bs'];
                                  final List<dynamic> filteredData =
                                      snapshot.data!;
                                  final totalsampah =
                          filteredData[0]['DetailSampahBs'][0]['berat'];
                                  return contText(
                                    size,
                                     "Sampah Admin Sekarang",
                                  '${totalsampah ?? 0} Kg',
                                  );
                                }
                              }),
                          FutureBuilder<int>(
                            future: _futureDataNasabah,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return CircularProgressIndicator();
                              } else {
                                print(snapshot.data);
                                return contText(size, "Nasabah",
                                    '${snapshot.data ?? 0} User');
                              }
                            },
                          ),
                          FutureBuilder<int>(
                            future: _futureDataPenimbang,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return CircularProgressIndicator();
                              } else {
                                return contText(size, "Penimbang",
                                    '${snapshot.data ?? 0} User');
                              }
                            },
                          ),
                          Container(
                            width: size.width * 0.87,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 0.20,
                                  strokeAlign: BorderSide.strokeAlignCenter,
                                  color: Color(0xFFA8A8A8),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding isiProKel(ttl, jmlh, hrg) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            ttl,
            style: TextStyle(
              color: Color(0xFFA8A8A8),
              fontSize: 12,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            jmlh,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFFA8A8A8),
              fontSize: 12,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            hrg,
            textAlign: TextAlign.right,
            style: TextStyle(
              color: Color(0xFFA8A8A8),
              fontSize: 12,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
