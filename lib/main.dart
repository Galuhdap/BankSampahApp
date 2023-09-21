import 'package:banksampah_application/Pages/navigation_bar.dart';
import 'package:flutter/material.dart';

import 'Pages/Penimbang/Beranda.dart';
import 'Pages/Penimbang/Edit_Profile.dart';
import 'Pages/Penimbang/Navigation_bar.dart';
import 'Pages/Penimbang/Setor_Sampah.dart';
import 'Pages/Penimbang/Setting_Profile.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: BarNavigationPenimbang()
      home: SetorSampah(),
    );
  }
}


