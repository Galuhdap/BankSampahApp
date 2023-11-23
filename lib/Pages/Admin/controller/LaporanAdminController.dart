import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LaporanAdminController {
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

  Future<int> getsaldoMasuk() async {
    String? kodeAdmin = await getDataLocal('kodeAdmin');

    final datas = {
      'kode_admin': kodeAdmin,
    };
    final response =
        await Dio().get('http://' + _baseUrl + '/laporan/saldomasuk/admin', data: datas);
    final responseData = response.data['payload'];
    return responseData;
  }

  Future<int> getsaldoKeluar() async {
    String? kodeAdmin = await getDataLocal('kodeAdmin');

    final datas = {
      'kode_admin': kodeAdmin,
    };
    final response =
        await Dio().get('http://' + _baseUrl + '/laporan/saldokeluar/admin', data: datas);
    final responseData = response.data['payload'];
    return responseData;
  }

  Future<int> getsampahMasuk() async {
    String? kodeAdmin = await getDataLocal('kodeAdmin');

    final datas = {
      'kode_admin': kodeAdmin,
    };
    final response =
        await Dio().get('http://' + _baseUrl + '/laporan/sampahmasuk/admin', data: datas);
    final responseData = response.data['payload'];
    print('Cek TOTAL $responseData');
    return responseData;
  }
  Future<double> totalSamapah() async {
    String? kodeAdmin = await getDataLocal('kodeAdmin');

    final datas = {
      'kode_admin': kodeAdmin,
    };
    final response =
        await Dio().get('http://' + _baseUrl + '/laporan/sampah/admin', data: datas);
    final responseData = response.data['payload'];
    return responseData;
  }

  Future<int> totalNasabah() async {
    String? kodeAdmin = await getDataLocal('kodeAdmin');

    final datas = {
      'kode_admin': kodeAdmin,
    };
    final response =
        await Dio().get('http://' + _baseUrl + '/laporan/nasabah/admin', data: datas);
    final responseData = response.data["payload"];

    return responseData;
  }

  Future<int> totalPenimbang() async {
    String? kodeAdmin = await getDataLocal('kodeAdmin');

    final datas = {
      'kode_admin': kodeAdmin,
    };
    final response =
        await Dio().get('http://' + _baseUrl + '/laporan/penimbang/admin', data: datas);
    final responseData = response.data['payload'];
    return responseData;
  }

  Future<int> totalPengguna() async {
    String? kodeAdmin = await getDataLocal('kodeAdmin');

    final datas = {
      'kode_admin': kodeAdmin,
    };
    final response =
        await Dio().get('http://' + _baseUrl + '/laporan/pengguna/admin', data: datas);
    final responseData = response.data['payload'];
    return responseData;
  }

  Future<int> totalSampahNasabah() async {
    String? kodeAdmin = await getDataLocal('kodeAdmin');

    final datas = {
      'kode_admin': kodeAdmin,
    };
    final response =
        await Dio().get('http://' + _baseUrl + '/laporan/sampahnasabah/admin', data: datas);
    final responseData = response.data['payload'];
    return responseData;
  }

  Future<num> totalSampahBS() async {
    String? kodeAdmin = await getDataLocal('kodeAdmin');

    final datas = {
      'kode_admin': kodeAdmin,
    };
    final response =
        await Dio().get('http://' + _baseUrl + '/laporan/sampah/admin', data: datas);
    final responseData = response.data['payload'];
    print(responseData);
    return responseData;
  }

  Future<List<dynamic>> getCatatPengeluaran() async {
     String? kodeAdmin = await getDataLocal('kodeAdmin');

    final datas = {
      'kode_admin': kodeAdmin,
    };
    final response = await Dio()
        .get('http://' + _baseUrl + '/kas/pengeluaran/admin', data: datas);
    final responseData = response.data['payload'];
    print(responseData);
    return responseData;
  }

 Future<List<dynamic>> getPenarikanNasabahAdmin() async {
    String? kodeAdmin = await getDataLocal('kodeAdmin');

    final datas = {
      'kode_admin': kodeAdmin,
    };
    final response = await Dio()
        .get('http://' + _baseUrl + '/laporan/perikansaldo/admin', data: datas);
    final responseData = response.data['payload']['rows'];
    return responseData;
  }

    Future<int> totalSaldo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? kode_reg = await getKodeReg();

    final datas = {
      'kode_user': kode_reg,
    };
    try {
      final response =
          await Dio().get('http://' + _baseUrl + '/adminbyid', data: datas);
      var data = response.data["payload"]["row"][0]['DetailSampahBs'][0]['saldo'];
      return data;
    } catch (e) {
      // Handle exceptions here
      return 0;
    }
  }

    Future<List<dynamic>> getPenarikanSaldoAdmin() async {
    String? kodeAdmin = await getDataLocal('kodeAdmin');

    final datas = {
      'kode_admin': kodeAdmin,
    };
    final response = await Dio()
        .get('http://' + _baseUrl + '/service/cek/admin', data: datas);
    final responseData = response.data['payload']['rows'];
    print('Dari RESPONSE DATES $responseData');
    return responseData;
  }
 
}
