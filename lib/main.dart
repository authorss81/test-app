import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'data/tests.dart';

void main() {
  runApp(const TestApp());
}

class TestApp extends StatelessWidget {
  const TestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1FA9E8)),
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
      ),
      home: HomeScreen(tests: getTests()),
    );
  }
}