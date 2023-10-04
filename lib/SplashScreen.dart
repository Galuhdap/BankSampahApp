import 'package:banksampah_application/Pages/Login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Pages/Admin/Navigation_Bar.dart';
import 'Pages/Nasabah/Navigation_bar.dart';
import 'Pages/Penimbang/Navigation_bar.dart';
import 'Pages/SuperAdmin/Navigation_Bar.dart';

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    Future.delayed(Duration(seconds: 2), () async {
      String? token = await getToken();

      if (token != null) {
        var decodeToken = JwtDecoder.decode(token.toString());

        var role = decodeToken['role'];
        if (role == "admin") {
          print('Navigasi ke halaman admin');
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (builde) {
                return BarNavigationAdmin();
              },
            ),
          );
        } else if (role == "nasabah") {
          Navigator.pushReplacement<void, void>(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => BarNavigationNasabah(),
            ),
          );
        } else if (role == "penimbang") {
          Navigator.pushReplacement<void, void>(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => BarNavigationPenimbang(),
            ),
          );
        } else if (role == "superadmin") {
          Navigator.pushReplacement<void, void>(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => BarNavigationSuperAdmin(),
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
      body: Center(
        child: Text("INI SPLASH SCREEN"),
      ),
    );
  }
}
