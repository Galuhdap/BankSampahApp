import 'package:banksampah_application/Pages/Login/login.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_local.dart';


import 'Pages/Admin/Navigation_Bar.dart';
import 'Pages/Nasabah/Navigation_bar.dart';
import 'Pages/Penimbang/Navigation_bar.dart';
import 'Pages/SuperAdmin/Navigation_Bar.dart';


void main() async{
  await initializeDateFormatting("ar_SA", null);
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: BarNavigationPenimbang()
      home: LoginScreen()
    );
  }
}


