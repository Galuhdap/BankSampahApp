import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../Components/AppBar.dart';
import '../../Components/Setting.dart';
import '../../Components/TextField.dart';

class SetorSampah extends StatefulWidget {
  const SetorSampah({super.key});

  @override
  State<SetorSampah> createState() => _SetorSampahState();
}

class _SetorSampahState extends State<SetorSampah> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                children: [
                  Container(
                    width: 37,
                    height: 37,
                    decoration: ShapeDecoration(
                      color: Color(0xFF4CAF50),
                      shape: OvalBorder(),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.arrow_back_ios_rounded,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(left: 10)),
                  Text(
                    'Setor Sampah',
                    style: TextStyle(
                      color: Color(0xFF333333),
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: Column(
                  children: [
                    Container(
                      width: 384,
                      height: 580,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
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
                        padding: const EdgeInsets.only(top: 40),
                        child: Column(
                          children: [
                            fieldText(
                                size, 'Kode Nasabah', 'kode nasabah', true),
                            fieldText(
                                size, 'Jenis Sampah', 'Jenis Sampa', true),
                            fieldText(
                                size, 'Jenis Barang', 'Jenis Barang', true),
                            fieldText(size, 'Berat (KG)', 'Berat (KG)', true),
                            fieldText(
                                size, 'Tanggal Setor', 'Tanggal Setor', true),
                            fieldText(size, 'Catatan Tambahan',
                                'Catatan Tambahan', true),
                          ],
                        ),
                      ),
                    ),
                    continer('SETOR SAMPAH', Color(0xFF4CAF50)),
                    continer('BATAL', Color(0xFFDD3737))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  Padding continer(txt, clr) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
      ),
      child: Container(
        width: 384,
        height: 55,
        decoration: ShapeDecoration(
          color: clr,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
        child: Center(
          child: Text(
            txt,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
