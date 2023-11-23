import 'package:dio/dio.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController {
  final _baseUrl = '82.180.130.233:4009';

  Future validasiUser({required String kode_reg}) async {
    try {
      final datas = {
        "kode_reg": kode_reg,
      };
      final response =
          await Dio().get('http://' + _baseUrl + '/auth/reg/cek', data: datas);
      return response.data;
    } catch (e) {
      print(e);
    }
  }
  Future validasiPassword({required String kode_reg, required String password}) async {
    try {
      final datas = {
        "kode_reg": kode_reg,
        "password": password
      };
      final response =
          await Dio().get('http://' + _baseUrl + '/auth/reg/cek/pass', data: datas);
      return response.data;
    } catch (e) {
      print(e);
    }
  }
}
