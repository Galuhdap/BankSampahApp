import 'package:banksampah_application/Pages/Admin/controller/userController.dart';
import 'package:flutter/material.dart';

import '../../Components/AppBar.dart';
import '../../Data/curentFormat.dart';
import 'Controllers/sampahController.dart';
import 'Tambah/SampahBarangEdit.dart';

class ListSampahSuperAdminScreen extends StatefulWidget {
  const ListSampahSuperAdminScreen({super.key});

  @override
  State<ListSampahSuperAdminScreen> createState() =>
      _ListSampahSuperAdminScreenState();
}

class _ListSampahSuperAdminScreenState
    extends State<ListSampahSuperAdminScreen> {
  UserControllerAdmin userController = UserControllerAdmin();
  Future<List<dynamic>>? _futureData;
  String query = "";
  @override
  void initState() {
    // TODO: implement initState
    _futureData = SampahSuperAdminController().listSampah();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          appbar3(context, size, 'List Sampah',(){Navigator.pop(context);}),
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
                    .where((item) => item["JenisBarangs"][0]["jenis_barang"]
                        .toLowerCase()
                        .contains(query.toLowerCase()))
                    .toList();
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
                        return listNasabahSampah(
                            size,
                            snapshot.data![index]["jenis_sampah"] ?? '',
                            snapshot.data![index]["JenisBarangs"][0]
                                ["jenis_barang"] ?? '',
                            snapshot.data![index]["JenisBarangs"][0]
                                ["kode_barang"] ?? '',
                            CurrencyFormat.convertToIdr(
                                snapshot.data![index]["JenisBarangs"][0]
                                    ["harga_pertama"] ?? 0,
                                0),
                            CurrencyFormat.convertToIdr(
                                snapshot.data![index]["JenisBarangs"][0]
                                    ["harga_kedua"] ?? 0,
                                0), (value) {
                          if (value == 'edit') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (builde) {
                                  return BarangSampahEditScreen(
                                    namaBarang: snapshot.data![index]
                                        ["JenisBarangs"][0]["jenis_barang"],
                                    hargaPertama: snapshot.data![index]
                                        ["JenisBarangs"][0]["harga_pertama"],
                                    hargaKedua: snapshot.data![index]
                                        ["JenisBarangs"][0]["harga_kedua"],
                                    kodeBarang: snapshot.data![index]
                                        ["JenisBarangs"][0]["kode_barang"],
                                  );
                                },
                              ),
                            ).then((value) {
                              setState(() {});
                            });
                          }
                        }, () {});
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
      Size size, ttl, kode, sampah, harga1, harga2, edit, hapus) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Stack(
        children: [
          Container(
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
                    kode,
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
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Text(
                    'Harga Nasabah : ${harga1}',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                  Text(
                    'Harga Admin : ${harga2}',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.005,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: size.width * 0.73,
            top: size.height * 0.01,
            child: PopupMenuButton(
              onSelected: edit,
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 'edit',
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 7, top: 7),
                    child: Text(
                      "Edit",
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
                PopupMenuItem(
                  onTap: hapus,
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
