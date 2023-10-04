import 'dart:convert';
import 'package:banksampah_application/Pages/Admin/Models/nasabah_model.dart';
import 'package:banksampah_application/Pages/Admin/Models/penimbang_model.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';

import '../Models/detailsampahnasabah.dart';

class UserController {
  String Ip = '154.56.60.253:4009';

  Future<List<NasabahModel>> getNasabah() async {
    final url = Uri.http(Ip, '/nasabah');
    final response =
        await http.get(url, headers: {'Content-Type': 'application/json'});

    final Map<String, dynamic> responseData = jsonDecode(response.body);
    final List<dynamic> row = responseData['payload']['row'];
    final List<NasabahModel> nasabahList =
        row.map((e) => NasabahModel.fromJson(e)).toList();

    return nasabahList;
  }

  Future<List> getPenimbang() async {
    final url = Uri.http(Ip, '/penimbang');
    final response =
        await http.get(url, headers: {'Content-Type': 'application/json'});

    final Map<String, dynamic> responseData = jsonDecode(response.body);
    final List<dynamic> row = responseData['payload']['row'] as List<dynamic>;
    final List<PenimbangModel> penimbangList =
        row.map((e) => PenimbangModel.fromJson(e)).toList();

    return penimbangList;
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
    final url = Uri.http(Ip, '/auth/reg/nas');
    final data = {
      'nama_nasabah': nama_nasabah,
      ' alamat': alamat,
      'rw': rw,
      'rt': rt,
      'no_telp': no_telp,
      'alamat': alamat,
      'pin': pin,
      'password': password
    };
    final json = jsonEncode(data);
    final response = await http
        .post(url, body: json, headers: {'Content-Type': 'application/json'});

    var token = jsonDecode(response.body);

    return token;
  }
}
