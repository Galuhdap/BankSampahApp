import 'package:banksampah_application/Pages/Admin/Models/nasabah_model.dart';
import 'package:flutter/material.dart';

import '../../../Components/AppBar.dart';
import '../../../Components/TextField.dart';

class DetailPenimbangScreen extends StatefulWidget {
final  String?  nama_pengepul, rt, rw, no_telp, alamat, password;
  DetailPenimbangScreen({
    super.key,
    required this.nama_pengepul,
    required this.rt,
    required this.rw,
    required this.no_telp,
    required this.alamat,
    required this.password,

  });

  @override
  State<DetailPenimbangScreen> createState() => _DetailPenimbangScreenState();
}

class _DetailPenimbangScreenState extends State<DetailPenimbangScreen> {
  TextEditingController kodeNasabahController = TextEditingController();
  TextEditingController namaNasabahController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController rwController = TextEditingController();
  TextEditingController rtController = TextEditingController();
  TextEditingController noTelpController = TextEditingController();
  TextEditingController pinController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    namaNasabahController.text = widget.nama_pengepul.toString();
    alamatController.text = widget.alamat.toString();
    rwController.text = widget.rw.toString();
    rtController.text = widget.rt.toString();
    noTelpController.text = widget.no_telp.toString();
    passwordController.text = widget.password.toString();
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
            Center(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 75, bottom: 20, left: 24, right: 24),
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
                        padding: const EdgeInsets.only(top: 40),
                        child: Column(
                          children: [
                            // fieldText1(
                            //     size, 'Kode Nasabah', true),
                            fieldText1(size, 'Nama Penimbang', true,
                                namaNasabahController, TextInputType.name),
                            fieldText1(size, 'Alamat', true, alamatController, TextInputType.name),
                            Row(
                              children: [
                                Expanded(
                                  child: fieldText2(
                                      size, 'RW', true, rwController, TextInputType.number),
                                ),
                                Expanded(
                                  child: fieldText2(
                                      size, 'RT', true, rtController, TextInputType.number),
                                ),
                              ],
                            ),
                            fieldText1(
                                size, 'No telepon', true, noTelpController, TextInputType.phone),

                            fieldText1(
                                size, 'Password', true, passwordController, TextInputType.name),
                          ],
                        ),
                      ),
                    ),
                    continer('Selesai', Color(0xFF4CAF50), () {
                      Navigator.pop(context); 
                      Navigator.pop(context); 
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
