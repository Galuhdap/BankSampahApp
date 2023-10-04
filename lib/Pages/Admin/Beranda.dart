import 'package:banksampah_application/Pages/Admin/Kas/Kas.dart';
import 'package:banksampah_application/Pages/Admin/ListNasabah.dart';
import 'package:banksampah_application/Pages/Admin/ListPengepul.dart';
import 'package:banksampah_application/Pages/Login/login.dart';
import 'package:banksampah_application/Pages/Penimbang/Setor_Sampah.dart';
import 'package:banksampah_application/Pages/SuperAdmin/JualSampah/SelectJual.dart';
import 'package:banksampah_application/Pages/SuperAdmin/Kas/Kas.dart';
import 'package:banksampah_application/Pages/SuperAdmin/SusutSampah/SusutSampah.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Components/AppBar.dart';
import '../../Components/MenuKategori.dart';
import '../../Components/PointCard.dart';
import 'Register/register.dart';
import 'SusutSampah/SusutSampah.dart';

class BerandaAdmin extends StatefulWidget {
  const BerandaAdmin({super.key});

  @override
  State<BerandaAdmin> createState() => _BerandaAdminState();
}

class _BerandaAdminState extends State<BerandaAdmin> {
  Future<void> removeToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('token');
  print('Token dihapus.');
}


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appbar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PoinCard(size, 'Hi, Induk', 'Kode Penimbang : KP-120200022',
                  '30,6 Kg', '1,6 Kg', '23.000', Container()),
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
                        subMenu(
                            size, 'assets/img/listnas.png', 'LIST NASABAH',
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
                        subMenu(size, 'assets/img/regnas.png',
                            'TAMBAH PENGGUNA', () {
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
                        subMenu(
                            size, 'assets/img/listpe.png', 'LIST PENGEPUL',
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
                          }
                          );
                        }),
                        subMenu(size, 'assets/img/money.png', 'KAS', () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (builde) {
                                return KasAdminScreen();
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
                        subMenu(size, 'assets/img/money-w.png',
                            'PENARIKAN SALDO', ()async {
                              await removeToken();

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (builde) {
                                return LoginScreen();
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
