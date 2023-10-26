import 'package:banksampah_application/Pages/Admin/Register/detailTambahPengepul.dart';
import 'package:banksampah_application/Pages/Admin/controller/userController.dart';
import 'package:flutter/material.dart';

import '../../../Components/AppBar.dart';
import '../../../Components/TextField.dart';
import '../Controllers/sampahController.dart';
import '../Controllers/user_controller.dart';

class BiayaAdminEditScreen extends StatefulWidget {
    final String kode_admin;
  final int harga;
  const BiayaAdminEditScreen({Key? key, required this.kode_admin , required this.harga});

  @override
  State<BiayaAdminEditScreen> createState() => _BiayaAdminEditScreenState();
}

class _BiayaAdminEditScreenState extends State<BiayaAdminEditScreen> {
  TextEditingController kodebiayaAdminController = TextEditingController();
  TextEditingController biayaAdminController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    kodebiayaAdminController.text = widget.kode_admin;
    biayaAdminController.text = widget.harga.toString();
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
            appbar3(context, size, 'Tambah Sampah Kering'),
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
                            fieldText1(size, 'Kode Biaya Admin', false,
                                kodebiayaAdminController),
                            fieldText1(size, 'Biaya', true,
                                biayaAdminController),
                           
                          ],
                        ),
                      ),
                    ),
                    continer('UBAH', Color(0xFF4CAF50), () async {
                      SampahSuperAdminController().editBiayaAdmin(harga: biayaAdminController.text, kode_biayaAdmin: widget.kode_admin);
                      Navigator.pop(context);
                      Navigator.pop(context);
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
