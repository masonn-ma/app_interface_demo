import 'package:flutter/material.dart';
import '../models/db_utils.dart';
import '../models/user.dart';

class CreateUserScreen extends StatefulWidget {
  const CreateUserScreen({super.key});

  @override
  State<CreateUserScreen> createState() => _CreateUserScreenState();
}

class _CreateUserScreenState extends State<CreateUserScreen> {
  final nameController = TextEditingController();
  final ageController = TextEditingController();

  Future<void> _createUser() async {
    final age = int.tryParse(ageController.text);

    if (age == null || nameController.text.isEmpty) return;

    final newUser = User(
      id: DateTime.now().toString(),
      name: nameController.text,
      age: age,
    );

    await DbHelper.instance.insertUser(newUser);

    Navigator.pop(context, true); // ✅ return signal to refresh
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create User"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: "Name"),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Age"),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _createUser,
              child: const Text("Create"),
            ),
          ],
        ),
      ),
    );
  }
}