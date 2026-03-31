import 'package:flutter/material.dart';
import 'res/header.dart';

void main() {
  runApp(const MainApp());
}

class AppColors {
  static const bgColor = Color(0xFF101C22);
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: AppColors.bgColor,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
          child: SafeArea(
            child: Skeleton(),
          ),
        ),
      ),
    );
  }
}

class Skeleton extends StatelessWidget {
  const Skeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Header(),
      ]
    );
  }
}
