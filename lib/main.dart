import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const SevenKDailyApp());
}

class SevenKDailyApp extends StatelessWidget {
  const SevenKDailyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '7K Daily - Journal & Tracker',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
