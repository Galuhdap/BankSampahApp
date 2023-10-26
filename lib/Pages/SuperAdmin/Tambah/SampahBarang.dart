import 'package:banksampah_application/Pages/Admin/Register/detailTambahPengepul.dart';
import 'package:banksampah_application/Pages/Admin/controller/userController.dart';
import 'package:flutter/material.dart';

import '../../../Components/AppBar.dart';
import '../../../Components/TextField.dart';
import '../../Penimbang/controllers/sampah_controller.dart';
import '../Controllers/sampahController.dart';
import '../Controllers/user_controller.dart';

class BarangSampahScreen extends StatefulWidget {
  const BarangSampahScreen({Key? key}) : super(key: key);

  @override
  State<BarangSampahScreen> createState() => _BarangSampahScreenState();
}

class _BarangSampahScreenState extends State<BarangSampahScreen> {
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
            appbar3(context, size, 'Tambah Sampah Barang'),
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
                            Padding(
                              padding: const EdgeInsets.only(bottom: 19),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, bottom: 5),
                                    child: Text(
                                      "Pilih Jenis Sampah",
                                      style: TextStyle(
                                        color: Color(0xFF333333),
                                        fontSize: 13,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: size.width * 0.75,
                                    child: DropdownButtonFormField<String>(
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          dropdownValue = newValue;
                                        });
                                      },
                                      items: _data
                                          ?.map<DropdownMenuItem<String>>(
                                              (data) {
                                        return DropdownMenuItem<String>(
                                          value: data["kode_sampah"],
                                          child: Text(data["jenis_sampah"]),
                                        );
                                      }).toList(),
                                      // items: [
                                      //   DropdownMenuItem<String>(
                                      //     value: 'sddsa',
                                      //     child: Text(
                                      //       'sadds'),
                                      //     // value: _data?['kode_sampah'] ?? '',
                                      //     // child: Text(
                                      //     //     _data?['jenis_sampah'] ?? ''),
                                      //   ),
                                      // ],
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          borderSide: BorderSide(
                                            color: Colors.green,
                                            width: 2.0,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          borderSide: BorderSide(
                                            color: Colors.green,
                                            width: 2.0,
                                          ),
                                        ),
                                        filled: true,
                                        fillColor: Color(0xFFE6F4F1),
                                        isDense: true,
                                      ),
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
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
                    continer('TAMBAH', Color(0xFF4CAF50), () async {
                      SampahSuperAdminController().tambahSampahBarang(
                          jenis_barang: namaBarangController.text,
                          hargaNasabah: hargaNasabahController.text,
                          hargaAdmin: hargaAdminController.text,
                          kode_sampah: dropdownValue);
                      Navigator.pop(context);
                      //      Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (builde) {
                      //       return DetailPenimbangScreen(
                      //         nama_pengepul: namaAdminController.text,
                      //         rw: rwController.text,
                      //         rt: rtController.text,
                      //         no_telp: noTelpController.text,
                      //         alamat: alamatController.text,
                      //         password:passwordController.text
                      //       );
                      //     },
                      //   ),
                      // ).then((value) {
                      //   setState(() {});
                      // });
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
