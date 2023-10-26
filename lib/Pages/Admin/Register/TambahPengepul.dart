import 'package:banksampah_application/Pages/Admin/Register/detailTambahPengepul.dart';
import 'package:banksampah_application/Pages/Admin/controller/userController.dart';
import 'package:flutter/material.dart';

import '../../../Components/AppBar.dart';
import '../../../Components/TextField.dart';

class TambahPengepul extends StatefulWidget {
  final String rw;
  const TambahPengepul({Key? key, required this.rw});

  @override
  State<TambahPengepul> createState() => _TambahPengepulState();
}

class _TambahPengepulState extends State<TambahPengepul> {
  TextEditingController namaPengepulController = TextEditingController();
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
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            appbar3(context, size, 'Register Penimbang'),
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
                            fieldText1(size, 'Nama Penimbang', true,
                                namaPengepulController),
                            fieldText1(size, 'Alamat', true, alamatController),
                            Row(
                              children: [
                                Expanded(
                                  child: fieldText2(
                                      size, 'RW', false, rwController),
                                ),
                                Expanded(
                                  child: fieldText2(
                                      size, 'RT', true, rtController),
                                ),
                              ],
                            ),
                            fieldText1(
                                size, 'No telepon', true, noTelpController),
                            fieldText1(
                                size, 'Password', true, passwordController),
                          ],
                        ),
                      ),
                    ),
                    continer('REGISTER', Color(0xFF4CAF50), () async {
                     await UserControllerAdmin().registerPenimbang(
                          nama_penimbang: namaPengepulController.text,
                          rw: rwController.text,
                          rt: rtController.text,
                          no_telp: noTelpController.text,
                          alamat: alamatController.text,
                          password: passwordController.text);
                           Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (builde) {
                            return DetailPenimbangScreen(
                              nama_pengepul: namaPengepulController.text,
                              rw: rwController.text,
                              rt: rtController.text,
                              no_telp: noTelpController.text,
                              alamat: alamatController.text,
                              password:passwordController.text
                            );
                          },
                        ),
                      ).then((value) {
                        setState(() {});
                      });
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
