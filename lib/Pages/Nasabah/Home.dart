import 'package:banksampah_application/Pages/Nasabah/Controllers/user_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Components/AppBar.dart';
import '../../Components/PointCard.dart';
import '../../Data/curentFormat.dart';
import '../Login/login.dart';
import 'Models/NasabahModel.dart';
import 'Statistic.dart';

class HomeNasabahScreen extends StatefulWidget {
  const HomeNasabahScreen({super.key});

  @override
  State<HomeNasabahScreen> createState() => _HomeNasabahScreenState();
}

class _HomeNasabahScreenState extends State<HomeNasabahScreen> {
  UserControllerNasabah userControllerNasabah = UserControllerNasabah();
  Future<List<dynamic>>? _futureData;
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
    _futureData = UserControllerNasabah().riwayatSetorSampah();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    var beritaTerkini = [
      "assets/img/banner1.png",
    ];
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(top: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBarNew(size, () {
                removeToken();
              }),
              FutureBuilder<List<dynamic>>(
                future: UserControllerNasabah().getUsers(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    final List<dynamic> nasabah = snapshot.data!;
                    final namaNasabah = nasabah[0]['nama_nasabah'];
                    final kodeNasabah = nasabah[0]['kode_nasabah'];
                    final totalSampah =
                        nasabah[0]['DetailSampahNasabahs'][0]['berat'];
                    final saldoHariini =
                        nasabah[0]['DetailSampahNasabahs'][0]['saldo'];

                    return PoinCard2(
                        size,
                        'Hi, $namaNasabah',
                        'Kode Nasabah : $kodeNasabah',
                        '$totalSampah Kg',
                        CurrencyFormat.convertToIdr(saldoHariini, 0));
                  }
                },
              ),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 20, top: 30),
                    //   child: Text(
                    //     'Berita Terkini',
                    //     style: TextStyle(
                    //       color: Color(0xFF333333),
                    //       fontSize: 14,
                    //       fontFamily: 'Poppins',
                    //       fontWeight: FontWeight.w500,
                    //     ),
                    //   ),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.only(top: 10),
                    //   child: CarouselSlider(
                    //     options: CarouselOptions(
                    //       height: size.height * 0.2,
                    //       autoPlay: true,
                    //       autoPlayInterval: const Duration(seconds: 3),
                    //       autoPlayAnimationDuration:
                    //           const Duration(milliseconds: 800),
                    //       autoPlayCurve: Curves.fastOutSlowIn,
                    //       pauseAutoPlayOnTouch: true,
                    //       enlargeCenterPage: true,
                    //       viewportFraction: 0.9,
                    //     ),
                    //     items: beritaTerkini.map((title) {
                    //       return Container(
                    //         decoration: BoxDecoration(
                    //           color: Colors.white,
                    //           borderRadius: BorderRadius.circular(10),
                    //           image: DecorationImage(
                    //             image: AssetImage(title),
                    //           ),
                    //         ),
                    //       );
                    //     }).toList(),
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 20, bottom: 20, left: 20, right: 20),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (builde) {
                                return Statistic();
                              },
                            ),
                          ).then((value) {
                            setState(() {});
                          });
                        },
                        child: Container(
                          width: size.width * 0.9,
                          height: 86,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            shadows: [
                              BoxShadow(
                                color: Color.fromARGB(40, 0, 0, 0),
                                blurRadius: 19,
                                offset: Offset(3, 0),
                                spreadRadius: -8,
                              )
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/img/money-w.png',
                                width: 50,
                                height: 50,
                              ),
                              SizedBox(
                                width: size.width * 0.05,
                              ),
                              Text(
                                'Pencairan Dana',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF333333),
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
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
            ],
          ),
        ),
      ),
    );
  }
}
