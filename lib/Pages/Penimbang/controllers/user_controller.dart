import 'package:banksampah_application/Pages/Penimbang/Models/PenimbangModel.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController {
  final _baseUrl = '154.56.60.253:4009';

  static getDataLocal(String data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? _data = await prefs.getString(data);

    return _data;
  }

  Future<Penimbang?> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? kode_reg = await getDataLocal('kodeReg');

    final datas = {
      'kode_user': kode_reg,
    };
    try {
      final response =
          await Dio().get('http://' + _baseUrl + '/penimbangbyid', data: datas);

      var data = response.data["payload"]["row"][0];
      var kode_penimbang = data["kode_penimbang"];
      var kode_admin = data["kode_admin"];
      await prefs.setString('kodePenimbang', kode_penimbang);
      await prefs.setString('kodeAdmin', kode_admin);

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = response.data["payload"];
        return Penimbang.fromJson(jsonData);
      } else {
        // Handle error here, e.g., throw an exception or return null
        return null;
      }
    } catch (e) {
      // Handle exceptions here
      return null;
    }
  }
}
