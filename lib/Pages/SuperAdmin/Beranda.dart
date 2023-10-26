import 'package:banksampah_application/Pages/Admin/controller/userController.dart';
import 'package:banksampah_application/Pages/Penimbang/Setor_Sampah.dart';
import 'package:banksampah_application/Pages/SuperAdmin/JualSampah/SelectJual.dart';
import 'package:banksampah_application/Pages/SuperAdmin/Kas/Kas.dart';
import 'package:banksampah_application/Pages/SuperAdmin/Models/SuperAdminModels.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Components/AppBar.dart';
import '../../Components/MenuKategori.dart';
import '../../Components/PointCard.dart';
import '../Login/login.dart';
import 'Controllers/user_controller.dart';
import 'ListAdmin.dart';
import 'ListNasabah.dart';
import 'ListPenimbang.dart';
import 'PenarikanDana/PenarikanDanaAdmin.dart';
import 'SusutSampah/SusutSampah.dart';
import 'TabBar/Tabbarscreen.dart';
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
      appBar: appbar(() {
        removeToken();
      }),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FutureBuilder<SuperAdmin?>(
                future: UsersSuperAdminController().getUser(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    final superAdmin = snapshot.data!;
                    final kodeSuperAdmin = superAdmin.row[0].kodeSuperAdmin;
                    final namaSuperAdmin = superAdmin.row[0].namaSuperAdmin;
                    final totalsampah =
                        superAdmin.row[0].detailSampahSuperAdmins![0].berat;
                    final sampah_hariinni =
                        superAdmin.row[0].detailSampahSuperAdmins![0].berat;
                    final saldo =
                        superAdmin.row[0].detailSampahSuperAdmins![0].saldo;
                    return PoinCard2(
                      size,
                      'Hi, $namaSuperAdmin',
                      'Kode Super Admin : ${kodeSuperAdmin}',
                      '$totalsampah Kg',
                      saldo.toString(),
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
                        subMenu(size, 'assets/img/truck.png', 'Sampah', () {
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
                        subMenu(size, 'assets/img/truck.png', 'Jual Sampah',
                            () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (builde) {
                                return SelectJual();
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
                    // menuKategori(
                    //   [
                    //     subMenu(size, 'assets/img/truck.png', 'Sampah',
                    //         () {
                    //       Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //           builder: (builde) {
                    //             return SampahSuperAdminScreen();
                    //           },
                    //         ),
                    //       ).then((value) {
                    //         setState(() {});
                    //       });
                    //     }),
                    //     subMenu(
                    //         size, 'assets/img/books.png', 'Lihat LAPORAN',
                    //         () {
                    //       // Navigator.push(
                    //       //   context,
                    //       //   MaterialPageRoute(
                    //       //     builder: (builde) {
                    //       //       return ListSetorSampahScreen();
                    //       //     },
                    //       //   ),
                    //       // ).then((value) {
                    //       //   setState(() {});
                    //       // });
                    //     }),
                    //   ],
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 20),
                      child: InkWell(
                        onTap: (){
                                    Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (builde) {
                                return TebBarScreen();
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
