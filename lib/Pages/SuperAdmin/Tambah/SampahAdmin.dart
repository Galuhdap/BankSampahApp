import 'package:flutter/material.dart';

import '../../../Components/AppBar.dart';
import '../Beranda.dart';
import '../ListBiayaAdmin.dart';
import '../ListSampah.dart';
import 'SampahBarang.dart';
import 'SampahKering.dart';

class SampahSuperAdminScreen extends StatefulWidget {
  const SampahSuperAdminScreen({super.key});

  @override
  State<SampahSuperAdminScreen> createState() => _SampahSuperAdminScreenState();
}

class _SampahSuperAdminScreenState extends State<SampahSuperAdminScreen> {
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
            appbar5(
              context,
              size,
              'Kelola Sampah',
              () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (builde) {
                      return BerandaSuperAdmin();
                    },
                  ),
                );
              },
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: Column(
                  children: [
                    pilihanReg('assets/img/truck.png', 'Tambah Sampah Kering',
                        () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (builde) {
                            return SampahKeringScreen();
                          },
                        ),
                      ).then((value) {
                        setState(() {});
                      });
                    }),
                    pilihanReg('assets/img/truck.png', 'Tambah Barang', () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (builde) {
                            return BarangSampahScreen();
                          },
                        ),
                      ).then((value) {
                        setState(() {});
                      });
                    }),
                    pilihanReg('assets/img/truck.png', 'Biaya Admin', () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (builde) {
                            return ListBiayaAdminScreen();
                          },
                        ),
                      ).then((value) {
                        setState(() {});
                      });
                    }),
                    pilihanReg('assets/img/gram.png', 'List Sampah', () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (builde) {
                            return ListSampahSuperAdminScreen();
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
