import 'package:banksampah_application/Pages/SuperAdmin/JualSampah/SelectJual.dart';
import 'package:banksampah_application/Pages/SuperAdmin/Models/SuperAdminModels.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Components/AppBar.dart';
import '../../Components/MenuKategori.dart';
import '../../Components/PointCard.dart';
import '../../Data/curentFormat.dart';
import '../Login/login.dart';
import 'Controllers/user_controller.dart';
import 'Kas/CatatanPengeluaran.dart';
import 'Laporan/LaporanSemuaScreen.dart';
import 'ListAdmin.dart';
import 'ListNasabah.dart';
import 'ListPenimbang.dart';
import 'PenarikanDana/PenarikanDanaAdmin.dart';
import 'PenarikanDana/PenarikanKeuntungan.dart';
import 'SusutSampah/SusutSampah.dart';
import 'Tambah/RegisterAdmin.dart';
import 'Tambah/SampahAdmin.dart';

class BerandaSuperAdmin extends StatefulWidget {
  const BerandaSuperAdmin({super.key});

  @override
  State<BerandaSuperAdmin> createState() => _BerandaSuperAdminState();
}

class _BerandaSuperAdminState extends State<BerandaSuperAdmin> {
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
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: appbar(() {
      //   removeToken();
      // }),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBarNew(
                size,
                () {
                  removeToken();
                },
              ),
              FutureBuilder<List<dynamic>>(
                future: UsersSuperAdminController().getUser(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    final superAdmin = snapshot.data!;
                    final kodeSuperAdmin = superAdmin[0]['kode_super_admin'];
                    final namaSuperAdmin = superAdmin[0]['nama_super_admin'];
                    final totalsampah =
                        superAdmin[0]['DetailSampahSuperAdmins'][0]['berat'];
                    final saldo =
                        superAdmin[0]['DetailSampahSuperAdmins'][0]['saldo'];
                    final saldoPenjualan =
                        superAdmin[0]['DetailSampahSuperAdmins'][0]['saldo_penjualan'];
                    return PoinCard3(
                      size,
                      'Hi, $namaSuperAdmin',
                      'Kode Super Admin : ${kodeSuperAdmin}',
                      '$totalsampah Kg',
                      CurrencyFormat.convertToIdr(saldo, 0),
                      CurrencyFormat.convertToIdr(saldoPenjualan, 0),
                      'Saldo Keuntungan',
                      'Saldo Penjualan'
                    );
                  }
                },
              ),
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
                padding: const EdgeInsets.only(left: 35, top: 15, right: 35, bottom: 30),
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
                                return ListNasabahSuperAdminScreen();
                              },
                            ),
                          ).then((value) {
                            setState(() {});
                          });
                        }),
                        subMenu(
                          size,
                          'assets/img/regnas.png',
                          'TAMBAH ADMIN',
                          () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (builde) {
                                  return TambahAdminScreen();
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
                        subMenu(size, 'assets/img/listpe.png', 'LIST PENIMBANG',
                            () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (builde) {
                                return ListPenimbangSuperAdminScreen();
                              },
                            ),
                          ).then((value) {
                            setState(() {});
                          });
                        }),
                        subMenu(size, 'assets/img/listnas.png', 'LIST ADMIN',
                            () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (builde) {
                                return ListAdminSuperAdminScreen();
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
                        subMenu(size, 'assets/img/recycle.png', 'JUAL SAMPAH',
                            () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (builde) {
                                return SelectJualinduk();
                              },
                            ),
                          ).then((value) {
                            setState(() {});
                          });
                        }),
                        subMenu(size, 'assets/img/gram.png', 'SUSUT SAMPAH',
                            () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (builde) {
                                return SusutSampahScreen();
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
                         subMenu(size, 'assets/img/truck.png', 'SAMPAH', () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (builde) {
                                return SampahSuperAdminScreen();
                              },
                            ),
                          ).then((value) {
                            setState(() {});
                          });
                        }),
                       
                        subMenu(
                            size, 'assets/img/money-w.png', 'PENARIKAN DANA',
                            () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (builde) {
                                return PenarikanDanaAdminScreen();
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
                        subMenu(size, 'assets/img/rupiah.png', 'PENARIKAN KEUNTUNGAN',
                            () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (builde) {
                                return PenarikanKeuntunganScreen();
                              },
                            ),
                          ).then((value) {
                            setState(() {});
                          });
                        }),
                        subMenu(
                            size, 'assets/img/money.png', 'CATATAN PENGELUARAN',
                            () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (builde) {
                                return CatatanPengeluaranSAdminScreen();
                              },
                            ),
                          ).then((value) {
                            setState(() {});
                          });
                        }),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 20),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (builde) {
                                return LaporansemuaScreen();
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
                                color: Color(0x28000000),
                                blurRadius: 16,
                                offset: Offset(0, 0),
                                spreadRadius: -6,
                              )
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/img/books.png',
                                width: 50,
                                height: 50,
                              ),
                              SizedBox(
                                width: size.width * 0.05,
                              ),
                              Text(
                                'Lihat LAPORAN',
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
              )
            ],
          ),
        ),
      ),
    );
  }

 
}
