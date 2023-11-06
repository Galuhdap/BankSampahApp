import 'package:banksampah_application/Pages/Admin/Models/nasabah_model.dart';
import 'package:banksampah_application/Pages/Admin/controller/userController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../Components/AppBar.dart';
import '../../Data/curentFormat.dart';
import 'DetailPenarikasnSaldo.dart';
import 'Models/detailsampahnasabah.dart';

class ListPenarikanSaldoBSScreen extends StatefulWidget {
  const ListPenarikanSaldoBSScreen({super.key});

  @override
  State<ListPenarikanSaldoBSScreen> createState() =>
      _ListPenarikanSaldoBSScreenState();
}

class _ListPenarikanSaldoBSScreenState
    extends State<ListPenarikanSaldoBSScreen> {
  UserControllerAdmin userController = UserControllerAdmin();
  Future<List<dynamic>>? _futureData;
  String query = "";
  bool isToggled = false;

  var cek;
  Future datas() async {
    var _cek = await UserControllerAdmin().cekTombol();
    setState(() {
      cek = _cek;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _futureData = UserControllerAdmin().getPenarikanSaldoBS();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          appbar3(context, size, 'List Penarikan Saldo BS',(){Navigator.pop(context);}),
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
                style: TextStyle(fontSize: 16.0, color: Colors.black),
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
                    .where((item) => item["nomor_invoice"]
                        .toLowerCase()
                        .contains(query.toLowerCase()))
                    .toList();
                // final nasabah = snapshot.data!;

                return Padding(
                  padding: const EdgeInsets.only(left: 35, right: 35),
                  child: Container(
                    width: size.width * 0.9,
                    height: size.height * 0.8,
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.only(top: 10),
                      itemCount: filteredData.length,
                      itemBuilder: (BuildContext context, index) {
                        String statusText = "";
                        if (filteredData[index]["status"] == false) {
                          statusText = "Sudah Dibayar";
                        }
                        return listNasabahSampah(
                          size,
                          filteredData[index]["nomor_invoice"],
                          filteredData[index]["kode_super_admin"],
                          statusText,
                          CurrencyFormat.convertToIdr(
                              filteredData[index]["jumlah_penarikan"], 0),
                          () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (builde) {
                                  return DetailPenarikanSaldoScreen(
                                    kode_invoice: snapshot.data![index]
                                        ["nomor_invoice"],
                                    jumlah_penarikan: snapshot.data![index]
                                        ["jumlah_penarikan"],
                                    kode_nasabah: snapshot.data![index]
                                        ["kode_nasabah"],
                                    kode_admin: snapshot.data![index]
                                        ["kode_admin"],
                                  );
                                },
                              ),
                            ).then((value) {
                              setState(() {});
                            });
                          },
                        );
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
    );
  }

  Padding listNasabahSampah(Size size, ttl, kode, alamat, sampah, ontp) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: InkWell(
        onTap: ontp,
        child: Container(
          width: size.width * 0.9,
          height: 111,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            shadows: [
              BoxShadow(
                color: Color(0x28000000),
                blurRadius: 16,
                offset: Offset(0, 0),
                spreadRadius: -6,
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ttl,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.005,
                ),
                Text(
                  'Kode Nasabah : ${kode}',
                  style: TextStyle(
                    color: Color(0xFF3D3D3D),
                    fontSize: 11,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Text(
                  "${alamat}",
                  style: TextStyle(
                    color: Color.fromARGB(255, 66, 66, 66),
                    fontSize: 10,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.005,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${sampah}',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Padding pilihanReg(Size size, img, txt, ontp, isToggled) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: InkWell(
      onTap: ontp,
      child: Container(
        width: size.width * 0.3,
        height: 40,
        decoration: ShapeDecoration(
          color: !isToggled ? Colors.grey : Color(0xFF4CAF50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              !isToggled ? "MATI" : "MENAYALA",
              style: TextStyle(
                color: !isToggled
                    ? Color.fromARGB(255, 255, 255, 255)
                    : Colors.white,
                fontSize: 10,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
