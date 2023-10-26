import 'package:d_chart/commons/config_render.dart';
import 'package:d_chart/commons/data_model.dart';
import 'package:d_chart/ordinal/pie.dart';

import 'package:flutter/material.dart';

import '../../../Components/CardRiwayat.dart';
import '../../../Data/curentFormat.dart';
import '../Controllers/laporanController.dart';

class LaporanSampahScreen extends StatefulWidget {
  const LaporanSampahScreen({super.key});

  @override
  State<LaporanSampahScreen> createState() => _LaporanSampahScreenState();
}

class _LaporanSampahScreenState extends State<LaporanSampahScreen> {
 
  int _penj = 0;
  int saldos = 0;
  List pembelian = [];
  int pengeluaran = 0;
  List penjualan = [];
  List peng = [];

  List hpp = [];
  List prTer = [];
  List produks = [];

  int totals = 0;

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
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    List<OrdinalData> ordinalDataList = [
      OrdinalData(
          domain: 'Pengeluaran',
          measure: pengeluaran,
          color: Color(0xFFE91616)),
      OrdinalData(
        domain: 'Pemasukan',
        measure: _penj,
        color: Color(0xFF2196F3),
      ),
    ];

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
                              'Total Seluruh Sampah',
                              style: TextStyle(
                                color: Color(0xFF333333),
                                fontSize: 15,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                            Text(
                              CurrencyFormat.convertToIdr(totals, 0),
                              style: TextStyle(
                                color: Color(0xFF333333),
                                fontSize: 20,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                height: 0,
                              ),
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
                                                  'Nasabah',
                                                  style: TextStyle(
                                                    color: Color(0xFF333333),
                                                    fontSize: 13,
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            // FutureBuilder<int>(
                                            //   future:
                                            //       transaksiController.totals(),
                                            //   builder: (context, snapshot) {
                                            //     if (snapshot.connectionState ==
                                            //         ConnectionState.waiting) {
                                            //       return CircularProgressIndicator();
                                            //     } else {
                                            //       return Padding(
                                            //         padding:
                                            //             const EdgeInsets.only(
                                            //                 top: 10),
                                            //         child: Text(
                                            //           CurrencyFormat
                                            //               .convertToIdr(
                                            //                   snapshot.data, 0),
                                            //           style: TextStyle(
                                            //             color:
                                            //                 Color(0xFF333333),
                                            //             fontSize: 15,
                                            //             fontFamily: 'Poppins',
                                            //             fontWeight:
                                            //                 FontWeight.w500,
                                            //             height: 1.15,
                                            //           ),
                                            //         ),
                                            //       );
                                            //     }
                                            //   },
                                            // ),
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
                                                  'Admin BS',
                                                  style: TextStyle(
                                                    color: Color(0xFF333333),
                                                    fontSize: 13,
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10),
                                              child: Text(
                                                CurrencyFormat.convertToIdr(
                                                    pengeluaran, 0),
                                                style: TextStyle(
                                                  color: Color(0xFF333333),
                                                  fontSize: 15,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w500,
                                                  height: 1.15,
                                                ),
                                              ),
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
                          //  FutureBuilder<int>(
                          //   future:
                          //       LaporanSuperAdminController().totalNasabah(),
                          //   builder: (context, snapshot) {
                          //     if (snapshot.connectionState ==
                          //         ConnectionState.waiting) {
                          //       return CircularProgressIndicator();
                          //     } else {
                          //       print(snapshot.data ?? 0);
                          //       return contText(
                          //         size,
                          //         "Total Sampah Nasabah",
                          //         '${snapshot.data ?? 0} Kg',
                          //       );
                          //     }
                          //   },
                          // ),
                           FutureBuilder<int>(
                            future:
                                LaporanSuperAdminController().totalSampahBS(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return CircularProgressIndicator();
                              } else {
                                print(snapshot.data ?? 0);
                                return contText(
                                  size,
                                  "Total Sampah Admin Bank Sampah",
                                  '${snapshot.data ?? 0} Kg',
                                );
                              }
                            },
                          ),
                           FutureBuilder<int>(
                            future:
                                LaporanSuperAdminController().totalSampahInduk(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return CircularProgressIndicator();
                              } else {
                                print(snapshot.data ?? 0);
                                return contText(
                                  size,
                                  "Total Sampah Bank Sampah Induk",
                                  '${snapshot.data ?? 0} Kg',
                                );
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
