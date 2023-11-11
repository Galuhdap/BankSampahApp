import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/JenisSampahModel.dart';

class LaporanSuperAdminController {
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

  Future<int> getsaldoMasuk() async {
    String? kodeSuperAdmin = await getDataLocal('kodeSuperAdmin');

    final datas = {
      'kode_super_admin': kodeSuperAdmin,
    };
    final response =
        await Dio().get('http://' + _baseUrl + '/laporan/saldomasuk/induk', data: datas);
    final responseData = response.data['payload'];
    return responseData;
  }

  Future<int> getsaldoKeluar() async {
    String? kodeSuperAdmin = await getDataLocal('kodeSuperAdmin');

    final datas = {
      'kode_super_admin': kodeSuperAdmin,
    };
    final response =
        await Dio().get('http://' + _baseUrl + '/laporan/saldokeluar/induk', data: datas);
    final responseData = response.data['payload'];
    return responseData;
  }

  Future<int> getpenjualanSampahK3() async {
    String? kodeSuperAdmin = await getDataLocal('kodeSuperAdmin');

    final datas = {
      'kode_super_admin': kodeSuperAdmin,
    };
    final response =
        await Dio().get('http://' + _baseUrl + '/laporan/penjualansampah/induk', data: datas);
    final responseData = response.data['payload'];
    return responseData;
  }

  Future<int> getsampahMasuk() async {
    String? kodeSuperAdmin = await getDataLocal('kodeSuperAdmin');

    final datas = {
      'kode_super_admin': kodeSuperAdmin,
    };
    final response =
        await Dio().get('http://' + _baseUrl + '/laporan/sampahmasuk/induk', data: datas);
    final responseData = response.data['payload']['rows'];
    return responseData;
  }
  Future<int> totalSamapah() async {
    String? kodeSuperAdmin = await getDataLocal('kodeSuperAdmin');

    final datas = {
      'kode_super_admin': kodeSuperAdmin,
    };
    final response =
        await Dio().get('http://' + _baseUrl + '/laporan/sampah/induk', data: datas);
    final responseData = response.data['payload'];
    return responseData;
  }

  Future<int> totalNasabah() async {
    String? kodeSuperAdmin = await getDataLocal('kodeSuperAdmin');

    final datas = {
      'kode_super_admin': kodeSuperAdmin,
    };
    final response =
        await Dio().get('http://' + _baseUrl + '/laporan/nasabah/induk', data: datas);
    final responseData = response.data["payload"];
    print("Print Datas :  $responseData");
    return responseData;
  }

  Future<int> totalPenimbang() async {
    String? kodeSuperAdmin = await getDataLocal('kodeSuperAdmin');

    final datas = {
      'kode_super_admin': kodeSuperAdmin,
    };
    final response =
        await Dio().get('http://' + _baseUrl + '/laporan/penimbang/induk', data: datas);
    final responseData = response.data['payload'];
    return responseData;
  }

  Future<int> totalAdmin() async {
    String? kodeSuperAdmin = await getDataLocal('kodeSuperAdmin');

    final datas = {
      'kode_super_admin': kodeSuperAdmin,
    };
    final response =
        await Dio().get('http://' + _baseUrl + '/laporan/admin/induk', data: datas);
    final responseData = response.data['payload'];
    return responseData;
  }

  Future<int> totalPengguna() async {
    String? kodeSuperAdmin = await getDataLocal('kodeSuperAdmin');

    final datas = {
      'kode_super_admin': kodeSuperAdmin,
    };
    final response =
        await Dio().get('http://' + _baseUrl + '/laporan/pengguna/induk', data: datas);
    final responseData = response.data['payload'];
    return responseData;
  }

  Future<int> totalSampahNasabah() async {
    String? kodeSuperAdmin = await getDataLocal('kodeSuperAdmin');

    final datas = {
      'kode_super_admin': kodeSuperAdmin,
    };
    final response =
        await Dio().get('http://' + _baseUrl + '/laporan/sampahnasabah/induk', data: datas);
    final responseData = response.data['payload'];
    return responseData;
  }

  Future<int> totalSampahBS() async {
    String? kodeSuperAdmin = await getDataLocal('kodeSuperAdmin');

    final datas = {
      'kode_super_admin': kodeSuperAdmin,
    };
    final response =
        await Dio().get('http://' + _baseUrl + '/laporan/sampahadmin/induk', data: datas);
    final responseData = response.data['payload'];
    return responseData;
  }

  Future<int> totalSampahInduk() async {
    String? kodeSuperAdmin = await getDataLocal('kodeSuperAdmin');

    final datas = {
      'kode_super_admin': kodeSuperAdmin,
    };
    final response =
        await Dio().get('http://' + _baseUrl + '/laporan/sampah/induk', data: datas);
    final responseData = response.data['payload'];
    return responseData;
  }

 
}
