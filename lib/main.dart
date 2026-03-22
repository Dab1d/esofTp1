import 'package:flutter/material.dart';

import 'package:david_name_app/screens/login_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'David App',
      home: LoginScreen(),
    );
  }
}