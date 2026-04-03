import 'package:app_interface_demo/views/db_showcase.dart';
import 'package:flutter/material.dart';
import 'views/header.dart';
import 'views/insight_box.dart';
import 'views/card_grid.dart';
import 'views/progress_tracker.dart';
import 'controllers/utilities.dart';

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
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: AppColors.bgColor,
        appBar: Header(),
        // body: SafeArea(child: Skeleton()),
        body: SafeArea(child: DbShowcase()),
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
