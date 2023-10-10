import 'package:banksampah_application/Pages/Login/login.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'Pages/Admin/Navigation_Bar.dart';
import 'Pages/Nasabah/Navigation_bar.dart';
import 'Pages/Nasabah/SuccesScreen.dart';
import 'Pages/Penimbang/Navigation_bar.dart';
import 'Pages/SuperAdmin/Navigation_Bar.dart';
import 'SplashScreen.dart';


void main() async{
  await initializeDateFormatting("ar_SA", null);
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      // home: BarNavigationPenimbang()
      home: SplashScreen()
    );
  }
}


