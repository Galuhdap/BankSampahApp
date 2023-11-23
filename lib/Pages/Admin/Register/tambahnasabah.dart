import 'package:banksampah_application/Pages/Admin/controller/userController.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Components/AppBar.dart';
import '../../../Components/TextField.dart';
import 'detailTambahNasabah.dart';

class TambahNasabah extends StatefulWidget {
  final String rw;
  const TambahNasabah({Key? key, required this.rw});

  @override
  State<TambahNasabah> createState() => _TambahNasabahState();
}

class _TambahNasabahState extends State<TambahNasabah> {
  UserControllerAdmin userController = UserControllerAdmin();

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

    rwController.text = widget.rw;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // print(_rw);
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            appbar3(context, size, 'Register Nasabah', () {
              Navigator.pop(context);
            }),
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
                        padding: const EdgeInsets.only(top: 40),
                        child: Column(
                          children: [
                            // fieldText1(
                            //     size, 'Kode Nasabah', true),
                            fieldText1(size, 'Nama Nasabah', true,
                                namaNasabahController, TextInputType.name),
                            fieldText1(size, 'Alamat', true, alamatController,
                                TextInputType.name),
                            Row(
                              children: [
                                Expanded(
                                  child: fieldText2(size, 'RW', false,
                                      rwController, TextInputType.number),
                                ),
                                Expanded(
                                  child: fieldText2(size, 'RT', true,
                                      rtController, TextInputType.number),
                                ),
                              ],
                            ),
                            fieldText1(size, 'No telepon', true,
                                noTelpController, TextInputType.phone),
                            fieldText1(size, 'PIN', true, pinController,
                                TextInputType.name),
                            fieldText1(size, 'Password', true,
                                passwordController, TextInputType.name),
                          ],
                        ),
                      ),
                    ),
                    continer('REGISTER', Color(0xFF4CAF50), () async {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          });
                      await userController.registerNasabah(
                          nama_nasabah: namaNasabahController.text,
                          rw: rwController.text,
                          rt: rtController.text,
                          no_telp: noTelpController.text,
                          alamat: alamatController.text,
                          pin: pinController.text,
                          password: passwordController.text);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (builde) {
                            return DetailNasabahScreen(
                                nama_nasabah: namaNasabahController.text,
                                rw: rwController.text,
                                rt: rtController.text,
                                no_telp: noTelpController.text,
                                alamat: alamatController.text,
                                pin: pinController.text,
                                password: passwordController.text);
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
