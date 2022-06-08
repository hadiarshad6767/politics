import 'package:flutter/material.dart';
import 'package:qamar_zaman_kaira/pages/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Qamar Zaman Qaira',
      theme: ThemeData(
        // ignore: use_full_hex_values_for_flutter_colors
        primaryColor: const Color(0xFFFFbd4533),
      ),
      home: const SplashScreen(),
    );
  }
}
