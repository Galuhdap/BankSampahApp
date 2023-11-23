import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Admin/Beranda.dart';
import '../Nasabah/Home.dart';
import '../Penimbang/Beranda.dart';
import '../SuperAdmin/Beranda.dart';

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

  final _baseUrl = '82.180.130.233:4009';

  static final Dio _dio = Dio();
  bool isLoading = false;

  Future login(String nip, String password) async {
    setState(() {
      isLoading = true;
    });
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
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
    // showDialog(
    //     context: context,
    //     builder: (context) {
    //       return Center(
    //         child: CircularProgressIndicator(),
    //       );
    //     });

    setState(() {
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
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (builde) {
              return HomeNasabahScreen();
            },
          ),
        );
      } else if (role == "penimbang") {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (builde) {
              return BerandaPenimbang();
            },
          ),
        );
      } else if (role == "superadmin") {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (builde) {
              return BerandaSuperAdmin();
            },
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: formKey,
        child: Stack(
          children: [
            Column(
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
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            // showDialog(
                            //     context: context,
                            //     builder: (context) {
                            //       return Center(
                            //         child: CircularProgressIndicator(),
                            //       );
                            //     });
                            login(
                              cUser.text,
                              cPass.text,
                            );
                            // SharedPreferences prefs =
                            //     await SharedPreferences.getInstance();
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
                ),
              ],
            ),
            if (isLoading)
              Container(
                color: Colors.black
                    .withOpacity(0.3), // Warna latar belakang semi-transparan
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
