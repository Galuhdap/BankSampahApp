import 'package:banksampah_application/Pages/Admin/controller/userController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../Components/AppBar.dart';

class ListPenimbangScreen extends StatefulWidget {
  const ListPenimbangScreen({super.key});

  @override
  State<ListPenimbangScreen> createState() => _ListPenimbangScreenState();
}

class _ListPenimbangScreenState extends State<ListPenimbangScreen> {

  UserControllerAdmin userController = UserControllerAdmin();


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
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          appbar3(context, size, 'List Penimbang'),
          FutureBuilder<List>(
            future: userController.getPenimbang(),
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
                return Padding(
            padding: const EdgeInsets.only(top: 20, left: 35, right: 35),
            
            child: Container(
              width: size.width * 0.9,
              height: size.height * 0.82,
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.only(top: 10),
                itemCount: datas.length,
                itemBuilder: (BuildContext context, index) {
                  return listSetorSampah(
                      size,
                      datas[index]['nama'],
                      datas[index]['kode'],
                      datas[index]['tgl'],
                      datas[index]['sampah'],
                      datas[index]['berat']);
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
