import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:intl/date_symbol_data_local.dart';

import 'SplashScreen.dart';

void main() async {
  await initializeDateFormatting("ar_SA", null);
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
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
        home: SplashScreen());
  }
}
