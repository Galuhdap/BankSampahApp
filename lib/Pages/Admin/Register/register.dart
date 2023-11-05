import 'package:banksampah_application/Pages/Admin/Register/TambahPengepul.dart';
import 'package:banksampah_application/Pages/Admin/Register/tambahnasabah.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Components/AppBar.dart';
import '../../../Components/Setting.dart';

class TambahPengguna extends StatefulWidget {
  const TambahPengguna({super.key});

  @override
  State<TambahPengguna> createState() => _TambahPenggunaState();
}

class _TambahPenggunaState extends State<TambahPengguna> {
    var _rw;

  Future datas() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var rw = await prefs.getString('rw');
    setState(() {
      _rw = rw;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    datas();
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
            appbar3(context, size, 'Tambah Pengguna',(){}),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: Column(
                  children: [
                    pilihanReg('assets/img/regnas.png', 'Tambah Nasabah' , (){Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (builde) {
                                return TambahNasabah(
                                  rw: _rw,
                                );
                              },
                            ),
                          ).then((value) {
                            setState(() {});
                          });}),
                    pilihanReg('assets/img/tapeng.png', 'Tambah Penimbang',(){
                      Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (builde) {
                                return TambahPengepul(
                                   rw: _rw,
                                );
                              },
                            ),
                          ).then((value) {
                            setState(() {});
                          });
                    }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  Padding pilihanReg(img, txt, ontp) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        onTap: ontp,
        child: Container(
          width: 385,
          height: 68,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            shadows: [
              BoxShadow(
                color: Color(0x28000000),
                blurRadius: 17,
                offset: Offset(0, 0),
                spreadRadius: 0,
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Image.asset(
                  img,
                  width: 45,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  txt,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
