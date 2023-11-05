import 'package:banksampah_application/Components/AppBar.dart';
import 'package:banksampah_application/Pages/SuperAdmin/SusutSampah/SusutSampahAdd.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../Components/CardRiwayat.dart';
import '../../../Data/curentFormat.dart';
import '../Beranda.dart';
import '../Controllers/sampahController.dart';

class SusutSampahScreen extends StatefulWidget {
  const SusutSampahScreen({super.key});

  @override
  State<SusutSampahScreen> createState() => _SusutSampahScreenState();
}

class _SusutSampahScreenState extends State<SusutSampahScreen> {
  String query = "";
  Future<List<dynamic>>? _futureData;

  DateTime? selectedDate;

  @override
  void initState() {
    // TODO: implement initState
    _futureData = SampahSuperAdminController().getSusutSampahAdmin();
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
                    appbar5(
                      context,
                      size,
                      'Susut Sampah',
                      () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (builde) {
                              return BerandaSuperAdmin();
                            },
                          ),
                        );
                      },
                    ),
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
                              'Susut Sampah',
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
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (builde) {
                                      return SusutSampahAddScreen();
                                    },
                                  ),
                                ).then((value) {
                                  setState(() {});
                                });
                              },
                              child: Text(
                                "CATAT SUSUT SAMPAH",
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
                      .where((item) => item["nama_pembeli"]
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
                              filteredData[index]["kode_susut_induk"],
                              filteredData[index]["nama_pembeli"].toString(),
                              '${filteredData[index]["berat"]} Kg',
                              CurrencyFormat.convertToIdr(
                                  filteredData[index]["harga"], 0),
                              CurrencyFormat.convertToIdr(
                                  filteredData[index]["total"], 0),
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
}
