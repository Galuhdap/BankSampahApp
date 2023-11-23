import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';

import '../../../Components/AppBar.dart';
import '../../../Components/TextField.dart';
import '../../Penimbang/controllers/sampah_controller.dart';
import '../Controllers/sampahController.dart';

import 'SampahAdmin.dart';

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

  CurrencyTextInputFormatter _currencyFormatter =
      CurrencyTextInputFormatter(locale: 'ID', decimalDigits: 0, name: '');

  TextEditingController namaBarangController = TextEditingController();
  TextEditingController satuanController = TextEditingController();
  TextEditingController hargaNasabahController = TextEditingController();
  TextEditingController hargaAdminController = TextEditingController();
  TextEditingController hargaKeuntunganNasabahController =
      TextEditingController();
  TextEditingController hargaKeuntunganAdminController =
      TextEditingController();

  int _hargaNasabah = 0;
  int _hargaAdmin = 0;
  int _keuntunganAdmin = 0;
  int _keuntunganSuperAdmin = 0;

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
              appbar3(context, size, 'Edit Sampah Barang', () {
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
                          padding: const EdgeInsets.only(top: 53),
                          child: Column(
                            children: [
                              fieldText1(size, 'Jenis Barang', true,
                                  namaBarangController, TextInputType.name),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 19),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, bottom: 5),
                                      child: Text(
                                        'Harga Nasabah ',
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
                                      child: TextField(
                                        keyboardType: TextInputType.number,
                                        controller: hargaNasabahController,
                                        enabled: true,
                                        inputFormatters: [_currencyFormatter],
                                        decoration: InputDecoration(
                                          prefixText: "Rp ",
                                          border: UnderlineInputBorder(
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
                                          fillColor:
                                              Colors.white.withOpacity(0.5),
                                          isDense: true,
                                        ),
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: Color.fromARGB(255, 0, 0, 0),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 19),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, bottom: 5),
                                      child: Text(
                                        'Harga Admin Bs ',
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
                                      child: TextField(
                                        keyboardType: TextInputType.number,
                                        controller: hargaAdminController,
                                        enabled: true,
                                        inputFormatters: [_currencyFormatter],
                                        decoration: InputDecoration(
                                          prefixText: "Rp ",
                                          border: UnderlineInputBorder(
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
                                          fillColor:
                                              Colors.white.withOpacity(0.5),
                                          isDense: true,
                                        ),
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: Color.fromARGB(255, 0, 0, 0),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Center(
                child: continer(size, 'EDIT', Color(0xFF4CAF50), () async {
                  String hargaText = hargaNasabahController.text
                      .replaceAll('Rp ', '')
                      .replaceAll('.', '');

                  int parsedHarga = int.tryParse(hargaText) ?? 0;

                  setState(() {
                    _hargaNasabah = parsedHarga;
                  });

                  String _hargaText = hargaAdminController.text
                      .replaceAll('Rp ', '')
                      .replaceAll('.', '');

                  int _parsedHarga = int.tryParse(_hargaText) ?? 0;

                  setState(() {
                    _hargaAdmin = _parsedHarga;
                  });

                  showDialog(
                      context: context,
                      builder: (context) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      });
                  await SampahSuperAdminController().updateSampahBarang(
                      jenis_barang: namaBarangController.text,
                      hargaNasabah: _hargaNasabah,
                      hargaAdmin: _hargaAdmin,
                      kode_barang: widget.kodeBarang);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (builde) {
                        return SampahSuperAdminScreen();
                      },
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding continer(Size size, txt, clr, ontp) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
      ),
      child: InkWell(
        onTap: ontp,
        child: Container(
          width: size.width * 0.9,
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
