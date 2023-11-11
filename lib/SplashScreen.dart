import 'package:banksampah_application/Pages/Login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Pages/Admin/Beranda.dart';
import 'Pages/Nasabah/Home.dart';
import 'Pages/Penimbang/Beranda.dart';
import 'Pages/SuperAdmin/Beranda.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLoggedIn = false;

  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = await prefs.getString('token');
    return token;
  }

  Future<String?> getRole() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? role = await prefs.getString('role');
    return role;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    Future.delayed(Duration(seconds: 2), () async {
      String? token = await getToken();
      String? role = await getRole();

      if (token != null) {
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
          Navigator.pushReplacement(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => BerandaSuperAdmin(),
            ),
          );
        }
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (builde) {
              return LoginScreen();
            },
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: 428,
      height: 926,
      decoration: BoxDecoration(color: Color.fromARGB(255, 107, 219, 132)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset('assets/img/img1.png'),
          Column(
            children: [
              Container(
                width: 130,
                height: 130,
                decoration: ShapeDecoration(
                  color: Color.fromARGB(255, 73, 196, 100),
                  shape: OvalBorder(),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/img/sampah.png',
                      width: 80,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Text(
                  'RUMAH SAMPAH DIGITAL',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    height: 0.05,
                  ),
                ),
              )
            ],
          ),
          Image.asset('assets/img/img2.png'),
        ],
      ),
    ));
  }
}
