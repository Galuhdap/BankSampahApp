import 'package:d_chart/commons/config_render.dart';
import 'package:d_chart/commons/data_model.dart';
import 'package:d_chart/ordinal/pie.dart';

import 'package:flutter/material.dart';

import '../../../Components/CardRiwayat.dart';
import '../../../Data/curentFormat.dart';
import '../Controllers/laporanController.dart';

class LaporanPenggunaScreen extends StatefulWidget {
  const LaporanPenggunaScreen({super.key});

  @override
  State<LaporanPenggunaScreen> createState() => _LaporanPenggunaScreenState();
}

class _LaporanPenggunaScreenState extends State<LaporanPenggunaScreen> {
Future<int>? _futureDataNasabah;
Future<int>? _futureDataAdmin;
Future<int>? _futureDataPenimbang;

  Future fetchData() async {
    // int saldoss = await saldoController.allKas();
    // List pembelians = await pembelianController.all();
    // int pengeluarans = await pengeluaranController.all();
    // List pengeluarans2 = await pengeluaranController.allPeng();
    // List penjualans = await transaksiController.all();
    // int penj = await transaksiController.totals();
    // List totalHpp = await produkController.totalHpp();
    // List prTers = await transaksiController.totalProd();
    // List produk = await transaksiController.allProd();
    // totals = await transaksiController.totalSemua();
    setState(() {
      // saldos = saldoss;
      // pembelian = pembelians;
      // pengeluaran = pengeluarans;
      // penjualan = penjualans;
      // _penj = penj;
      // hpp = totalHpp;
      // prTer = prTers;
      // produks = produk;
      // peng = pengeluarans2;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
     _futureDataNasabah =  LaporanSuperAdminController().totalNasabah();
     _futureDataPenimbang =  LaporanSuperAdminController().totalPenimbang();
     _futureDataAdmin =  LaporanSuperAdminController().totalAdmin();
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    print('ini Datas : $_futureDataNasabah');
    // List<OrdinalData> ordinalDataList = [
    //   OrdinalData(
    //       domain: 'Pengeluaran',
    //       measure: pengeluaran,
    //       color: Color(0xFFE91616)),
    //   OrdinalData(
    //     domain: 'Pemasukan',
    //     measure: _penj,
    //     color: Color(0xFF2196F3),
    //   ),
    // ];

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height * 0.9999,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: size.width,
                height: 80,
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
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Total Pengguna',
                              style: TextStyle(
                                color: Color(0xFF333333),
                                fontSize: 15,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                            FutureBuilder<int>(
                              future: LaporanSuperAdminController()
                                  .totalPengguna(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return CircularProgressIndicator();
                                } else {
                                  
                                  return Text(
                                    '${snapshot.data ?? 0} User',
                                    style: TextStyle(
                                      color: Color(0xFF333333),
                                      fontSize: 20,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                      height: 0,
                                    ),
                                  );
                                }
                              },
                            ),
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
                  height: size.height * 0.7,
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
                                    // Navigator.of(context).push(
                                    //     MaterialPageRoute(builder: (context) {
                                    //   return PDFLaporanSemuaScreen(
                                    //     kas: saldos,
                                    //     pengeluaran: peng.length > 0
                                    //         ? (peng[0] != null
                                    //             ? (peng[0]['biaya'] ?? 0)
                                    //             : 0)
                                    //         : 0,
                                    //     penjualan: _penj,
                                    //     pemblihanbahan: pembelian.length > 0
                                    //         ? (pembelian[0] != null
                                    //             ? (pembelian[0]['harga'] ?? 0)
                                    //             : 0)
                                    //         : 0,
                                    //     total: totals,
                                    //   );
                                    // }));
                                  },
                                  child: Container(
                                    width: size.width * 0.20,
                                    height: 29,
                                    decoration: ShapeDecoration(
                                      color: Color(0xFF3F51B5),
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
                          FutureBuilder<int>(
                            future:
                               _futureDataNasabah,
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
                            future:
                                _futureDataPenimbang,
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
                          FutureBuilder<int>(
                            future: _futureDataAdmin,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return CircularProgressIndicator();
                              } else {
                                
                                return contText(size, "Admin Bank Sampah",
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
