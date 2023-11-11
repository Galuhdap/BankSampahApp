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
  static getDataLocal(String data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? _data = await prefs.getString(data);

    return _data;
  }

  Future getSampah() async {
    String? kodeSuperAdmin = await getDataLocal('kodeSuperAdmin');
    try {
      final datas = {"kode_super_induk": kodeSuperAdmin};
      final response = await Dio()
          .get('http://' + _baseUrl + '/product/sampah/admin', data: datas);

      return response.data["payload"];
    } catch (e) {
      print(e);
    }
  }

  Future setorSampah(
      {required String kodeSampah,
      required String kodeBarang,
      required double berat,
      required String catatan,
      required String kodeNasabah}) async {
    try {
      String? kodePenimbang = await getDataLocal('kodePenimbang');
      String? kodeAdmin = await getDataLocal('kodeAdmin');
      String? kodeSuperAdmin = await getDataLocal('kodeSuperAdmin');

      final datas = {
        "kode_sampah": kodeSampah,
        "kode_barang": kodeBarang,
        "berat": berat,
        "catatan": catatan,
        "kode_nasabah": kodeNasabah,
        "kode_penimbang": kodePenimbang,
        "kode_admin": kodeAdmin,
        "kode_super_admin": kodeSuperAdmin,
      };
      await Dio().post('http://' + _baseUrl + '/setor/sampah', data: datas);
    } catch (e) {
      print(e);
    }
  }

  Future validasiNasabah({required String kodeNasabah}) async {
    try {
      final datas = {
        "kode_nasabah": kodeNasabah,
      };
     final response = await Dio().get('http://' + _baseUrl + '/cek/nasabahByid', data: datas);
      return response.data;
    } catch (e) {
      print(e);
    }
  }

  Future deleteSetorSampah({
    required final kodeSetor,
    required final berat,
    required final saldo,
    required final kode_nasabah,
    required final kode_admin,
  }) async {
    try {
      final datas = {
        "kodeSetor": kodeSetor,
        "berat": berat,
        "saldo": saldo,
        "kode_nasabah": kode_nasabah,
        "kode_admin": kode_admin
      };
      await Dio()
          .get('http://' + _baseUrl + '/setor/sampah/hapus', data: datas);
    } catch (e) {
      return e;
    }
  }

  Future<RowSampahModel?> getSetorSampah() async {
    String? kodePenimbang = await getDataLocal('kodePenimbang');

    final datas = {
      'kode_penimbang': kodePenimbang,
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
      'kode_penimbang': kodePenimbang,
    };
    final response =
        await Dio().get('http://' + _baseUrl + '/setor/sampah', data: datas);

    final responseData = response.data['payload']['row'];

    return responseData;
  }
}
