import 'package:flutter/material.dart';
import '../models/db_utils.dart';
import '../models/user.dart';

class EditUserScreen extends StatefulWidget {
  final User user;

  const EditUserScreen({super.key, required this.user});

  @override
  State<EditUserScreen> createState() => _EditUserScreenState();
}

class _EditUserScreenState extends State<EditUserScreen> {
  late TextEditingController nameController;
  late TextEditingController ageController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.user.name);
    ageController = TextEditingController(text: widget.user.age.toString());
  }

  Future<void> _updateUser() async {
    final age = int.tryParse(ageController.text);

    if (age == null || nameController.text.isEmpty) return;

    final updatedUser = User(
      id: widget.user.id,
      name: nameController.text,
      age: age,
    );

    await DbHelper.instance.updateUser(updatedUser);

    Navigator.pop(context, true); // ✅ refresh signal
  }

  Future<void> _deleteUser() async {
    await DbHelper.instance.deleteUser(widget.user.id);
    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit User"),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: _deleteUser,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text("ID: ${widget.user.id}"),
            const SizedBox(height: 20),

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

            ElevatedButton(onPressed: _updateUser, child: const Text("Save")),
          ],
        ),
      ),
    );
  }
}
