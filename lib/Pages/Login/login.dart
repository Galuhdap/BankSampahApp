import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../Admin/Navigation_Bar.dart';
import '../Nasabah/Navigation_bar.dart';
import '../Penimbang/Navigation_bar.dart';
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

  String Ip = '10.0.2.2:4009';
   final box = GetStorage();

  Future login(String nip, String password) async {
    print("ini Dari Void Login: " + nip + " " + password);
    final url = Uri.http(Ip, '/auth/login');
    final data = {'kode_reg': nip, 'password': password};
    final json = jsonEncode(data);
    print('INI JSON: $json');
    final response = await http
        .post(url, body: json, headers: {'Content-Type': 'application/json'});

    var token = jsonDecode(response.body);
    print('ini TOken : $token');
    // var decodeToken = JwtDecoder.decode(token['payload'] ?? '');

    // // box.write('Token', token);
    // // box.write('kodeReg', decodeToken['kode_reg']);

    // var role = decodeToken['role'];
    // print(role);

    // if (role == "admin") {
    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(
    //       builder: (builde) {
    //         return BarNavigationAdmin();
    //       },
    //     ),
    //   ).then((value) {
    //     setState(() {});
    //   });
    // } else if (role == "nasabah") {
    //   Navigator.pushReplacement<void, void>(
    //     context,
    //     MaterialPageRoute<void>(
    //       builder: (BuildContext context) => BarNavigationNasabah(),
    //     ),
    //   );
    // } else if (role == "penimbang") {
    //   Navigator.pushReplacement<void, void>(
    //     context,
    //     MaterialPageRoute<void>(
    //       builder: (BuildContext context) => BarNavigationPenimbang(),
    //     ),
    //   );
    // } else if (role == "superadmin") {
    //   Navigator.pushReplacement<void, void>(
    //     context,
    //     MaterialPageRoute<void>(
    //       builder: (BuildContext context) => BarNavigationSuperAdmin(),
    //     ),
    //   );
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 249.36,
              width: 433.0,
              // Atur tinggi gambar
              child: Image.asset(
                "assets/img/h1.png",
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 22),

            const Text(
              "MASUK",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 30),
            Container(
              width: 319.0, // Atur lebar container
              height: 58.0,
              decoration: BoxDecoration(
                color: Color(0xFFF1F1F1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 12,
                ),
                child: TextFormField(
                  controller: cUser,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Username',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Username Masing Kosong';
                    }
                    return null;
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: 319.0, // Atur lebar container
              height: 58.0,
              decoration: BoxDecoration(
                color: Color(0xFFF1F1F1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 12,
                ),
                child: TextFormField(
                  obscureText: true,
                  controller: cPass,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Password',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Password Masing Kosong';
                    }
                    return null;
                  },
                ),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 319.0, // Atur lebar container
                  height: 58.0,
                  child: MaterialButton(
                    color: Color(0xFF4CAF50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    onPressed: () {
                      // auth.login(cUser.text, cPass.text);
                      // String tUser = cUser.text;
                      // String tPass = cPass.text;
                      if (formKey.currentState!.validate()) {
                        login(cUser.text, cPass.text);
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
            const SizedBox(height: 30),
            // Container(
            //   height: 124.5,
            //   width: 185.0,
            //   alignment: Alignment(5, -0.3),
            //   child: Image.asset(
            //     "assets/pana.png",
            //     fit: BoxFit.cover,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}