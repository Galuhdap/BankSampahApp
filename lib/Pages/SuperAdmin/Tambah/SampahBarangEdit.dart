import 'package:banksampah_application/Pages/Admin/Register/detailTambahPengepul.dart';
import 'package:banksampah_application/Pages/Admin/controller/userController.dart';
import 'package:flutter/material.dart';

import '../../../Components/AppBar.dart';
import '../../../Components/TextField.dart';
import '../../Penimbang/controllers/sampah_controller.dart';
import '../Controllers/sampahController.dart';
import '../Controllers/user_controller.dart';
import '../Models/JenisBarangModel.dart';

class BarangSampahEditScreen extends StatefulWidget {
  final String namaBarang;
  final int hargaPertama;
  final int hargaKedua;
  final String kodeBarang;
  const BarangSampahEditScreen({
    Key? key,
    required this.namaBarang,
    required this.hargaPertama,
    required this.hargaKedua,
    required this.kodeBarang,
  });

  @override
  State<BarangSampahEditScreen> createState() => _BarangSampahEditScreenState();
}

class _BarangSampahEditScreenState extends State<BarangSampahEditScreen> {
  String? dropdownValue;
  TextEditingController namaBarangController = TextEditingController();
  TextEditingController satuanController = TextEditingController();
  TextEditingController hargaNasabahController = TextEditingController();
  TextEditingController hargaAdminController = TextEditingController();

  var _data;
  Future getdatas() async {
    var data = await SampahPenimbangController().getSampah();
    setState(() {
      _data = data;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getdatas();
    namaBarangController.text = widget.namaBarang;
    hargaNasabahController.text = widget.hargaPertama.toString();
    hargaAdminController.text = widget.hargaKedua.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    print(_data);
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            appbar3(context, size, 'Edit Sampah Barang'),
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
                            fieldText1(size, 'Jenis Barang', true,
                                namaBarangController),
                            fieldText1(size, 'Harga Nasabah', true,
                                hargaNasabahController),
                            fieldText1(size, 'Harga Admin', true,
                                hargaAdminController),
                          ],
                        ),
                      ),
                    ),
                    continer('EDIT', Color(0xFF4CAF50), () async {
                      SampahSuperAdminController().updateSampahBarang(
                          jenis_barang: namaBarangController.text,
                          hargaNasabah: hargaNasabahController.text,
                          hargaAdmin: hargaAdminController.text,
                          kode_barang: widget.kodeBarang);
                      Navigator.pop(context);
                      setState(() {
                        
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
