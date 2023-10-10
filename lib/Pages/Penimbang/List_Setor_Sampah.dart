import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Components/AppBar.dart';
import 'Models/RowSampahModel.dart';
import 'Models/SetorSampahModel.dart';
import 'controllers/sampah_controller.dart';

class ListSetorSampahScreen extends StatefulWidget {
  const ListSetorSampahScreen({super.key});

  @override
  State<ListSetorSampahScreen> createState() => _ListSetorSampahScreenState();
}

class _ListSetorSampahScreenState extends State<ListSetorSampahScreen> {
  final datas = [
    {
      'nama': 'Aldi Permana',
      'kode': 'KP-0012',
      'tgl': '23 juni 2023',
      'sampah': 'Kertas',
      'berat': 200,
    },
    {
      'nama': 'Aldi Permana',
      'kode': 'KP-0012',
      'tgl': '23 juni 2023',
      'sampah': 'Kertas',
      'berat': 200,
    },
    {
      'nama': 'Aldi Permana',
      'kode': 'KP-0012',
      'tgl': '23 juni 2023',
      'sampah': 'Kertas',
      'berat': 200,
    },
    {
      'nama': 'Aldi Permana',
      'kode': 'KP-0012',
      'tgl': '23 juni 2023',
      'sampah': 'Kertas',
      'berat': 200,
    },
    {
      'nama': 'Aldi Permana',
      'kode': 'KP-0012',
      'tgl': '23 juni 2023',
      'sampah': 'Kertas',
      'berat': 200,
    },
    {
      'nama': 'Aldi Permana',
      'kode': 'KP-0012',
      'tgl': '23 juni 2023',
      'sampah': 'Kertas',
      'berat': 200,
    },
  ];
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

  List<RowSampahModel>? _datas;
  Future<List<dynamic>>? _futureData;
  Future getDatas() async {
    List<RowSampahModel> datas =
        await SampahPenimbangController().testSetorSampah();
    setState(() {
      _datas = datas;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getDatas();
    _futureData = testSetorSampah();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(_datas);
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Padding(padding: EdgeInsets.only(top: 0)),
          appbar3(context, size, 'List Setor Sampah'),
          FutureBuilder<List<dynamic>> (
            future: _futureData,
            builder: (context, snapshot) {

              if (snapshot.hasData) {
                if (snapshot.data!.length == 0) {
                  return Padding(
                    padding:  EdgeInsets.only(top: size.height * 0.25, bottom: size.height * 0.255),
                    child: Center(
                      child: Text("DATA KOSONG"),
                    ),
                  );
                }
                 final sampah = snapshot.data! ;
                return Padding(
                  padding: const EdgeInsets.only(top: 20, left: 35, right: 35),
                  child: Container(
                    width: size.width * 0.9,
                    height: size.height * 0.79,
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.only(top: 5),
                      itemCount: sampah.length,
                      itemBuilder: (BuildContext context, index) {
                        
                        return listSetorSampah(
                            size,
                            snapshot.data![index]["kode_nasabah"],
                            snapshot.data![index]["kode_penimbang"],
                            DateFormat('EEEE, dd MMMM yyyy', 'id_ID')
                                .format(DateTime.parse(snapshot.data![index]["createdAt"])),
                            snapshot.data![index]["kode_sampah"],
                             snapshot.data![index]["berat"],
                            );
                      },
                    ),
                  ),
                );
              } else {
                print("Error");
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

  Padding listSetorSampah(Size size, ttl, kode, tgl, sampah, berat) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
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
                'Kode Pengepul : ${kode}',
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
