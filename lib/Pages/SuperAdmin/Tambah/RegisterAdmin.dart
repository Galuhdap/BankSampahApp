import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../../Components/AppBar.dart';
import '../../../Components/TextField.dart';
import '../Beranda.dart';
import '../Controllers/user_controller.dart';
import '../ListAdmin.dart';

class TambahAdminScreen extends StatefulWidget {
  const TambahAdminScreen({Key? key}) : super(key: key);

  @override
  State<TambahAdminScreen> createState() => _TambahAdminScreenState();
}

class _TambahAdminScreenState extends State<TambahAdminScreen> {
  TextEditingController namaAdminController = TextEditingController();
  TextEditingController rwController = TextEditingController();
  TextEditingController rtController = TextEditingController();
  TextEditingController noTelpController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
            appbar3(context, size, 'Register Admin', () {
              Navigator.pop(context);
              // Navigator.pushReplacement(
              //   context,
              //   MaterialPageRoute(
              //     builder: (builde) {
              //       return BerandaSuperAdmin();
              //     },
              //   ),
              // );
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
                        padding: const EdgeInsets.only(top: 53),
                        child: Column(
                          children: [
                            fieldText1(size, 'Nama Admin Bank Sampah', true,
                                namaAdminController, TextInputType.name),
                            Row(
                              children: [
                                Expanded(
                                  child: fieldText2(size, 'RW', true,
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
                            fieldText1(size, 'Password', true,
                                passwordController, TextInputType.name),
                          ],
                        ),
                      ),
                    ),
                    continer(
                      'REGISTER',
                      Color(0xFF4CAF50),
                      () async {
                        final valAdmin = await UsersSuperAdminController()
                            .validasiRw(rw: rwController.text);
                        print(valAdmin);
                        if (valAdmin["status"] == true) {
                          Alert(
                            context: context,
                            type: AlertType.warning,
                            title: "ERROR INPUT",
                            desc: "RW Sudah Di Gunakan",
                          ).show();
                        } else {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              });
                          await UsersSuperAdminController().registerAdmin(
                              nama_admin: namaAdminController.text,
                              rw: rwController.text,
                              rt: rtController.text,
                              no_telp: noTelpController.text,
                              password: passwordController.text);
                          
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (builde) {
                                return ListAdminSuperAdminScreen();
                              },
                            ),
                          );
                        }
                      },
                    ),
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
