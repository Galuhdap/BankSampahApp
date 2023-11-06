import 'package:banksampah_application/Pages/Penimbang/Setor_Sampah.dart';
import 'package:banksampah_application/Pages/Penimbang/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Components/AppBar.dart';
import '../../Components/MenuKategori.dart';
import '../../Components/PointCard.dart';
import '../../Data/curentFormat.dart';
import '../Login/login.dart';
import 'List_Setor_Sampah.dart';
import 'Models/PenimbangModel.dart';

class BerandaPenimbang extends StatefulWidget {
  const BerandaPenimbang({super.key});

  @override
  State<BerandaPenimbang> createState() => _BerandaPenimbangState();
}

class _BerandaPenimbangState extends State<BerandaPenimbang> {
  UserController userController = UserController();

  Future<void> removeToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return LoginScreen();
        },
      ),
      (_) => false,
    );
  }

  Penimbang? _test; // Change the type to Penimbang?

  Future<void> getData() async {
    Penimbang? penimbang = await userController.getUser();
    setState(() {
      _test = penimbang;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBarNew(size, () {
                removeToken();
              }),
              FutureBuilder<Map<String, dynamic>>(
                  future: userController.getUsers(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else {
                        final Map<String, dynamic> penimbang = snapshot.data!;
                        final kodePenimbang =
                            penimbang['row'][0]['kode_penimbang'];
                        final namaPenimbang =
                            penimbang['row'][0]['nama_penimbang'];
                        final totalsampah = penimbang['sampah'][0]['berat'];
                        final saldo = penimbang['sampah'][0]['saldo'];
                        return PoinCard2(
                          size,
                          'Hi,$namaPenimbang',
                          'Kode Penimbang :${kodePenimbang}',
                          totalsampah.toString(),
                          CurrencyFormat.convertToIdr(saldo, 0),
                        );
                      }
                    }
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colors.blue,
                      ),
                    );
                  }),
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
                        subMenu(size, 'assets/img/bin.png', 'SETOR SAMPAH', () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (builde) {
                                return SetorSampah();
                              },
                            ),
                          ).then((value) {
                            setState(() {});
                          });
                        }),
                        subMenu(size, 'assets/img/recycle.png', 'LIHAT SETORAN',
                            () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (builde) {
                                return ListSetorSampahScreen();
                              },
                            ),
                          ).then((value) {
                            setState(() {});
                          });
                        }),
                      ],
                    ),
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
