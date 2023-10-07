import 'package:banksampah_application/Pages/Penimbang/Models/PenimbangModel.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController {
  final _baseUrl = '154.56.60.253:4009';

  
  Future getKodeReg() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? kodeReg = await prefs.getString('kodeReg');

    return kodeReg;
  }

  Future<Penimbang?> getUser() async {

    String? kode_reg = await getKodeReg();

    final datas = {
      'kode_user': kode_reg,
    };
     try {
    final response = await Dio().get('http://' + _baseUrl + '/penimbangbyid', data: datas);

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
