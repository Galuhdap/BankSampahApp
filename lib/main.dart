import 'package:banksampah_application/Pages/Nasabah/Home.dart';
import 'package:flutter/material.dart';

import 'Components/PointCard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home()
    );
  }
}


