import 'dart:math';

import 'package:banksampah_application/Components/AppBar.dart';
import 'package:banksampah_application/Pages/SuperAdmin/Controllers/user_controller.dart';
import 'package:banksampah_application/Pages/SuperAdmin/SusutSampah/SusutSampahAdd.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Components/CardRiwayat.dart';
import '../../../Data/curentFormat.dart';
import '../../Nasabah/Controllers/user_controller.dart';
import '../Controllers/sampahController.dart';
import 'PenarikanDana.dart';
import 'SuccesDana.dart';

class PenarikanDanaAdminScreen extends StatefulWidget {
  const PenarikanDanaAdminScreen({super.key});

  @override
  State<PenarikanDanaAdminScreen> createState() =>
      _PenarikanDanaAdminScreenState();
}

class _PenarikanDanaAdminScreenState extends State<PenarikanDanaAdminScreen> {
  CurrencyTextInputFormatter _currencyFormatter =
      CurrencyTextInputFormatter(locale: 'ID', decimalDigits: 0, name: '');
  String query = "";
  Future<List<dynamic>>? _futureData;
  final _formState = GlobalKey<FormState>();

  TextEditingController hargaController = TextEditingController();
  TextEditingController kodeAdminController = TextEditingController();
  int harga = 0;
  DateTime? selectedDate;
  var data;

  Future _data() async {
    var _datas = await UserControllerNasabah().biayaAdmin();

    setState(() {
      data = _datas;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _data();
    _futureData = SampahSuperAdminController().getPenarikanAdmin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Container(
                width: size.width,
                height: 250,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 16,
                      offset: Offset(0, 0),
                      spreadRadius: -6,
                    )
                  ],
                ),
                child: Stack(
                  children: [
                    appbar3(context, size, 'Penarikan Dana ', () {
                      Navigator.pop(context);
                    }),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 90, left: 30, right: 30),
                      child: Column(
                        children: [
                          // Padding(
                          //   padding: const EdgeInsets.only(left: 0),
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.end,
                          //     children: [
                          //       Text('Tanggal Transaksi: '),
                          //       TextButton(
                          //         onPressed: () async {
                          //           final DateTime? picked =
                          //               await showDatePicker(
                          //             context: context,
                          //             initialDate:
                          //                 selectedDate ?? DateTime.now(),
                          //             firstDate: DateTime(2000),
                          //             lastDate: DateTime(2101),
                          //           );
                          //           if (picked != null &&
                          //               picked != selectedDate) {
                          //             setState(() {
                          //               selectedDate = picked;
                          //             });
                          //           }
                          //         },
                          //         child: Text(
                          //           selectedDate == null
                          //               ? 'Pilih Tanggal'
                          //               : DateFormat('dd MMM yyyy')
                          //                   .format(selectedDate!),
                          //         ),
                          //       ),
                          //       if (selectedDate != null)
                          //         IconButton(
                          //           icon: Icon(Icons.delete),
                          //           onPressed: () {
                          //             setState(() {
                          //               selectedDate = null;
                          //             });
                          //           },
                          //         ),
                          //     ],
                          //   ),
                          // ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Text(
                              "Penarikan Dana BS Admin",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF333333),
                                fontSize: 20,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Container(
                            width: size.width * 0.6,
                            height: 37,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 0, 145, 31),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              onPressed: () async {
                                add(size);
                              },
                              child: Text(
                                "Tarik Dana",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  height: 1.15,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Container(
                              width: size.width * 0.8,
                              height: 40,
                              child: TextField(
                                onChanged: (value) {
                                  setState(() {
                                    query = value;
                                  });
                                },
                                enabled: true,
                                decoration: InputDecoration(
                                  suffixIcon: Icon(Icons.search),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Color(0xFFA8A8A8),
                                      width: 2.0,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Color(0xFFA8A8A8),
                                      width: 2.0,
                                    ),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  isDense: true,
                                ),
                                style: TextStyle(
                                    fontSize: 16.0, color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            FutureBuilder<List<dynamic>>(
              future: _futureData,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data!.length == 0) {
                    return Padding(
                      padding: EdgeInsets.only(
                          top: size.height * 0.40, bottom: size.height * 0.21),
                      child: Center(
                        child: Text("DATA KOSONG"),
                      ),
                    );
                  }
                  final List<dynamic> filteredData = snapshot.data!
                      .where((item) => item["kode_admin"]
                          .toLowerCase()
                          .contains(query.toLowerCase()))
                      .toList();
                  return Padding(
                    padding: const EdgeInsets.only(left: 35, right: 35),
                    child: Container(
                      width: size.width * 0.9,
                      height: size.height * 0.53,
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        padding: EdgeInsets.only(top: 10),
                        itemCount: filteredData.length,
                        itemBuilder: (BuildContext context, index) {
                          return transactionCard2(
                              filteredData[index]["nomor_invoice"],
                              filteredData[index]["kode_admin"].toString(),
                              '',
                              DateFormat(' dd MMMM yyyy', 'id_ID').format(
                                  DateTime.parse(filteredData[index]
                                          ["createdAt"]
                                      .toString())),
                              CurrencyFormat.convertToIdr(
                                  filteredData[index]["jumlah_penarikan"], 0),
                              () async {},
                              size);
                        },
                      ),
                    ),
                  );
                } else {
                  print(snapshot.error);
                  return Center(
                    child: CircularProgressIndicator(
                      color: Colors.blue,
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Future add(Size size) => showDialog(
      context: context,
      builder: (context) {
        final random = Random();
        String invoice = 'INV';

        for (int i = 0; i < 5; i++) {
          invoice += random.nextInt(10).toString();
        }
        return StatefulBuilder(
          builder: (context, setStateForDialog) {
            return AlertDialog(
              scrollable: true,
              title: Center(
                child: Text(
                  'Penarikan Saldo',
                  style: TextStyle(
                    color: Color(0xFF333333),
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              content: Form(
                key: _formState,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: size.width * 0.67,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 0.50,
                            strokeAlign: BorderSide.strokeAlignCenter,
                            color: Color(0xFFA8A8A8),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              "Masukan Kode Admin BS",
                              style: TextStyle(
                                color: Color(0xFF333333),
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Container(
                            child: TextFormField(
                              validator: (value) {
                                if (value == '') {
                                  return "Text Tidak Boleh Kosong";
                                }
                                return null;
                              },
                              controller: kodeAdminController,
                              enabled: true,
                              style: TextStyle(
                                fontSize: 13.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5, top: 10),
                            child: Text(
                              "Masukan Nominal",
                              style: TextStyle(
                                color: Color(0xFF333333),
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Container(
                            child: TextFormField(
                              validator: (value) {
                                if (value == '') {
                                  return "Text Tidak Boleh Kosong";
                                }
                                return null;
                              },
                              keyboardType: TextInputType.number,
                              controller: hargaController,
                              inputFormatters: [_currencyFormatter],
                              enabled: true,
                              decoration: InputDecoration(
                                prefixText: "Rp ",
                                filled: true,
                                fillColor: Colors.white,
                                isDense: true,
                              ),
                              style: TextStyle(
                                fontSize: 13.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: size.width * 0.3,
                            height: 37,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 255, 255, 255),
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      width: 0.50, color: Color(0xFF3F51B5)),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              onPressed: () {
                                hargaController.clear();

                                Navigator.pop(context);
                                setState(() {});
                              },
                              child: Text(
                                "BATAL",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  height: 1.15,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: size.width * 0.3,
                            height: 37,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: Color(0xFF4CAF50),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              onPressed: () async {
                                if (_formState.currentState!.validate()) {
                                  String hargaText = hargaController.text
                                      .replaceAll('Rp ', '')
                                      .replaceAll('.', '');

                                  int parsedHarga =
                                      int.tryParse(hargaText) ?? 0;

                                  setState(() {
                                    harga = parsedHarga;
                                  });
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      });
                                  await UsersSuperAdminController()
                                      .penarikanSaldoAdmin(
                                    kode_invoice: invoice,
                                    jumlah_penarikan: harga,
                                    kode_admin: kodeAdminController.text,
                                  );

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (builde) {
                                        return SuccesDanaScreen(
                                          kode_invoice: invoice,
                                          jumlah_penarikan: harga,
                                          biaya_admin: data,
                                        );
                                      },
                                    ),
                                  ).then((value) {
                                    setState(() {});
                                  });

                                  // if (pinController.text == pin) {
                                  //   await UserControllerNasabah()
                                  //       .penarikanSaldo(
                                  //           kode_invoice: invoice,
                                  //           jumlah_penarikan: harga,
                                  //           pin: pinController.text);

                                  //   Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //       builder: (builde) {
                                  //         return SuccesScreen(
                                  //           kode_invoice: invoice,
                                  //           jumlah_penarikan: harga,
                                  //           biaya_admin: data,
                                  //         );
                                  //       },
                                  //     ),
                                  //   ).then((value) {
                                  //     setState(() {});
                                  //   });
                                  // } else {
                                  //   // PIN salah, tampilkan pesan kesalahan
                                  //   showDialog(
                                  //       context: context,
                                  //       builder: (context) {
                                  //         return StatefulBuilder(builder:
                                  //             (context, setStateForDialog) {
                                  //           return AlertDialog(
                                  //               scrollable: true,
                                  //               title: Center(
                                  //                 child:
                                  //                     Text("Pin Tidak Cocok"),
                                  //               ));
                                  //         });
                                  //       });
                                  // }

                                  // setState(() {});
                                } else {}
                              },
                              child: Text(
                                "TARIK",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  height: 1.15,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      });
}
