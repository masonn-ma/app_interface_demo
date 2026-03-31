import 'package:flutter/material.dart';
import 'res/header.dart';
import 'res/insight_box.dart';
import 'res/card_grid.dart';
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
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
          child: SafeArea(child: Skeleton()),
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
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFF1E293B),
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                color: Color.fromARGB(255, 47, 60, 78),
                width: 1,
              ),
            ),
          ),
        ),
        // const Expanded(
        //   flex:
        //   Container(
        //     decoration: BoxDecoration(
        //     color: Color(0xFF1E293B),
        //     borderRadius: BorderRadius.circular(25),
        //     border: Border.all(
        //       color: Color.fromARGB(255, 47, 60, 78),
        //       width: 1,r
        //     ),
        //   ),
        //     child: Text(
        //       "Đồ thị phát triển sẽ được hiển thị ở đây",
        //       style: TextStyle(color: AppColors.textColor, fontSize: 16),
        //     ),
        //   ),
        // ),
      ],
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
