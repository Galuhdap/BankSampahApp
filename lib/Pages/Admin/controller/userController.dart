import 'dart:convert';
import 'package:banksampah_application/Pages/Admin/Models/nasabah_model.dart';
import 'package:banksampah_application/Pages/Admin/Models/penimbang_model.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/AdminModel.dart';
import '../Models/detailsampahnasabah.dart';

class UserControllerAdmin {
  final _baseUrl = '154.56.60.253:4009';
  final Ip = '154.56.60.253:4009';

  static getDataLocal(String data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? _data = await prefs.getString(data);

    return _data;
  }
  Future getKodeReg() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? kodeReg = await prefs.getString('kodeReg');

    return kodeReg;
  }

  Future<Admin?> getUser() async {
    String? kode_reg = await getKodeReg();
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final datas = {
      'kode_user': kode_reg,
    };
    try {
      final response =
          await Dio().get('http://' + _baseUrl + '/adminbyid', data: datas);
      var data = response.data["payload"]["row"][0];

      // var kode_penimbang = data["kode_penimbang"];
      var kode_admin = data["kode_admin"];
      // await prefs.setString('kodePenimbang', kode_penimbang);
      await prefs.setString('kodeAdmin', kode_admin);

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = response.data["payload"];
        return Admin.fromJson(jsonData);
      } else {
        // Handle error here, e.g., throw an exception or return null
        return null;
      }
    } catch (e) {
      // Handle exceptions here
      return null;
    }
  }

    Future<List<dynamic>> getNasabah() async {
    String? kodeAdmin = await getDataLocal('kodeAdmin');

    final datas = {
      'kode_admin': kodeAdmin,
    };
    final response =
        await Dio().get('http://' + _baseUrl + '/nasabah', data: datas);
    final responseData = response.data['payload']['row'];
    return responseData;
  }
    Future<List<dynamic>> getPenimbang() async {
    String? kodeAdmin = await getDataLocal('kodeAdmin');

    final datas = {
      'kode_admin': kodeAdmin,
    };
    final response =
        await Dio().get('http://' + _baseUrl + '/penimbang', data: datas);
    final responseData = response.data['payload']['row'];
    return responseData;
  }


  Future registerNasabah({
    required final nama_nasabah,
    required final rw,
    required final rt,
    required final no_telp,
    required final alamat,
    required final pin,
    required final password,
  }) async {
    try {
      final datas = {
        'nama_nasabah': nama_nasabah,
        ' alamat': alamat,
        'rw': rw,
        'rt': rt,
        'no_telp': no_telp,
        'alamat': alamat,
        'pin': pin,
        'password': password
      };
      await Dio().post('http://' + _baseUrl + '/auth/reg/nas', data: datas);
    } catch (e) {
      return e;
    }

  }

  Future registerPenimbang({
    required final nama_penimbang,
    required final rw,
    required final rt,
    required final no_telp,
    required final alamat,
    required final password,
  }) async {
    try {
      final datas = {
    'nama_penimbang' : nama_penimbang,
    'rw': rw,
    'rt': rt,
    'no_telp' : no_telp,
    'alamat' : alamat,
    'password':password
      };
      await Dio().post('http://' + _baseUrl + '/auth/reg/pen', data: datas);
    } catch (e) {
      return e;
    }

  }
}
