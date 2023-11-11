import 'package:banksampah_application/Components/AppBar.dart';
import 'package:banksampah_application/Pages/Penimbang/Beranda.dart';
import 'package:banksampah_application/Pages/Penimbang/List_Setor_Sampah.dart';
import 'package:banksampah_application/Pages/Penimbang/controllers/sampah_controller.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Components/TextField.dart';

class SetorSampah extends StatefulWidget {
  const SetorSampah({super.key});

  @override
  State<SetorSampah> createState() => _SetorSampahState();
}

class _SetorSampahState extends State<SetorSampah> {
  String? dropdownValue;
  String? dropdownValueBarang;
  bool isLoading = false;

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

  TextEditingController kodeNasabahController = TextEditingController();
  TextEditingController beratController = TextEditingController();
  TextEditingController tglController = TextEditingController();
  TextEditingController catatanController = TextEditingController();

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
            appbar3(context, size, 'Setor Sampah', () {
              Navigator.pop(context);
            }),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                          width: size.width * 0.85,
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
                                fieldText(size, 'Kode Nasabah', '', true,
                                    kodeNasabahController, TextInputType.name),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 19),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                            color: Color.fromARGB(255, 0, 0, 0),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 19),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, bottom: 5),
                                        child: Text(
                                          "Pilih Jenis Barang",
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
                                              dropdownValueBarang = newValue;
                                            });
                                          },
                                          items: _data?.expand<
                                                  DropdownMenuItem<String>>(
                                                (data) {
                                                  var jenisBarangs =
                                                      data['JenisBarangs']
                                                          as List<dynamic>;
                                                  return jenisBarangs.map<
                                                      DropdownMenuItem<String>>(
                                                    (item) {
                                                      return DropdownMenuItem<
                                                          String>(
                                                        value:
                                                            item["kode_barang"],
                                                        child: Text(item[
                                                            "jenis_barang"]),
                                                      );
                                                    },
                                                  );
                                                },
                                              )?.toList() ??
                                              [],
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
                                            color: Color.fromARGB(255, 0, 0, 0),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                fieldText(size, 'Berat (KG)', '', true,
                                    beratController, TextInputType.number),
                                fieldText(size, 'Catatan Tambahan', '', true,
                                    catatanController, TextInputType.name),
                              ],
                            ),
                          ),
                        ),
                        buttom(size, 'SETOR SAMPAH', Color(0xFF4CAF50),
                            () async {
                          String inputText = beratController.text;
                          double? numericValue;

                          String txt = "Input Berat Mengunakan Titik";

                          try {
                            final valNasabah = await SampahPenimbangController()
                                .validasiNasabah(
                                    kodeNasabah: kodeNasabahController.text);
                            if (valNasabah["success"] == false) {
                              Alert(
                                context: context,
                                type: AlertType.error,
                                title: "ERROR INPUT",
                                desc: "Masukan Kode Nasabah Dengan Benar",
                              ).show();
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  });
                              numericValue = double.parse(inputText);
                              await SampahPenimbangController().setorSampah(
                                  kodeSampah: dropdownValue.toString(),
                                  kodeBarang: dropdownValueBarang.toString(),
                                  berat: numericValue,
                                  catatan: catatanController.text,
                                  kodeNasabah: kodeNasabahController.text);
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (builde) {
                                    return ListSetorSampahScreen();
                                  },
                                ),
                              );
                            }
                          } catch (e) {
                            Alert(
                              context: context,
                              type: AlertType.error,
                              title: "ERROR INPUT",
                              desc: "Masukan Berat Tidak Bisa dengan (,)",
                            ).show();
                            return;
                          }
                        }),
                      ],
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

  Padding buttom(Size size, txt, clr, ontp) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
      ),
      child: InkWell(
        onTap: ontp,
        child: Container(
          width: size.width * 0.87,
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
