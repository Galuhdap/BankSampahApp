import 'dart:convert';
import 'package:banksampah_application/Pages/Login/controller/loginController.dart';
import 'package:banksampah_application/Pages/Service/AuthService.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Admin/Beranda.dart';
import '../Admin/Navigation_Bar.dart';
import '../Nasabah/Home.dart';
import '../Nasabah/Navigation_bar.dart';
import '../Penimbang/Beranda.dart';
import '../Penimbang/Navigation_bar.dart';
import '../SuperAdmin/Beranda.dart';
import '../SuperAdmin/Navigation_Bar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  //String selectedRole = 'Admin';
  TextEditingController cUser = TextEditingController();
  TextEditingController cPass = TextEditingController();

  Future<String?> getRole() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? role = await prefs.getString('role');
    return role;
  }

  final _baseUrl = '154.56.60.253:4009';

  static final Dio _dio = Dio();
  Future login(String nip, String password) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        });
    final datas = {'kode_reg': nip, 'password': password};
    final response =
        await _dio.post('http://' + _baseUrl + '/auth/login', data: datas);

    var decodeToken = JwtDecoder.decode(response.data['payload']);

    var role = decodeToken['role'];
    var kodeReg = decodeToken['kodeReg'];

    await prefs.setString('token', response.data['payload']);
    await prefs.setString('role', role);
    await prefs.setString('kodeReg', kodeReg);

    if (role == "admin") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (builde) {
            return BerandaAdmin();
          },
        ),
      );
    } else if (role == "nasabah") {
      Navigator.pushReplacement<void, void>(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => HomeNasabahScreen(),
        ),
      );
    } else if (role == "penimbang") {
      Navigator.pushReplacement<void, void>(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => BerandaPenimbang(),
        ),
      );
    } else if (role == "superadmin") {
      Navigator.pushReplacement<void, void>(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => BerandaSuperAdmin(),
        ),
      );
    }
    // Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Image.asset("assets/img/img4.png"),
                Positioned(
                  left: size.width * 0.2,
                  top: size.height * 0.1,
                  child: Column(
                    children: [
                      Text(
                        'TURN YOUR TRASH\nINTO MONEY',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.05),
            const Text(
              "MASUK",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: size.height * 0.04),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                width: size.width * 0.88,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextFormField(
                  controller: cUser,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Kode User Tidak Boleh Kosong';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Kode User',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(3),
                      borderSide: BorderSide(
                        color: Color(0xFFDCEAE7),
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(3),
                      borderSide: BorderSide(
                        color: Color(0xFFDCEAE7),
                        width: 2.0,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    isDense: true,
                  ),
                  style: TextStyle(fontSize: 13.0, color: Colors.black),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.025),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                width: size.width * 0.88,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextFormField(
                  obscureText: true,
                  controller: cPass,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Password Tidak Boleh Kosong';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(3),
                      borderSide: BorderSide(
                        color: Color(0xFFDCEAE7),
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(3),
                      borderSide: BorderSide(
                        color: Color(0xFFDCEAE7),
                        width: 2.0,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    isDense: true,
                  ),
                  style: TextStyle(fontSize: 13.0, color: Colors.black),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: size.width * 0.88, // Atur lebar container
                  height: size.height * 0.07,
                  child: MaterialButton(
                    color: Color(0xFF4CAF50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        login(
                          cUser.text,
                          cPass.text,
                        );
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: const Text(
                        "LOGIN",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 180, top: 20),
              child: Image.asset(
                "assets/img/pana.png",
                width: 180,
              ),
            )
          ],
        ),
      ),
    );
  }
}
