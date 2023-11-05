import 'package:banksampah_application/Pages/Nasabah/Models/NasabahModel.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserControllerNasabah {
  final _baseUrl = '154.56.60.253:4009';

  Future getKodeReg() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? kodeReg = await prefs.getString('kodeReg');

    return kodeReg;
  }

    static getDataLocal(String data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? _data = await prefs.getString(data);

    return _data;
  }

  Future<NasabahModel?> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? kode_reg = await getKodeReg();

    final datas = {
      'kode_user': kode_reg,
    };
    try {
      final response =
          await Dio().get('http://' + _baseUrl + '/nasabahByid', data: datas);
      var data = response.data["payload"]["row"][0];
      var kode_nasabah = data["kode_nasabah"];
      var kode_super = data["kode_super_admin"];
      var kode_admin = data["kode_admin"];
      var pin = data["pin"];
      
      await prefs.setString('kodeNasabah', kode_nasabah);
      await prefs.setString('kodeAdmin', kode_admin);
      await prefs.setString('kodeSuperAdmin', kode_super);
      await prefs.setString('pin', pin);
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = response.data["payload"];
        return NasabahModel.fromJson(jsonData);
      } else {
        // Handle error here, e.g., throw an exception or return null
        return null;
      }
    } catch (e) {
      // Handle exceptions here
      return null;
    }
  }

  Future<List<dynamic>> getUsers() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? kode_reg = await getKodeReg();

    final datas = {
      'kode_user': kode_reg,
    };
    try {
      final response =
          await Dio().get('http://' + _baseUrl + '/nasabahByid', data: datas);
      var data = response.data["payload"]["row"][0];
      var kode_nasabah = data["kode_nasabah"];
      var kode_super = data["kode_super_admin"];
      var kode_admin = data["kode_admin"];
      var pin = data["pin"];
      
      await prefs.setString('kodeNasabah', kode_nasabah);
      await prefs.setString('kodeAdmin', kode_admin);
      await prefs.setString('kodeSuperAdmin', kode_super);
      await prefs.setString('pin', pin);
      final responseData = response.data['payload']['row'];
      print('Ini Response Data : $responseData');
      return responseData;
    } catch (e) {
      // Handle exceptions here
      return [];
    }
  }

  Future penarikanSaldo(
      {required int jumlah_penarikan,
      required String kode_invoice,
      required String pin}) async {

    String? kodeAdmin = await getDataLocal('kodeAdmin');
    String? kodeNasabah = await getDataLocal('kodeNasabah');
    String? kodeSuperAdmin = await getDataLocal('kodeSuperAdmin');


    final datas = {
      "kode_invoice": kode_invoice,
    "jumlah_penarikan": jumlah_penarikan,
    "pin": pin,
    "kode_nasabah":kodeNasabah, 
    "kode_admin":kodeAdmin,
    "kode_super_admin": kodeSuperAdmin
    };

    try {
      await Dio().post('http://' + _baseUrl + '/service/saldo', data: datas);
    } catch (e) {
      // Handle exceptions here
      print(e);
      return null;
    }
  }

   Future<List<dynamic>> riwayatSetorSampah() async {
    String? kodeNasabah = await getDataLocal('kodeNasabah');

    final datas = {
      'kode_nasabah': kodeNasabah,
    };
      final response =
          await Dio().get('http://' + _baseUrl + '/setor/getsampah/nas', data: datas);
    
   final responseData = response.data['payload']['row'];

    return responseData;
  }

   Future<List<dynamic>> riwayatPenarikanSaldo() async {
    String? kodeNasabah = await getDataLocal('kodeNasabah');

    final datas = {
      'kode_nasabah': kodeNasabah,
    };
      final response =
          await Dio().get('http://' + _baseUrl + '/service/ceknasabah', data: datas);
    
   final responseData = response.data['payload']['rows'];

    return responseData;
  }

   Future biayaAdmin() async {
    String? kodeNasabah = await getDataLocal('kodeSuperAdmin');

    final datas = {
      "kode_super_induk": kodeNasabah,
    };
      final response =
          await Dio().get('http://' + _baseUrl + '/service/biayaadmin', data: datas);
    
   final responseData = response.data['payload']['rows'][0]["harga"];

   print(responseData);

    return responseData ;
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

    return responseData ;
  }
}
