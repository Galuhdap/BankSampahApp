import 'package:banksampah_application/Pages/Admin/Models/nasabah_model.dart';
import 'package:flutter/material.dart';

import '../../../Components/AppBar.dart';
import '../../../Components/TextField.dart';

class DetailNasabahScreen extends StatefulWidget {
final  String?  nama_nasabah, rt, rw, no_telp, alamat, pin, password;
  DetailNasabahScreen({
    super.key,
    required this.nama_nasabah,
    required this.rt,
    required this.rw,
    required this.no_telp,
    required this.alamat,
    required this.pin,
    required this.password,

  });

  @override
  State<DetailNasabahScreen> createState() => _DetailNasabahScreenState();
}

class _DetailNasabahScreenState extends State<DetailNasabahScreen> {
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
    namaNasabahController.text = widget.nama_nasabah.toString();
    alamatController.text = widget.alamat.toString();
    rwController.text = widget.rw.toString();
    rtController.text = widget.rt.toString();
    noTelpController.text = widget.no_telp.toString();
    pinController.text = widget.pin.toString();
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
                    top: 20, bottom: 20, left: 24, right: 24),
                child: Column(
                  children: [
                    Container(
                      width: 384,
                      height: 695,
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
                            fieldText1(size, 'Nama Nasabah', true,
                                namaNasabahController),
                            fieldText1(size, 'Alamat', true, alamatController),
                            Row(
                              children: [
                                Expanded(
                                  child: fieldText2(
                                      size, 'RW', true, rwController),
                                ),
                                Expanded(
                                  child: fieldText2(
                                      size, 'RT', true, rtController),
                                ),
                              ],
                            ),
                            fieldText1(
                                size, 'No telepon', true, noTelpController),
                            fieldText1(size, 'PIN', true, pinController),
                            fieldText1(
                                size, 'Password', true, passwordController),
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
