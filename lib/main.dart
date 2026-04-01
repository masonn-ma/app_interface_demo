import 'package:flutter/material.dart';
import 'res/header.dart';
import 'res/insight_box.dart';
import 'res/card_grid.dart';
import 'res/progress_tracker.dart';
import 'res/utilities.dart';

void main() {
  runApp(const MainApp());
}

class AppColors {
  static const bgColor = Color(0xFF101C22);
  static const textColor = Color(0xFFFFFFFF);
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: AppColors.bgColor,
        body: SafeArea(child: Skeleton()),
      ),
    );
  }
}

class Skeleton extends StatelessWidget {
  const Skeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
      child: Column(
        children: [
          const Header(),
          const SizedBox(height: 20),
          const InsightBox(),
          const SizedBox(height: 30),
          const BasicTextBox(
            text: "Tiện ích",
            color: AppColors.textColor,
            fontSize: 18,
          ),
          const SizedBox(height: 10),
          CardGrid(),
          const SizedBox(height: 30),
          const BasicTextBox(
            text: "Hành trình phát triển",
            color: AppColors.textColor,
            fontSize: 18,
          ),
          const SizedBox(height: 10),
          const ProgressTracker(),
        ],
      ),
    );
  }
}

class BasicTextBox extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;

  const BasicTextBox({
    super.key,
    required this.text,
    required this.color,
    this.fontSize = 24,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: responsiveFont(context, fontSize),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
