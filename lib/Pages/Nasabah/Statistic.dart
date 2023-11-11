import 'package:banksampah_application/Pages/Nasabah/penarikanSaldoScreen.dart';
import 'package:d_chart/commons/config_render.dart';
import 'package:d_chart/commons/data_model.dart';
import 'package:d_chart/d_chart.dart';
import 'package:d_chart/ordinal/pie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../Components/AppBar.dart';
import '../../Components/CardRiwayat.dart';
import '../../Components/MenuKategori.dart';
import '../../Data/curentFormat.dart';
import 'Controllers/user_controller.dart';
import 'Home.dart';
import 'Models/NasabahModel.dart';

class Statistic extends StatefulWidget {
  const Statistic({super.key});

  @override
  State<Statistic> createState() => _StatisticState();
}

class _StatisticState extends State<Statistic> {
  final datas1 = [
    {
      'hasil': 'Penarikan',
      'berat1': 100,
    },
    {
      'hasil': 'Penyetoran',
      'berat1': 300,
    },
  ];

  Future<List<dynamic>>? _futureData;
  int _penyetoran = 0;
  int _penarikan = 0;

  Future fetchData() async {
    int penyetoran = await UserControllerNasabah().totalPenyetoran();
    int penarikan = await UserControllerNasabah().totalpenarikan();
    setState(() {
      _penyetoran  = penyetoran;
      _penarikan = penarikan;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _futureData = UserControllerNasabah().riwayatSetorSampah();
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('ini Setor: $_penyetoran');
    print('ini Tarik: $_penarikan');
    var size = MediaQuery.of(context).size;

    List<OrdinalData> ordinalDataList = [
      OrdinalData(
          domain: 'Pengeluaran', measure: _penarikan, color: Color(0xFFFF3333)),
      OrdinalData(
        domain: 'Pemasukan',
        measure: _penyetoran,
        color: Color(0xFF4CAF50),
      ),
    ];
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          appbar3(context, size, '', () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (builde) {
                  return HomeNasabahScreen();
                },
              ),
            );
          }),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 0, bottom: 7),
              child: Container(
                width: 250,
                height: 250,
                child: Stack(
                  children: [
                    Center(
                      child: Container(
                        width: size.width * 0.6,
                        height: 700,
                        child: DChartPieO(
                          data: ordinalDataList,
                          configRenderPie: const ConfigRenderPie(
                            arcWidth: 30,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '400 Kg',
                            style: TextStyle(
                              color: Color(0xFF333333),
                              fontSize: 32,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'Sampah Terkumpul',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF333333),
                              fontSize: 11,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 100, right: 100),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 17,
                      height: 17,
                      decoration: BoxDecoration(color: Color(0xFF4CAF50)),
                    ),
                    Padding(padding: EdgeInsets.only(left: 5)),
                    Text(
                      'Penyetoran',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF333333),
                        fontSize: 11,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: size.width * 0.02,
                ),
                Row(
                  children: [
                    Container(
                      width: 17,
                      height: 17,
                      decoration: BoxDecoration(color: Color(0xFFFF3333)),
                    ),
                    SizedBox(
                      width: size.width * 0.0111,
                    ),
                    Text(
                      'Penarikan',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF333333),
                        fontSize: 11,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
              child: Container(
                width: 428,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 0.25,
                      strokeAlign: BorderSide.strokeAlignCenter,
                      color: Color(0xFF5C5C5C),
                    ),
                  ),
                ),
              )),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 15, right: 20),
            // padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                menuKategori1(
                  [
                    subMenu1(size, 'assets/img/trash.png', '0Kg',
                        'Kapasitas \nBank Sampah', () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (builde) {
                      //       return KapasiatasSampah();
                      //     },
                      //   ),
                      // ).then((value) {
                      //   setState(() {});
                      // });
                    }, Colors.grey),
                    FutureBuilder<List<dynamic>>(
                      future: UserControllerNasabah().getUsers(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: Container());
                        } else {
                          final List<dynamic> nasabah = snapshot.data!;
                          final saldoHariini =
                              nasabah[0]['DetailSampahNasabahs'][0]['saldo'];
                          return subMenu1(
                              size,
                              'assets/img/wallets.png',
                              CurrencyFormat.convertToIdr(saldoHariini, 0),
                              'Saldo Terkumpul', () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (builde) {
                                  return PenarikanSaldo();
                                },
                              ),
                            ).then((value) {
                              setState(() {});
                            });
                          }, Colors.green);
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 35, top: 20, right: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Aktivitas Setor Sampah ',
                  style: TextStyle(
                    color: Color(0xFF333333),
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Container(
                width: size.width * 0.9,
                height: size.height * 0.5,
                decoration: ShapeDecoration(
                  color: Color(0xFFDCEAE7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Color(0x28000000),
                      blurRadius: 1,
                      offset: Offset(0, 0),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: FutureBuilder<List<dynamic>>(
                  future: _futureData,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data!.length == 0) {
                        return Padding(
                          padding: EdgeInsets.only(
                              top: size.height * 0.2,
                              bottom: size.height * 0.21),
                          child: Center(
                            child: Text("DATA KOSONG"),
                          ),
                        );
                      }
                      final nasabah = snapshot.data!;
                      return Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Container(
                          width: size.width * 0.9,
                          height: size.height * 0.8,
                          child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            padding: EdgeInsets.only(top: 10),
                            itemCount: nasabah.length,
                            itemBuilder: (BuildContext context, index) {
                              return cardRiwayatSampah(
                                size,
                                Colors.green,
                                'Setor Sampah',
                                snapshot.data![index]["berat"].toString(),
                                '${snapshot.data![index]["JenisBarang"]["jenis_barang"]}',
                                CurrencyFormat.convertToIdr(
                                    snapshot.data![index]["total"], 0),
                                Colors.green,
                              );
                            },
                          ),
                        ),
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(
                          color: Colors.blue,
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
