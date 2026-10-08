import 'package:flutter/material.dart';
import 'package:offline_app/data/database.dart';
import 'package:offline_app/home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF39745B),
          surface: const Color(0xFFF7F8F4),
        ),
        scaffoldBackgroundColor: const Color(0xFFF7F8F4),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Task list'),
          backgroundColor: const Color(0xFFF7F8F4),
          surfaceTintColor: Colors.transparent,
          elevation: 0,
        ),
        body: Home(database: AppDatabase()),
      ),
    );
  }
}
