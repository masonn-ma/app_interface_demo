import 'package:flutter/material.dart';
import '../models/user.dart';

class CardContents {
  final IconData icon;
  final String lable;
  final Color color;
  final User user;

  CardContents({
    required this.icon,
    required this.lable,
    required this.color,
    required this.user,
  });
}

User user = User(id: "0", name: "Default User", age: 0);

class DefaultContents {
  List<CardContents> defaultContents() {
    return [
      CardContents(
        icon: Icons.description_outlined,
        lable: "Xem Báo Cáo",
        color: Colors.blue,
        user: user,
      ),
      CardContents(
        icon: Icons.smart_toy_outlined,
        lable: "Trợ Lý AI",
        color: Colors.deepPurpleAccent,
        user: user,
      ),
      CardContents(
        icon: Icons.event_available,
        lable: "Đặt lịch Chuyên Gia",
        color: Colors.green,
        user: user,
      ),
      CardContents(
        icon: Icons.menu_book_outlined,
        lable: "Khoá Học",
        color: Colors.orange,
        user: user,
      ),
    ];
  }
}
