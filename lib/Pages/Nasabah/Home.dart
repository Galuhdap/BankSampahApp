import 'package:banksampah_application/Data/ColorsData.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../Components/AppBar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    var beritaTerkini = [
      "assets/img/banner1.png",
    ];
    return Scaffold(
      appBar: appbar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Stack(children: [
                  Container(
                    width: size.width * 0.9,
                    height: 196,
                    decoration: BoxDecoration(
                      color: color1,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x28000000),
                          blurRadius: 17,
                          offset: Offset(0, 0),
                          spreadRadius: 3,
                        )
                      ],
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          left: 225,
                          top: 52,
                          child: Container(
                            width: 220,
                            height: 220,
                            decoration: ShapeDecoration(
                              color: Color(0xB22A9235),
                              shape: OvalBorder(),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 254,
                          top: 81,
                          child: Container(
                            width: 162,
                            height: 162,
                            decoration: ShapeDecoration(
                              color: Color(0xFF2A9235),
                              shape: OvalBorder(),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 320,
                          top: 95,
                          child: Image.asset(
                            'assets/img/refresh.png',
                            width: 21,
                            height: 21,
                          ),
                        ),
                        Positioned(
                            left: 265,
                            top: 25,
                            child: Container(
                              width: 80,
                              height: 17,
                              decoration: ShapeDecoration(
                                color: Color(0xFFFFC107),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'Point Card',
                                  style: TextStyle(
                                    color: Color(0xFF333333),
                                    fontSize: 11,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            )),
                        Padding(
                          padding: const EdgeInsets.only(top: 25, left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Hi, Galuh DAP',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Opacity(
                                opacity: 0.60,
                                child: Text(
                                  'Kode Nasabah : 5233',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                  '12,6 Kg',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 40,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Text(
                                'Sampah Terkumpul',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18, top: 155),
                    child: Container(
                      width: 336,
                      height: 75,
                      decoration: ShapeDecoration(
                        color: Color(0xFFDCEAE7),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Row(
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  'assets/img/icons1.png',
                                  width: 36,
                                  height: 36,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 15, left: 25),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        'Konversi Hari ini',
                                        style: TextStyle(
                                          color: Color(0xFF333333),
                                          fontSize: 10,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        '1,5 Kg',
                                        style: TextStyle(
                                          color: Color(0xFF333333),
                                          fontSize: 24,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: Container(
                                width: 1,
                                height: 60,
                                decoration: ShapeDecoration(
                                  color: Color(0xFFDCEAE7),
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      width: 0.50,
                                      strokeAlign: BorderSide.strokeAlignCenter,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/img/rupiah.png',
                                  width: 36,
                                  height: 36,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 15, left: 18),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        'Penghasilan',
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          color: Color(0xFF333333),
                                          fontSize: 10,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        '23.000',
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          color: Color(0xFF333333),
                                          fontSize: 24,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ]),
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
                            height: 165,
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
                              width: 49,
                              height: 18,
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
                                scrollDirection: Axis.vertical,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: Column(
                                      children: [
                                        cardRiwayat(),
                                        cardRiwayat(),
                                        cardRiwayat(),
                                        cardRiwayat(),
                                        cardRiwayat(),
                                        cardRiwayat(),
                                      ],
                                    ),
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

class cardRiwayat extends StatelessWidget {
  const cardRiwayat({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: 7),
      child: Stack(
        children: [
          Container(
            width: 345,
            height: 58,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(10),
              ),
              shadows: [
                BoxShadow(
                  color: Color(0x19000000),
                  blurRadius: 17,
                  offset: Offset(0, 0),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Padding(
              padding:
                  const EdgeInsets.only(right: 15),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15),
                    child: Container(
                      width: 15,
                      height: 15,
                      decoration: ShapeDecoration(
                        color: Color(0xFFE20000),
                        shape: OvalBorder(),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment:
                        MainAxisAlignment.center,
                    crossAxisAlignment:
                        CrossAxisAlignment.end,
                    children: [
                      Text(
                        '-5.0000000',
                        style: TextStyle(
                          color: Color(0xFFE20000),
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight:
                              FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 50,
            top: 18,
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center,
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  'Penarikan Saldo',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  '23 Juni 2023 - 14:30',
                  style: TextStyle(
                    color: Color(0xFF7F7F7F),
                    fontSize: 7,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
