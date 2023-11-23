import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/JenisSampahModel.dart';

class SampahSuperAdminController {
  final _baseUrl = '82.180.130.233:4009';
  final Ip = '82.180.130.233:4009';

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
        "kode_super_induk": kodeSuperAdmin,
      };
      await Dio().post('http://' + _baseUrl + '/product/jenis', data: datas);
    } catch (e) {
      print(e);
      return e;
    }
  }

  Future updateSampahBarang({
    required final kode_barang,
    required final jenis_barang,
    required final hargaNasabah,
    required final hargaAdmin,
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
    final response = await Dio()
        .get('http://' + _baseUrl + '/product/sampah/admin', data: datas);
    final responseData = response.data['payload'];
    // print(responseData);
    return responseData;
  }

  Future<List<dynamic>> biayaAdmin() async {
    String? kodeSuperAdmin = await getDataLocal('kodeSuperAdmin');
    final datas = {"kode_super_induk": kodeSuperAdmin};
    final response = await Dio()
        .get('http://' + _baseUrl + '/service/biayaadmin', data: datas);
    final responseData = response.data['payload']['rows'];
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
      required double berat,
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
      required num berat,
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

  Future<List<dynamic>> getKeuntunganAdmin() async {
    String? kodeSuperAdmin = await getDataLocal('kodeSuperAdmin');

    final datas = {
      'kode_super_admin': kodeSuperAdmin,
    };
    final response = await Dio()
        .get('http://' + _baseUrl + '/service/keuntungan/induk', data: datas);
    final responseData = response.data['payload']['rows'];
    print(responseData);
    return responseData;
  }

  Future<List<dynamic>> getCatatPengeluaran() async {
    String? kodeSuperAdmin = await getDataLocal('kodeSuperAdmin');

    final datas = {
      'kode_super_admin': kodeSuperAdmin,
    };
    final response = await Dio()
        .get('http://' + _baseUrl + '/kas/pengeluaran/induk', data: datas);
    final responseData = response.data['payload'];
    print(responseData);
    return responseData;
  }

  Future<List<dynamic>> getPenarikanNasabah() async {
    String? kodeSuperAdmin = await getDataLocal('kodeSuperAdmin');

    final datas = {
      'kode_super_admin': kodeSuperAdmin,
    };
    final response = await Dio()
        .get('http://' + _baseUrl + '/laporan/perikansaldo/induk', data: datas);
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

  Future<List<dynamic>> totalSampah() async {
    String? kodeSuperAdmin = await getDataLocal('kodeSuperAdmin');

    final datas = {
      'kode_super_admin': kodeSuperAdmin,
    };
    final response = await Dio()
        .get('http://' + _baseUrl + '/laporan/totalsampah', data: datas);
    final responseData = response.data['payload'];
    return responseData;
  }

  Future deleteSampah({
    required final kode_barang,
  }) async {
    try {
      String? kodeSuperAdmin = await getDataLocal('kodeSuperAdmin');
      final datas = {
        "kode_barang": kode_barang,
        "kode_super_induk": kodeSuperAdmin
      };
      await Dio().delete('http://' + _baseUrl + '/product/hapus', data: datas);
    } catch (e) {
      return e;
    }
  }

  Future deleteKeuntunganSuperAdmin({
    required final kode_pengeluaran,
    required final harga,

  }) async {
    try {
      String? kodeSuperAdmin = await getDataLocal('kodeSuperAdmin');
      final datas = {
         "kode_pengeluaran":kode_pengeluaran,
         "harga": harga,
        "kode_super_admin": kodeSuperAdmin
      };
      await Dio().delete('http://' + _baseUrl + '/kas/pengeluaran/induk', data: datas);
    } catch (e) {
      return e;
    }
  }

  Future deletePenjualanSuperAdmin({
    required final kode_penjualan_induk,

  }) async {
    try {
      String? kodeSuperAdmin = await getDataLocal('kodeSuperAdmin');
      final datas = {
         "kode_penjualan_induk": kode_penjualan_induk, 
        "kode_super_admin": kodeSuperAdmin
      };
      await Dio().delete('http://' + _baseUrl + '/transaksi/sampah/induk', data: datas);
    } catch (e) {
      return e;
    }
  }

  Future deleteSusutSuperAdmin({
    required final kode_susut_induk,
    required final berat,
    required final harga,
    required final kode_barang

  }) async {
    try {
      String? kodeSuperAdmin = await getDataLocal('kodeSuperAdmin');
      final datas = {
        "kode_susut_induk": kode_susut_induk,
        "berat": berat,
        "harga": harga,
        "kode_barang": kode_barang,
        "kode_super_admin": kodeSuperAdmin
      };
      await Dio().delete('http://' + _baseUrl + '/transaksi/sampah/susut', data: datas);
    } catch (e) {
      return e;
    }
  }

  Future deleteKeuntunganAdmin({
    required final kode_tariksaldo,
    required final jumlah_penarikan,
    required final kode_admin,

  }) async {
    try {
      String? kodeSuperAdmin = await getDataLocal('kodeSuperAdmin');
      final datas = {
        "kode_tariksaldo": kode_tariksaldo, 
        "jumlah_penarikan":jumlah_penarikan, 
        "kode_admin": kode_admin,
        "kode_super_admin": kodeSuperAdmin
      };
      await Dio().delete('http://' + _baseUrl + '/service/keuntungan', data: datas);
    } catch (e) {
      return e;
    }
  }

  Future deletePenjualanAdmin({
    required final kode_susut_sampah_bs,
    required final kode_barang,
    required final berat,
    required final kode_admin,

  }) async {
    try {
      String? kodeSuperAdmin = await getDataLocal('kodeSuperAdmin');
      final datas = {
        "kode_susut_sampah_bs":kode_susut_sampah_bs,
        "kode_barang": kode_barang,
        "berat":berat,
        "kode_admin":kode_admin,
        "kode_super_admin": kodeSuperAdmin
      };
      await Dio().delete('http://' + _baseUrl + '/setor/sampah/susut', data: datas);
    } catch (e) {
      return e;
    }
  }
  
  Future deleteTarikSaldoAdmin({
    required final kode_tariksaldo,
    required final jumlah_penarikan,
    required final kode_admin,

  }) async {
    try {
      String? kodeSuperAdmin = await getDataLocal('kodeSuperAdmin');
      final datas = {
        "kode_tariksaldo": kode_tariksaldo, 
        "jumlah_penarikan": jumlah_penarikan, 
        "kode_admin":kode_admin,
        "kode_super_admin": kodeSuperAdmin
      };
      await Dio().delete('http://' + _baseUrl + '/service/saldo/admin', data: datas);
    } catch (e) {
      return e;
    }
  }
}
