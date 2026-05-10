import 'package:flutter/material.dart';
import 'theme.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const TeraApp());
}

class TeraApp extends StatelessWidget {
  const TeraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TERA',
      debugShowCheckedModeBanner: false,
      theme: TeraTheme.themeData,
      home: const LoginScreen(),
    );
  }
}
