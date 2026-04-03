import 'package:flutter/material.dart';
import 'card.dart';
import '../models/user.dart';

class BuildUserCards {
  final List<User> users;

  BuildUserCards(this.users);

  List<CardContents> buildCards() {
    return users
        .map(
          (user) => CardContents(
            icon: Icons.person,
            lable: user.name,
            color: Colors.blue,
            user: user,
          ),
        )
        .toList();
  }
}
