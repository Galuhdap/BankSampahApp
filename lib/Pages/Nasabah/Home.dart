import 'package:banksampah_application/Pages/Nasabah/Controllers/user_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Components/AppBar.dart';
import '../../Components/CardRiwayat.dart';
import '../../Components/PointCard.dart';
import '../Login/login.dart';
import 'Models/NasabahModel.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  UserControllerNasabah userControllerNasabah = UserControllerNasabah();
  Future<void> removeToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
        await prefs.remove('role');
    await prefs.remove('kodeReg');
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    var beritaTerkini = [
      "assets/img/banner1.png",
    ];
    return Scaffold(
      appBar: appbar(() {
        removeToken();
      }),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FutureBuilder<NasabahModel?>(
                future: UserControllerNasabah().getUser(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    final nasabah = snapshot.data!;
                    final namaNasabah = nasabah.row[0].namaNasabah;
                    final kodeNasabah = nasabah.row[0].kodeNasabah;
                    final totalSampah = nasabah.row[0].detailSampahNasabahs[0].berat;
                    final sampahharini = nasabah.row[0].detailSampahNasabahs[0].beratSekarang;
                    final saldoHariini = nasabah.row[0].detailSampahNasabahs[0].saldo;
                   
                    return PoinCard(
                      size,
                      'Hi, $namaNasabah',
                      'Kode Nasabah : $kodeNasabah',
                      '$totalSampah Kg',
                      '$sampahharini Kg',
                      '$saldoHariini',
                      Image.asset(
                        'assets/img/refresh.png',
                        width: 21,
                        height: 21,
                      ),
                    );
                  }
                },
              ),
              Center(
                child: SizedBox(
                  height: 400,
                  width: 500,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 35, top: 20),
                        child: Text(
                          'Berita Terkini',
                          style: TextStyle(
                            color: Color(0xFF333333),
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: CarouselSlider(
                          options: CarouselOptions(
                            height: size.height * 0.2,
                            autoPlay: true,
                            autoPlayInterval: const Duration(seconds: 3),
                            autoPlayAnimationDuration:
                                const Duration(milliseconds: 800),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            pauseAutoPlayOnTouch: true,
                            enlargeCenterPage: true,
                            viewportFraction: 0.9,
                          ),
                          items: beritaTerkini.map((title) {
                            return Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: AssetImage(title),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 35, top: 20, right: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Riwayat Aktivitas',
                              style: TextStyle(
                                color: Color(0xFF333333),
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Container(
                              width: size.width * 0.15,
                              height: size.height * 0.02,
                              decoration: ShapeDecoration(
                                color: Color(0xFFFFC107),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                              child: Center(
                                child: Text(
                                  'See all',
                                  style: TextStyle(
                                    color: Color(0xFF333333),
                                    fontSize: 11,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Container(
                            width: size.width * 0.9,
                            height: 344,
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
                            child: SizedBox(
                              height: 344,
                              width: 345,
                              child: ListView(
                                padding: EdgeInsets.only(top: 1),
                                scrollDirection: Axis.vertical,
                                children: [
                                   Column(
                                      children: [
                                        cardRiwayat(
                                          size,
                                          Color(0xFFE20000),
                                          'Penarikan Saldo',
                                          '23 Juni 2023 - 14:30',
                                          '-5.0000000',
                                          Color(0xFFE20000),
                                        ),
                                        cardRiwayat(
                                          size,
                                          Color(0xFFE20000),
                                          'Penarikan Saldo',
                                          '23 Juni 2023 - 14:30',
                                          '-5.0000000',
                                          Color(0xFFE20000),
                                        ),
                                        cardRiwayat(
                                          size,
                                          Color(0xFFE20000),
                                          'Penarikan Saldo',
                                          '23 Juni 2023 - 14:30',
                                          '-5.0000000',
                                          Color(0xFFE20000),
                                        ),
                                        cardRiwayat(
                                          size,
                                          Color(0xFFE20000),
                                          'Penarikan Saldo',
                                          '23 Juni 2023 - 14:30',
                                          '-5.0000000',
                                          Color(0xFFE20000),
                                        ),
                                      ],
                                    ),
                                  
                                ],
                              ),
                            ),
                          ),
                        ),
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
}
