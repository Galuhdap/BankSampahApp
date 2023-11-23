import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/SuperAdminModels.dart';

class UsersSuperAdminController {
  final _baseUrl = '82.180.130.233:4009';

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

  Future<List<dynamic>> getUser() async {
    String? kode_reg = await getKodeReg();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final datas = {
      'kode_user': kode_reg,
    };

    try {
      final response =
          await Dio().get('http://' + _baseUrl + '/suadminbyid', data: datas);
      var data = response.data["payload"]["row"][0];

      var kode_super_admin = data["kode_super_admin"];
      await prefs.setString('kodeSuperAdmin', kode_super_admin);
      final responseData = response.data['payload']['row'];
      return responseData;
    } catch (e) {
      // Handle exceptions here
      return [];
    }
  }

  Future<SuperAdmin?> getUserss() async {
    String? kode_reg = await getKodeReg();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final datas = {
      'kode_user': kode_reg,
    };

    try {
      final response =
          await Dio().get('http://' + _baseUrl + '/suadminbyid', data: datas);
      var data = response.data["payload"]["row"][0];

      var kode_super_admin = data["kode_super_admin"];

      // await prefs.setString('kodePenimbang', kode_penimbang);
      await prefs.setString('kodeSuperAdmin', kode_super_admin);
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = response.data["payload"];
        return SuperAdmin.fromJson(jsonData);
      } else {
        // Handle error here, e.g., throw an exception or return null
        return null;
      }
    } catch (e) {
      // Handle exceptions here
      return null;
    }
  }

  Future<int> totalSaldo() async {
    String? kode_reg = await getKodeReg();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final datas = {
      'kode_user': kode_reg,
    };

    try {
      final response =
          await Dio().get('http://' + _baseUrl + '/suadminbyid', data: datas);
      var data = response.data["payload"]["row"][0]['DetailSampahSuperAdmins']
          [0]['saldo'];
      print(data);
      return data;
    } catch (e) {
      // Handle exceptions here
      return 0;
    }
  }

  Future<int> totalSaldoPenjualan() async {
    String? kode_reg = await getKodeReg();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final datas = {
      'kode_user': kode_reg,
    };

    try {
      final response =
          await Dio().get('http://' + _baseUrl + '/suadminbyid', data: datas);
      var data = response.data["payload"]["row"][0]['DetailSampahSuperAdmins']
          [0]['saldo_penjualan'];
      print(data);
      return data;
    } catch (e) {
      // Handle exceptions here
      return 0;
    }
  }

  Future<List> getUsers() async {
    String? kode_reg = await getKodeReg();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final datas = {
      'kode_user': kode_reg,
    };

    try {
      final response =
          await Dio().get('http://' + _baseUrl + '/suadminbyid', data: datas);
      var data = response.data["payload"]["row"][0];

      var kode_super_admin = data["kode_super_admin"];

      // await prefs.setString('kodePenimbang', kode_penimbang);
      await prefs.setString('kodeSuperAdmin', kode_super_admin);
      return response.data["payload"]["row"];
    } catch (e) {
      // Handle exceptions here
      print(e);
      return [];
    }
  }

  Future registerAdmin({
    required final nama_admin,
    required final rw,
    required final rt,
    required final no_telp,
    required final password,
  }) async {
    try {
      String? kodeSuperAdmin = await getDataLocal('kodeSuperAdmin');
      final datas = {
        "nama_bs": nama_admin,
        "no_telp": no_telp,
        "password": password,
        "rw": rw,
        "rt": rt,
        "kode_super_admin": kodeSuperAdmin
      };
      await Dio().post('http://' + _baseUrl + '/auth/reg/adm', data: datas);
    } catch (e) {
      return e;
    }
  }

  Future updateAdmin({
    required final nama_admin,
    required final rw,
    required final rt,
    required final no_telp,
    required final kodeAdmin,
  }) async {
    try {
      final datas = {
        "nama_bs": nama_admin,
        "no_telp": no_telp,
        "rw": rw,
        "rt": rt,
        "kode_admin": kodeAdmin
      };
      await Dio().post('http://' + _baseUrl + '/auth/upd/adm', data: datas);
    } catch (e) {
      return e;
    }
  }

  Future updateNasabah({
    required final nama_nasabah,
    required final alamat,
    required final rw,
    required final rt,
    required final no_telp,
    required final pin,
    required final kode_nasabah,
  }) async {
    try {
      final datas = {
        "nama_nasabah": nama_nasabah,
        "alamat": alamat,
        "no_telp": no_telp,
        "rw": rw,
        "rt": rt,
        "pin": pin,
        "kode_nasabah": kode_nasabah
      };
      await Dio().post('http://' + _baseUrl + '/auth/upd/nas', data: datas);
    } catch (e) {
      return e;
    }
  }

  Future updatePenimbang({
    required final nama_penimbang,
    required final alamat,
    required final rw,
    required final rt,
    required final no_telp,
    required final kode_penimbang,
  }) async {
    try {
      final datas = {
        "nama_penimbang": nama_penimbang,
        "alamat": alamat,
        "no_telp": no_telp,
        "rw": rw,
        "rt": rt,
        "kode_penimbang": kode_penimbang
      };
      await Dio().post('http://' + _baseUrl + '/auth/upd/pen', data: datas);
    } catch (e) {
      return e;
    }
  }

  Future gantiPassword({
    required final password,
    required final kodeReg,
  }) async {
    try {
      final datas = {"password": password, "kode_reg": kodeReg};
      await Dio().post('http://' + _baseUrl + '/auth/updreg/adm', data: datas);
    } catch (e) {
      return e;
    }
  }

  Future gantiPasswordNasabah({
    required final password,
    required final kodeReg,
  }) async {
    try {
      final datas = {"password": password, "kode_reg": kodeReg};
      await Dio().post('http://' + _baseUrl + '/auth/updreg/nas', data: datas);
    } catch (e) {
      return e;
    }
  }

  Future gantiPasswordPengepul({
    required final password,
    required final kodeReg,
  }) async {
    try {
      final datas = {"password": password, "kode_reg": kodeReg};
      await Dio().post('http://' + _baseUrl + '/auth/updreg/pen', data: datas);
    } catch (e) {
      return e;
    }
  }

  Future deleteAdmin({
    required final kode_reg,
    required final kode_admin,
  }) async {
    try {
      final datas = {"kode_reg": kode_reg, "kode_admin": kode_admin};
      await Dio().post('http://' + _baseUrl + '/auth/del/adm', data: datas);
    } catch (e) {
      return e;
    }
  }

  Future deleteNasabah({
    required final kode_reg,
    required final kode_nasabah,
    required final kode_detail_sampah,
  }) async {
    try {
      final datas = {
        "kode_reg": kode_reg,
        "kode_nasabah": kode_nasabah,
        "kode_detail_sampah": kode_detail_sampah
      };
      await Dio().post('http://' + _baseUrl + '/auth/del/nas', data: datas);
    } catch (e) {
      return e;
    }
  }

  Future deletePenimbang({
    required final kode_reg,
    required final kode_penimbang,
  }) async {
    try {
      final datas = {"kode_reg": kode_reg, "kode_penimbang": kode_penimbang};
      await Dio().post('http://' + _baseUrl + '/auth/del/pen', data: datas);
    } catch (e) {
      return e;
    }
  }

  Future penarikanSaldoAdmin(
      {required int jumlah_penarikan,
      required String kode_admin,
      required String kode_invoice}) async {
    String? kodeSuperAdmin = await getDataLocal('kodeSuperAdmin');

    final datas = {
      "kode_invoice": kode_invoice,
      "jumlah_penarikan": jumlah_penarikan,
      "kode_admin": kode_admin,
      "kode_super_admin": kodeSuperAdmin
    };

    try {
      await Dio()
          .post('http://' + _baseUrl + '/service/saldo/admin', data: datas);
    } catch (e) {
      // Handle exceptions here
      print(e);
      return null;
    }
  }

  Future catatPengeluaran({
    required String nama_pengeluaran,
    required int harga,
    required String catatan,
  }) async {
    try {
          String? kodeSuperAdmin = await getDataLocal('kodeSuperAdmin');

    final datas = {
      "nama_pengeluaran": nama_pengeluaran,
      "harga": harga,
      "catatan": catatan,
      "kode_super_admin": kodeSuperAdmin
    };
      await Dio()
          .post('http://' + _baseUrl + '/kas/pengeluaran/induk', data: datas);
    } catch (e) {
      // Handle exceptions here
      print(e);
      return null;
    }
  }

  Future penarikanKeuntunganAdmin(
      {required int jumlah_penarikan,
      required String kode_admin,
      required String kode_invoice}) async {
    String? kodeSuperAdmin = await getDataLocal('kodeSuperAdmin');

    final datas = {
      "nomor_invoice": kode_invoice,
      "jumlah_penarikan": jumlah_penarikan,
      "kode_admin": kode_admin,
      "kode_super_admin": kodeSuperAdmin
    };

    try {
      await Dio()
          .post('http://' + _baseUrl + '/service/keuntungan', data: datas);
    } catch (e) {
      // Handle exceptions here
      print(e);
      return null;
    }
  }

  Future validasiAdmin({required String kodeAdmin}) async {
    try {
      final datas = {
        "kode_admin": kodeAdmin,
      };
      final response =
          await Dio().get('http://' + _baseUrl + '/cek/adminbyid', data: datas);
      return response.data;
    } catch (e) {
      print(e);
    }
  }

  Future validasiRw({required String rw}) async {
    String? kodeSuperAdmin = await getDataLocal('kodeSuperAdmin');

    try {
      final datas = {"kode_super_admin": kodeSuperAdmin, "rw": rw};
      final response = await Dio()
          .get('http://' + _baseUrl + '/cek/rw/adminbyid', data: datas);
      return response.data;
    } catch (e) {
      print(e);
    }
  }
}
