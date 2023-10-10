import 'dart:convert';

import 'package:banksampah_application/Pages/Penimbang/controllers/user_controller.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../SuperAdmin/Models/JenisSampahModel.dart';
import '../Models/PenimbangModel.dart';
import '../Models/RowSampahModel.dart';
import '../Models/SetorSampahModel.dart';

class SampahPenimbangController {
  final _baseUrl = '154.56.60.253:4009';

  Future getSampah() async {
    try {
      final response =
          await Dio().get('http://' + _baseUrl + '/product/sampah');

      return response.data["payload"][0];
    } catch (e) {
      print(e);
    }
  }

  static getDataLocal(String data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? _data = await prefs.getString(data);

    return _data;
  }

  Future setorSampah(
      {required String kodeSampah,
      required String kodeBarang,
      required int berat,
      required String catatan,
      required String kodeNasabah}) async {
    try {


      String? kodePenimbang = await getDataLocal('kodePenimbang');
      String? kodeAdmin = await getDataLocal('kodeAdmin');
      print(kodeAdmin);
      final datas = {
        "kode_sampah": kodeSampah,
        "kode_barang": kodeBarang,
        "berat": berat,
        "catatan": catatan,
        "kode_nasabah": kodeNasabah,
        "kode_penimbang": kodePenimbang,
        "kode_admin": kodeAdmin
      };
      final _datas = await Dio().post('http://' + _baseUrl + '/setor/sampah', data: datas);

      print(_datas.data);
      
    } catch (e) {
      print(e);
    }
  }

 Future<RowSampahModel?> getSetorSampah() async {
    String? kodePenimbang = await getDataLocal('kodePenimbang');

    final datas = {
      'kode_penimbang': kodePenimbang ,
    };
    try {
      final response =
          await Dio().get('http://' + _baseUrl + '/setor/sampah', data: datas);

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = response.data["payload"][0];
        return RowSampahModel.fromJson(jsonData);
      } else {
        // Handle error here, e.g., throw an exception or return null
        return null;
      }
    } catch (e) {
      // Handle exceptions here
      return null;
    }
  }

 Future testSetorSampah() async {
    String? kodePenimbang = await getDataLocal('kodePenimbang');

    final datas = {
      'kode_penimbang': kodePenimbang ,
    };
      final response =
          await Dio().get('http://' + _baseUrl + '/setor/sampah', data: datas);
    
   final responseData = response.data['payload']['row'];

    return responseData;
  }
}
