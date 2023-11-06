import 'package:banksampah_application/Components/AppBar.dart';
import 'package:banksampah_application/Pages/SuperAdmin/JualSampah/SampahInduk.dart';
import 'package:banksampah_application/Pages/SuperAdmin/JualSampah/SampahPihakEksternal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../Beranda.dart';
import 'ListPenjualanSampahBs.dart';
import 'ListPenjualanSampahInduk.dart';
import 'SetorSampahBS.dart';
import 'SetorSampahInduk.dart';

class SelectJualinduk extends StatefulWidget {
  const SelectJualinduk({super.key});

  @override
  State<SelectJualinduk> createState() => _SelectJualindukState();
}

class _SelectJualindukState extends State<SelectJualinduk> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          appbar5(
            context,
            size,
            'Jaul Sampah',
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
          Padding(
            padding:
                const EdgeInsets.only(top: 20, bottom: 10, left: 30, right: 30),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (builde) {
                      return SetorSampahBS();
                    },
                  ),
                ).then((value) {
                  setState(() {});
                });
              },
              child: Container(
                width: 342,
                height: 72,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 16,
                      offset: Offset(0, 0),
                      spreadRadius: -6,
                    )
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, top: 25),
                  child: Text(
                    'Sampah BS',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10, left: 30, right: 30),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (builde) {
                      return SetorSampahInduk();
                    },
                  ),
                ).then((value) {
                  setState(() {});
                });
              },
              child: Container(
                width: 342,
                height: 72,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 16,
                      offset: Offset(0, 0),
                      spreadRadius: -6,
                    )
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, top: 25),
                  child: Text(
                    'Sampah Pihak Eksternal',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10, left: 30, right: 30),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (builde) {
                      return ListPenjualanBSSuperAdminScreen();
                    },
                  ),
                ).then((value) {
                  setState(() {});
                });
              },
              child: Container(
                width: 342,
                height: 72,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 16,
                      offset: Offset(0, 0),
                      spreadRadius: -6,
                    )
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, top: 25),
                  child: Text(
                    'List Sampah BS',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10, left: 30, right: 30),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (builde) {
                      return ListPenjualanSuperAdminScreen();
                    },
                  ),
                ).then((value) {
                  setState(() {});
                });
              },
              child: Container(
                width: 342,
                height: 72,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 16,
                      offset: Offset(0, 0),
                      spreadRadius: -6,
                    )
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, top: 25),
                  child: Text(
                    'List Sampah Pihak Eksternal',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
