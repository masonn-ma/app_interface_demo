import 'package:flutter/material.dart';
import '../models/db_utils.dart';
import '../models/user.dart';
import '../controllers/db_showcase.dart';
import 'load_json.dart';
import 'card_grid.dart';
import 'create_user_screen.dart';
import 'edit_user_screen.dart';

class DbShowcase extends StatefulWidget {
  const DbShowcase({super.key});

  @override
  State<DbShowcase> createState() => _DbShowcaseState();
}

class _DbShowcaseState extends State<DbShowcase> {
  String _searchQuery = "";
  late Future<List<User>> _usersFuture;

  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  Future<void> _initializeData() async {
    final existing = await DbHelper.instance.getUsers();

    if (existing.isEmpty) {
      final jsonList = await loadJson();
      await DbHelper.instance.insertUsersFromJson(jsonList);
    }

    setState(() {
      _usersFuture = DbHelper.instance.getUsers();
    });
  }

  Future<void> _refreshUsers() async {
    setState(() {
      _usersFuture = DbHelper.instance.getUsers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const CreateUserScreen()),
          );

          if (result == true) {
            await _refreshUsers();
          }
        },
        child: const Icon(Icons.add),
      ),
      body: FutureBuilder<List<User>>(
        future: _usersFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final users = snapshot.data ?? [];
          final filteredUsers = DbHelper.instance.filterUsers(
            users,
            _searchQuery,
          );

          return Column(
            children: [
              TextField(
                decoration: const InputDecoration(
                  hintText: "Search (e.g. name:john, age:20, hello)",
                  prefixIcon: Icon(Icons.search),
                ),
                onChanged: (value) {
                  setState(() {
                    _searchQuery = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 16.0,
                  ),
                  child: CardGrid(
                    contents: BuildUserCards(filteredUsers).buildCards(),
                    onCardTap: (card) async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => EditUserScreen(user: card.user),
                        ),
                      );

                      if (result == true) {
                        await _refreshUsers();
                      }
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
