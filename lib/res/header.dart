import 'package:flutter/material.dart';

const iconBgColor = Color(0xFF1E293B);

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const UserIcon(),
        const WelcomeMessage(text: "Chào buổi sáng, ???"),
        const NotiIcon(),
      ]
    );
  }
}

class UserIcon extends StatelessWidget {
  const UserIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: const Icon(Icons.person, color: Colors.black),
    );
  }
}

class NotiIcon extends StatelessWidget {
  const NotiIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: iconBgColor,
        shape: BoxShape.circle,
      ),
      child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_outlined, color: Colors.white),
          ),
    );
  }
}

class WelcomeMessage extends StatelessWidget {
  final String text;

  const WelcomeMessage({
    super.key, 
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.wb_sunny_outlined, color: Colors.white),
        SizedBox(width: 8.0),
        Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}