import 'package:flutter/material.dart';

import '../../../Components/AppBar.dart';
import '../../../Components/TextField.dart';
import 'Controllers/user_controller.dart';
import 'ListNasabah.dart';

class EditNasabahScreen extends StatefulWidget {
  final String kode_nasabah;
  final String nama_nasabah;
  final String no_telp; 
  final String alamat;
  final String rt;
  final String rw;
  final String pin;
  const EditNasabahScreen({
    Key? key,
    required this.kode_nasabah,
    required this.nama_nasabah,
    required this.no_telp,
    required this.alamat,
    required this.rt,
    required this.rw,
    required this.pin,
  });

  @override
  State<EditNasabahScreen> createState() => _EditNasabahScreenState();
}

class _EditNasabahScreenState extends State<EditNasabahScreen> {
  TextEditingController namaNasabahController = TextEditingController();
  TextEditingController rwController = TextEditingController();
  TextEditingController rtController = TextEditingController();
  TextEditingController noTelpController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController pinController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    namaNasabahController.text = widget.nama_nasabah;
    rwController.text = widget.rw;
    rtController.text = widget.rt;
    noTelpController.text = widget.no_telp;
    alamatController.text = widget.alamat;
    pinController.text = widget.pin;
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
            appbar3(context, size, 'Edit Nasabah',(){}),
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
                          ],
                        ),
                      ),
                    ),
                    continer('SIMPAN', Color(0xFF4CAF50), () async {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          });
                      await UsersSuperAdminController().updateNasabah(
                          nama_nasabah: namaNasabahController.text,
                          alamat: alamatController.text,
                          rw: rwController.text,
                          rt: rtController.text,
                          no_telp: noTelpController.text,
                          pin: pinController.text,
                          kode_nasabah: widget.kode_nasabah);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (builde) {
                            return ListNasabahSuperAdminScreen();
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
