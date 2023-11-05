import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/JenisSampahModel.dart';

class SampahSuperAdminController {
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

  Future<List<dynamic>> getNasabah() async {
    String? kodeSuperAdmin = await getDataLocal('kodeSuperAdmin');

    final datas = {
      'kode_super_admin': kodeSuperAdmin,
    };
    final response =
        await Dio().get('http://' + _baseUrl + '/allnasabah', data: datas);
    final responseData = response.data['payload']['row'];
    return responseData;
  }

  Future<List<dynamic>> getPenimbang() async {
    String? kodeSuperAdmin = await getDataLocal('kodeSuperAdmin');

    final datas = {
      'kode_super_admin': kodeSuperAdmin,
    };
    final response =
        await Dio().get('http://' + _baseUrl + '/allpenimbang', data: datas);
    final responseData = response.data['payload']['row'];
    return responseData;
  }

  Future<List<dynamic>> getAdmin() async {
    String? kodeSuperAdmin = await getDataLocal('kodeSuperAdmin');

    final datas = {
      'kode_super_admin': kodeSuperAdmin,
    };
    final response =
        await Dio().get('http://' + _baseUrl + '/adminid', data: datas);
    final responseData = response.data['payload']['row'];
    return responseData;
  }

  Future tambahSampahKering({
    required final jenis_sampah,
  }) async {
    String? kodeSuperAdmin = await getDataLocal('kodeSuperAdmin');
    try {
      final datas = {
        "jenis_sampah": jenis_sampah,
        "kode_super_induk": kodeSuperAdmin
      };
      await Dio().post('http://' + _baseUrl + '/product/sampah', data: datas);
    } catch (e) {
      return e;
    }
  }

  Future editBiayaAdmin(
      {required final harga, required final kode_biayaAdmin}) async {
    try {
      final datas = {"harga": harga, "kode_biayaAdmin": kode_biayaAdmin};
      await Dio()
          .post('http://' + _baseUrl + '/service/up/biayaadmin', data: datas);
    } catch (e) {
      return e;
    }
  }

  Future tambahSampahBarang({
    required final jenis_barang,
    required final hargaNasabah,
    required final hargaAdmin,
    required final kode_sampah,
  }) async {
    String? kodeSuperAdmin = await getDataLocal('kodeSuperAdmin');
    try {
      final datas = {
        "jenis_barang": jenis_barang,
        "harga_pertama": hargaNasabah,
        "harga_kedua": hargaAdmin,
        "kode_sampah": kode_sampah,
        "kodeSuperAdmin": kodeSuperAdmin,
      };
      await Dio().post('http://' + _baseUrl + '/product/jenis', data: datas);
    } catch (e) {
      print(e);
      return e;
    }
  }

  Future updateSampahBarang({
    required final jenis_barang,
    required final hargaNasabah,
    required final hargaAdmin,
    required final kode_barang,
  }) async {
    try {
      final datas = {
        "jenis_barang": jenis_barang,
        "harga_pertama": hargaNasabah,
        "harga_kedua": hargaAdmin,
        "kode_barang": kode_barang
      };
      await Dio().post('http://' + _baseUrl + '/product/edit', data: datas);
    } catch (e) {
      print(e);
      return e;
    }
  }

  Future<List<dynamic>> listSampah() async {
    String? kodeSuperAdmin = await getDataLocal('kodeSuperAdmin');
    final datas = {"kode_super_induk": kodeSuperAdmin};
    final response =
        await Dio().get('http://' + _baseUrl + '/product/sampah', data: datas);
    final responseData = response.data['payload'];
    return responseData;
  }

  Future<List<dynamic>> biayaAdmin() async {
    String? kodeSuperAdmin = await getDataLocal('kodeSuperAdmin');
    final datas = {"kode_super_induk": kodeSuperAdmin};
    final response = await Dio()
        .get('http://' + _baseUrl + '/service/biayaadmin', data: datas);
    final responseData = response.data['payload']['rows'];
    print(responseData);
    return responseData;
  }

  Future setorSampahAdmin(
      {required String kodeSampah,
      required String kodeBarang,
      required double berat,
      required String catatan,
      required String kodeBS}) async {
    try {
      String? kodeSuperAdmin = await getDataLocal('kodeSuperAdmin');
      print(kodeSuperAdmin);
      final datas = {
        "kode_sampah": kodeSampah,
        "kode_barang": kodeBarang,
        "berat": berat,
        "catatan": catatan,
        "kode_admin": kodeBS,
        "kode_super_admin": kodeSuperAdmin,
      };
      await Dio()
          .post('http://' + _baseUrl + '/setor/sampah/susut', data: datas);
    } catch (e) {
      print(e);
    }
  }

  Future setorSampahSuperAdmin(
      {required String kodeSampah,
      required String kodeBarang,
      required int berat,
      required int harga,
      required String catatan,
      required String nama_pembeli}) async {
    try {
      String? kodeSuperAdmin = await getDataLocal('kodeSuperAdmin');

      final datas = {
        "kode_sampah": kodeSampah,
        "kode_barang": kodeBarang,
        "berat": berat,
        "harga": harga,
        "catatan": catatan,
        "nama_pembeli": nama_pembeli,
        "kode_super_admin": kodeSuperAdmin,
      };
      final _datas = await Dio()
          .post('http://' + _baseUrl + '/transaksi/sampah/induk', data: datas);

      print(_datas.data);
    } catch (e) {
      print(e);
    }
  }

  Future susutSampahSuperAdmin(
      {required String kodeSampah,
      required String kodeBarang,
      required int berat,
      required int harga,
      required String catatan,
      required String nama_pembeli}) async {
    try {
      String? kodeSuperAdmin = await getDataLocal('kodeSuperAdmin');

      final datas = {
        "kode_sampah": kodeSampah,
        "kode_barang": kodeBarang,
        "berat": berat,
        "harga": harga,
        "catatan": catatan,
        "nama_pembeli": nama_pembeli,
        "kode_super_admin": kodeSuperAdmin,
      };

      await Dio().post('http://' + _baseUrl + '/transaksi/sampah/susut/induk',
          data: datas);
    } catch (e) {
      print(e);
    }
  }

  Future<List<dynamic>> getPenjalanBs() async {
    String? kodeSuperAdmin = await getDataLocal('kodeSuperAdmin');

    final datas = {
      'kode_super_admin': kodeSuperAdmin,
    };
    final response = await Dio()
        .get('http://' + _baseUrl + '/setor/getsampah/induk', data: datas);
    final responseData = response.data['payload']['rows'];
    return responseData;
  }

  Future<List<dynamic>> getPenjalanAdmin() async {
    String? kodeSuperAdmin = await getDataLocal('kodeSuperAdmin');

    final datas = {
      'kode_super_admin': kodeSuperAdmin,
    };
    final response = await Dio()
        .get('http://' + _baseUrl + '/transaksi/sampah/induk', data: datas);
    final responseData = response.data['payload']['rows'];
    return responseData;
  }

  Future<List<dynamic>> getSusutSampahAdmin() async {
    String? kodeSuperAdmin = await getDataLocal('kodeSuperAdmin');

    final datas = {
      'kode_super_admin': kodeSuperAdmin,
    };
    final response = await Dio()
        .get('http://' + _baseUrl + '/transaksi/sampah/susut', data: datas);
    final responseData = response.data['payload']['rows'];
    return responseData;
  }

  Future<List<dynamic>> getPenarikanAdmin() async {
    String? kodeSuperAdmin = await getDataLocal('kodeSuperAdmin');

    final datas = {
      'kode_super_admin': kodeSuperAdmin,
    };
    final response = await Dio()
        .get('http://' + _baseUrl + '/service/cek/induk', data: datas);
    final responseData = response.data['payload']['rows'];
    return responseData;
  }

  Future<List<dynamic>> getPenarikanNasabah() async {
    String? kodeSuperAdmin = await getDataLocal('kodeSuperAdmin');

    final datas = {
      'kode_super_admin': kodeSuperAdmin,
    };
    final response = await Dio()
        .get('http://' + _baseUrl + '/service/cekinduk', data: datas);
    final responseData = response.data['payload']['rows'];
    return responseData;
  }

  Future<List<dynamic>> setorSampahNasabahCek() async {
    String? kodeSuperAdmin = await getDataLocal('kodeSuperAdmin');

    final datas = {
      'kode_super_admin': kodeSuperAdmin,
    };
    final response = await Dio()
        .get('http://' + _baseUrl + '/setor/sampah/nasabah', data: datas);
    final responseData = response.data['payload']['rows'];
    return responseData;
  }
}
