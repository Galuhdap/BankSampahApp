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
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? kode_reg = await getKodeReg();

    final datas = {
      'kode_user': kode_reg,
    };
    try {
      final response =
          await Dio().get('http://' + _baseUrl + '/adminbyid', data: datas);
      var data = response.data["payload"]["row"][0];

      // var kode_penimbang = data["kode_penimbang"];
      var kode_admin = data["kode_admin"];
      var rw = data["rw"];

      // await prefs.setString('kodePenimbang', kode_penimbang);
      await prefs.setString('kodeAdmin', kode_admin);
      await prefs.setString('rw', rw);

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = response.data["payload"];
        print('Ini data : $jsonData');
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

  Future<List> getUsers() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? kode_reg = await getKodeReg();

    final datas = {
      'kode_user': kode_reg,
    };
    try {
      final response =
          await Dio().get('http://' + _baseUrl + '/adminbyid', data: datas);
      var data = response.data["payload"]["row"][0];

      // var kode_penimbang = data["kode_penimbang"];
      var kode_admin = data["kode_admin"];
      var rw = data["rw"];

      // await prefs.setString('kodePenimbang', kode_penimbang);
      await prefs.setString('kodeAdmin', kode_admin);
      await prefs.setString('rw', rw);
      print(response.data["payload"]["row"]);
      return response.data["payload"]["row"];

    } catch (e) {
      // Handle exceptions here
      return [];
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

  Future<List<dynamic>> getPenarikanSaldo() async {
    String? kodeAdmin = await getDataLocal('kodeAdmin');

    final datas = {
      'kode_admin': kodeAdmin,
    };
    final response = await Dio()
        .get('http://' + _baseUrl + '/service/cekadmin', data: datas);
    final responseData = response.data['payload']['rows'];
    return responseData;
  }

  Future<List<dynamic>> getPenarikanSaldoBS() async {
    String? kodeAdmin = await getDataLocal('kodeAdmin');

    final datas = {
      'kode_admin': kodeAdmin,
    };
    final response = await Dio()
        .get('http://' + _baseUrl + '/service/cek/admin', data: datas);
    final responseData = response.data['payload']['rows'];
    return responseData;
  }

  Future<List<dynamic>> listJualSampah() async {
    String? kodeAdmin = await getDataLocal('kodeAdmin');

    final datas = {
      'kode_bs': kodeAdmin,
    };
    final response =
        await Dio().get('http://' + _baseUrl + '/setor/getsampah', data: datas);
    final responseData = response.data['payload']['rows'];
    print(responseData);
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
        'nama_penimbang': nama_penimbang,
        'rw': rw,
        'rt': rt,
        'no_telp': no_telp,
        'alamat': alamat,
        'password': password
      };
      await Dio().post('http://' + _baseUrl + '/auth/reg/pen', data: datas);
    } catch (e) {
      return e;
    }
  }

  Future konfirmasi(
      {required final nomor_invoice,
      required final jumlah_penarikan,
      required final kode_nasabah,
      required final kode_admin}) async {
    final datas = {
      "nomor_invoice": nomor_invoice,
      "jumlah_penarikan": jumlah_penarikan,
      "kode_nasabah": kode_nasabah,
      "kode_admin": kode_admin
    };
    await Dio().post('http://' + _baseUrl + '/service/validasi', data: datas);
  }

  Future cekTombol() async {
    String? kodeAdmin = await getDataLocal('kodeAdmin');
    print(kodeAdmin);
    final datas = {
      "kode_admin": kodeAdmin,
    };
    final response =
        await Dio().get('http://' + _baseUrl + '/tombol/admin', data: datas);

    final responseData = response.data['payload']['rows'][0]["tombol1"];

    print(responseData);

    return responseData;
  }

  Future tombol({required final tombol}) async {
    String? kodeAdmin = await getDataLocal('kodeAdmin');

    final datas = {
      "tombol1": tombol, 
      "kode_admin": kodeAdmin
      };
        await Dio().post('http://' + _baseUrl + '/tombol/admin', data: datas);

   
  }
}
