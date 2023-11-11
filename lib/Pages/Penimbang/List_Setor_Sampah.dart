import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Components/AppBar.dart';
import 'Beranda.dart';
import 'Models/RowSampahModel.dart';
import 'controllers/sampah_controller.dart';

class ListSetorSampahScreen extends StatefulWidget {
  const ListSetorSampahScreen({super.key});

  @override
  State<ListSetorSampahScreen> createState() => _ListSetorSampahScreenState();
}

class _ListSetorSampahScreenState extends State<ListSetorSampahScreen> {
  final _baseUrl = '154.56.60.253:4009';
  static getDataLocal(String data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? _data = await prefs.getString(data);

    return _data;
  }

  Future<List<dynamic>> testSetorSampah() async {
    String? kodePenimbang = await getDataLocal('kodePenimbang');
    final datas = {
      'kode_penimbang': kodePenimbang,
    };
    final response =
        await Dio().get('http://' + _baseUrl + '/setor/sampah', data: datas);
    final responseData = response.data['payload']['row'];
    return responseData;
  }

  Future<List<dynamic>> nasabahSampah() async {
    String? kodePenimbang = await getDataLocal('kodePenimbang');
    final datas = {
      'kode_penimbang': kodePenimbang,
    };
    final response =
        await Dio().get('http://' + _baseUrl + '/setor/sampah', data: datas);
    final responseData = response.data['payload']['row'];
    return responseData;
  }

  String query = "";

  Future<List<dynamic>>? _futureData;

  @override
  void initState() {
    // TODO: implement initState
    _futureData = testSetorSampah();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Padding(padding: EdgeInsets.only(top: 0)),
          appbar3(context, size, 'List Setor Sampah', () {
            Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (builde) {
                return BerandaPenimbang();
              },
            ));
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
                        top: size.height * 0.4, bottom: size.height * 0.255),
                    child: Center(
                      child: Text("DATA KOSONG"),
                    ),
                  );
                }
                final List<dynamic> filteredData = snapshot.data!
                    .where((item) => item["kode_nasabah"]
                        .toLowerCase()
                        .contains(query.toLowerCase()))
                    .toList();
                return Padding(
                  padding: const EdgeInsets.only(top: 20, left: 35, right: 35),
                  child: Container(
                    width: size.width * 0.9,
                    height: size.height * 0.75,
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.only(top: 5),
                      itemCount: filteredData.length,
                      itemBuilder: (BuildContext context, index) {
                        return listSetorSampah(
                          size,
                          filteredData[index]["kode_setor"],
                          filteredData[index]["kode_nasabah"],
                          DateFormat('EEEE, dd MMMM yyyy', 'id_ID').format(
                              DateTime.parse(filteredData[index]["createdAt"])),
                          filteredData[index]["JenisSampahKering"]
                              ["jenis_sampah"],
                          filteredData[index]["JenisBarang"]["jenis_barang"],
                          filteredData[index]["berat"],
                          () async {
                            await SampahPenimbangController().deleteSetorSampah(
                                kodeSetor: filteredData[index]["kode_setor"],
                                berat: filteredData[index]["berat"],
                                saldo: filteredData[index]["total"],
                                kode_nasabah: filteredData[index]
                                    ["kode_nasabah"],
                                kode_admin: filteredData[index]["kode_admin"]);
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (builde) {
                                  return BerandaPenimbang();
                                },
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                );
              } else {
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

  Padding listSetorSampah(
      Size size, ttl, kode, tgl, sampah, barang, berat, hapus) {
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
                    height: size.height * 0.015,
                  ),
                  Text(
                    tgl,
                    style: TextStyle(
                      color: Color(0xFF7F7F7F),
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
                        'Sampah ${sampah}',
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
                  SizedBox(
                    height: size.height * 0.005,
                  ),
                  Text(
                    '${barang}',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
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
