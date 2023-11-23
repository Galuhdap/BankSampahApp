import 'package:banksampah_application/Pages/Admin/controller/userController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../../Components/AppBar.dart';
import '../../../Data/curentFormat.dart';
import '../Controllers/sampahController.dart';

class ListPenjualanBSSuperAdminScreen extends StatefulWidget {
  const ListPenjualanBSSuperAdminScreen({super.key});

  @override
  State<ListPenjualanBSSuperAdminScreen> createState() =>
      _ListPenjualanBSSuperAdminScreenState();
}

class _ListPenjualanBSSuperAdminScreenState
    extends State<ListPenjualanBSSuperAdminScreen> {
  UserControllerAdmin userController = UserControllerAdmin();
  Future<List<dynamic>>? _futureData;
  String query = "";
  @override
  void initState() {
    // TODO: implement initState
    _futureData = SampahSuperAdminController().getPenjalanBs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          appbar3(context, size, 'List Penjualan Admin BS', () {
            Navigator.pop(context);
          }),
          Padding(
            padding: const EdgeInsets.only(top: 10),
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
                    .where((item) => item["kode_admin_bs"]
                        .toLowerCase()
                        .contains(query.toLowerCase()))
                    .toList();
                return Padding(
                  padding: const EdgeInsets.only(top: 20, left: 35, right: 35),
                  child: Container(
                    width: size.width * 0.9,
                    height: size.height * 0.7,
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.only(top: 2),
                      itemCount: filteredData.length,
                      itemBuilder: (BuildContext context, index) {
                        return listNasabahSampah(
                          size,
                          filteredData[index]["kode_susut_sampah_bs"],
                          filteredData[index]["kode_super_admin"],
                          filteredData[index]["JenisSampahKering"]
                              ["jenis_sampah"],
                          filteredData[index]["JenisBarang"]["jenis_barang"],
                          CurrencyFormat.convertToIdr(
                              filteredData[index]["harga"], 0),
                          filteredData[index]["berat"],
                          () async {
                            await SampahSuperAdminController()
                                .deletePenjualanAdmin(
                              kode_susut_sampah_bs: filteredData[index]
                                  ["kode_susut_sampah_bs"],
                              kode_barang: filteredData[index]["JenisBarang"]
                                  ["kode_barang"],
                              berat: filteredData[index]["berat"],
                              kode_admin: filteredData[index]
                                  ["kode_admin_bs"],
                            );
                            Navigator.pop(context);
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

  Padding listNasabahSampah(
      Size size, ttl, kode, jenis, barang, sampah, berat, hapus) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Stack(
        children: [
          Container(
            width: size.width * 0.9,
            height: 120,
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
                    '${kode}',
                    style: TextStyle(
                      color: Color(0xFF3D3D3D),
                      fontSize: 11,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.015,
                  ),
                  Text(
                    "Sampah ${jenis}",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.001,
                  ),
                  Text(
                    "${barang}",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.009,
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
                      Text(
                        'Berat : ${berat} Kg',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: size.width * 0.73,
            top: size.height * 0.01,
            child: PopupMenuButton(
              itemBuilder: (context) => [
                PopupMenuItem(
                  onTap: () {
                    Future.delayed(Duration.zero).then((value) {
                      Alert(
                        context: context,
                        type: AlertType.warning,
                        title: "HAPUS",
                        desc: "Anda yakin untuk menghapus ?",
                        buttons: [
                          DialogButton(
                            child: Text(
                              "BATAL",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () => Navigator.pop(context),
                            color: Color.fromRGBO(0, 179, 134, 1.0),
                          ),
                          DialogButton(
                            child: Text(
                              "HAPUS",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: hapus,
                            gradient: LinearGradient(colors: [
                              Color.fromRGBO(116, 116, 191, 1.0),
                              Color.fromRGBO(52, 138, 199, 1.0)
                            ]),
                          )
                        ],
                      ).show();
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 7),
                    child: Text(
                      "Hapus",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
              child: Icon(
                Icons.more_vert,
                size: 20,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
