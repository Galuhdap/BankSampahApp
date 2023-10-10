import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../Components/Setting.dart';
import '../../Components/AppBar.dart';
import '../../Components/MenuKategori.dart';
import '../../Components/PointCard.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../Components/CardRiwayat.dart';
import '../../../Data/curentFormat.dart';
import 'OTPScreen.dart';

class PenarikanSaldo extends StatefulWidget {
  const PenarikanSaldo({super.key});

  @override
  State<PenarikanSaldo> createState() => _PenarikanSaldoState();
}

class _PenarikanSaldoState extends State<PenarikanSaldo> {
  String query = "";
  final _formState = GlobalKey<FormState>();

  CurrencyTextInputFormatter _currencyFormatter =
      CurrencyTextInputFormatter(locale: 'ID', decimalDigits: 0, name: '');

  TextEditingController hargaController = TextEditingController();

  int harga = 0;

  DateTime? selectedDate;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Container(
              width: size.width,
              height: 300,
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
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: appbar3(context, size, 'Penarikan Saldo'),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 70, left: 30, right: 30),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text('Tanggal Transaksi: '),
                              TextButton(
                                onPressed: () async {
                                  final DateTime? picked = await showDatePicker(
                                    context: context,
                                    initialDate: selectedDate ?? DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2101),
                                  );
                                  if (picked != null &&
                                      picked != selectedDate) {
                                    setState(() {
                                      selectedDate = picked;
                                    });
                                  }
                                },
                                child: Text(
                                  selectedDate == null
                                      ? 'Pilih Tanggal'
                                      : DateFormat('dd MMM yyyy')
                                          .format(selectedDate!),
                                ),
                              ),
                              if (selectedDate != null)
                                IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () {
                                    setState(() {
                                      selectedDate = null;
                                    });
                                  },
                                ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: Text(
                            'SALDO',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF333333),
                              fontSize: 20,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Text(
                            CurrencyFormat.convertToIdr(23333, 0),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF333333),
                              fontSize: 32,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        // FutureBuilder<int>(
                        //   future: saldoController.allKas(),
                        //   builder: (context, snapshot) {
                        //     if (snapshot.connectionState ==
                        //         ConnectionState.waiting) {
                        //       return CircularProgressIndicator();
                        //     } else {
                        //       return Padding(
                        //         padding: const EdgeInsets.only(bottom: 20),
                        //         child: Text(
                        //           CurrencyFormat.convertToIdr(
                        //               snapshot.data ?? 0, 0),
                        //           textAlign: TextAlign.center,
                        //           style: TextStyle(
                        //             color: Color(0xFF333333),
                        //             fontSize: 32,
                        //             fontFamily: 'Poppins',
                        //             fontWeight: FontWeight.w600,
                        //           ),
                        //         ),
                        //       );
                        //     }
                        //   },
                        // ),
                        Container(
                          width: 166,
                          height: 37,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Color(0xFF4CAF50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            onPressed: () async {
                              add(size);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/img/coin.png",
                                  width: 15,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "PENARIKAN DANA",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    height: 1.15,
                                  ),
                                ),
                              ],
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
          Padding(
            padding: const EdgeInsets.only(left: 35, top: 20, right: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Riwayat Aktivitas',
                  style: TextStyle(
                    color: Color(0xFF333333),
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                width: size.width * 0.9,
                height: 344,
                decoration: ShapeDecoration(
                  color: Color(0xFFDCEAE7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Color(0x28000000),
                      blurRadius: 1,
                      offset: Offset(0, 0),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: SizedBox(
                  height: 344,
                  width: 345,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    padding: EdgeInsets.only(top: 1),
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Column(
                          children: [
                            cardRiwayat(
                              size,
                              Color(0xFFE20000),
                              'Penarikan Saldo',
                              '23 Juni 2023 - 14:30',
                              '-5.0000000',
                              Color(0xFFE20000),
                            ),
                            cardRiwayat(
                              size,
                              Color(0xFFE20000),
                              'Penarikan Saldo',
                              '23 Juni 2023 - 14:30',
                              '-5.0000000',
                              Color(0xFFE20000),
                            ),
                            cardRiwayat(
                              size,
                              Color(0xFFE20000),
                              'Penarikan Saldo',
                              '23 Juni 2023 - 14:30',
                              '-5.0000000',
                              Color(0xFFE20000),
                            ),
                            cardRiwayat(
                              size,
                              Color(0xFFE20000),
                              'Penarikan Saldo',
                              '23 Juni 2023 - 14:30',
                              '-5.0000000',
                              Color(0xFFE20000),
                            ),
                            cardRiwayat(
                              size,
                              Color(0xFFE20000),
                              'Penarikan Saldo',
                              '23 Juni 2023 - 14:30',
                              '-5.0000000',
                              Color(0xFFE20000),
                            ),
                            cardRiwayat(
                              size,
                              Color(0xFFE20000),
                              'Penarikan Saldo',
                              '23 Juni 2023 - 14:30',
                              '-5.0000000',
                              Color(0xFFE20000),
                            ),
                            cardRiwayat(
                              size,
                              Color(0xFFE20000),
                              'Penarikan Saldo',
                              '23 Juni 2023 - 14:30',
                              '-5.0000000',
                              Color(0xFFE20000),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }

  Future add(Size size) => showDialog(
        context: context,
        builder: (context) {
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
                              padding:
                                  const EdgeInsets.only(bottom: 5, top: 10),
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

                                    // await pembelianController.insert(
                                    //     nama_barang: namaController.text,
                                    //     jmlh_brng:
                                    //         int.parse(jmlhController.text),
                                    //     satuan: satuanController.text,
                                    //     harga: harga,
                                    //     tgl: _date != null
                                    //         ? _date.toString()
                                    //         : DateTime.now().toString());

                                    // namaController.clear();
                                    // jmlhController.clear();
                                    // satuanController.clear();
                                    hargaController.clear();
                                    
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (builde) {
                                            return OTPScreen();
                                          },
                                        ),
                                      ).then((value) {
                                        setState(() {});
                                      });
                                    
                                    setState(() {});
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
        },
      );
}
