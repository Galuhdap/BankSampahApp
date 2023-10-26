import 'package:banksampah_application/Pages/Admin/Models/nasabah_model.dart';
import 'package:banksampah_application/Pages/Admin/controller/userController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../Components/AppBar.dart';
import 'Controllers/sampahController.dart';
import 'Controllers/user_controller.dart';
import 'EditListNasabah.dart';
import 'GantiPasswordNasabah.dart';
import 'gantiPassword.dart';


class ListNasabahSuperAdminScreen extends StatefulWidget {
  const ListNasabahSuperAdminScreen({super.key});

  @override
  State<ListNasabahSuperAdminScreen> createState() => _ListNasabahSuperAdminScreenState();
}

class _ListNasabahSuperAdminScreenState extends State<ListNasabahSuperAdminScreen> {
  UserControllerAdmin userController = UserControllerAdmin();
  Future<List<dynamic>>? _futureData;

  String query ="";

  @override
  void initState() {
    // TODO: implement initState
    _futureData = SampahSuperAdminController().getNasabah();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          appbar3(context, size, 'List Nasabah'),
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
                    .where((item) => item["nama_nasabah"]
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
                          filteredData[index]["nama_nasabah"],
                          filteredData[index]["kode_nasabah"],
                          filteredData[index]["alamat"],
                          filteredData[index]["rw"],
                          filteredData[index]["rt"],
                          filteredData[index]["DetailSampahNasabahs"][0]["saldo"],
                         filteredData[index]["DetailSampahNasabahs"][0]["berat"],
                         filteredData[index]["kode_user"],
                         (value) {
                          if (value == 'editAdmin') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (builde) {
                                  return EditNasabahScreen(
                                    kode_nasabah: filteredData[index]["kode_nasabah"],
                                    nama_nasabah: filteredData[index]["nama_nasabah"],
                                    alamat: filteredData[index]["alamat"],
                                    no_telp: filteredData[index]["no_telp"],
                                    rw: filteredData[index]["rw"],
                                    rt: filteredData[index]["rt"],
                                    pin: filteredData[index]["pin"],
                                  );
                                },
                              ),
                            ).then((value) {
                              setState(() {});
                            });
                          } else if (value == 'gantipassword') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (builde) {
                                  return GantiPasswordNasabahScreen(
                                      kode_reg: filteredData[index]
                                          ["kode_user"]);
                                },
                              ),
                            ).then((value) {
                              setState(() {});
                            });
                          }
                        }, () async {
                          await UsersSuperAdminController().deleteNasabah(
                              kode_reg: filteredData[index]["kode_user"],
                              kode_nasabah: filteredData[index]["kode_nasabah"],
                              kode_detail_sampah: filteredData[index]["DetailSampahNasabahs"][0]["kode_detail_sampah"]
                              );
                          Navigator.pop(context);
                        }
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

  Padding listNasabahSampah(Size size, ttl, kode, alamat, rw, rt, sampah, berat, reg, edit, hapus) {
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
                  Text(
                    'Kode Reg : ${reg}',
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
                    "${alamat} RW ${rw} RT ${rt}",
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
                  )
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
                  value: 'editAdmin',
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 7, top: 7),
                    child: Text(
                      "Edit Nasabah",
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
                  value: 'gantipassword',
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 7, top: 7),
                    child: Text(
                      "Ganti Password",
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
