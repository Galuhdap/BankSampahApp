
import 'package:flutter/material.dart';

import '../../../Components/AppBar.dart';
import '../../../Components/TextField.dart';
import '../Controllers/sampahController.dart';

import 'SampahAdmin.dart';

class SampahKeringScreen extends StatefulWidget {
  const SampahKeringScreen({Key? key}) : super(key: key);

  @override
  State<SampahKeringScreen> createState() => _SampahKeringScreenState();
}

class _SampahKeringScreenState extends State<SampahKeringScreen> {
  TextEditingController sampahKeringController = TextEditingController();
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
            appbar3(context, size, 'Tambah Sampah Kering',(){Navigator.pop(context);}),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 20, bottom: 20, left: 24, right: 24),
                child: Column(
                  children: [
                    Container(
                      width: size.width * 0.9,
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
                        padding: const EdgeInsets.only(top: 53),
                        child: Column(
                          children: [
                            fieldText1(size, 'Jenis Sampah', true,
                                sampahKeringController, TextInputType.name),
                          ],
                        ),
                      ),
                    ),
                    continer('TAMBAH', Color(0xFF4CAF50), () async {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          });
                      await SampahSuperAdminController().tambahSampahKering(
                          jenis_sampah: sampahKeringController.text);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (builde) {
                            return SampahSuperAdminScreen();
                          },
                        ),
                      );
                    }),
                    //continer('BATAL', Color(0xFFDD3737))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  Padding continer(txt, clr, ontp) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
      ),
      child: InkWell(
        onTap: ontp,
        child: Container(
          width: 384,
          height: 55,
          decoration: ShapeDecoration(
            color: clr,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
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
      ),
    );
  }
}
