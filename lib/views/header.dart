import 'package:flutter/material.dart';
import '../controllers/utilities.dart';

const iconBgColor = Color(0xFF1E293B);

class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: false,

      titleSpacing: 0,

      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Row(children: const [UserIcon(), Spacer(), NotiIcon()]),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: const WelcomeMessage(text: "Chào buổi sáng, ???"),
            ),
          ],
        ),
      ),
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
      decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
      child: const Icon(Icons.person, color: Colors.black),
    );
  }
}

class NotiIcon extends StatelessWidget {
  const NotiIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: iconBgColor,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(),
        onPressed: () {},
        icon: const Icon(Icons.notifications_outlined, color: Colors.white),
      ),
    );
  }
}

class WelcomeMessage extends StatelessWidget {
  final String text;

  const WelcomeMessage({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.wb_sunny_outlined, color: Colors.yellow),
        SizedBox(width: 8.0),
        Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: responsiveFont(context, 16),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
