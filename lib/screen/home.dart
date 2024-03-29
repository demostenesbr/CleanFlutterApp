// ignore_for_file: avoid_print
import 'package:cleanflutterapp/services/user_api.dart';
import 'package:flutter/material.dart';
import 'package:cleanflutterapp/model/user.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rest API Call'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (content, index) {
          final user = users[index];
          final color = user.gender == 'male' ? Colors.white : Colors.white;
          return ListTile(
            title: Text(user.fullName),
            subtitle: Text(user.location.postcode),
            tileColor: color,
          );
        },
      ),
    );
  }

  Future<void> fetchUsers() async {
    final response = await UserApi.fetchUsers();
    setState(() {
      users = response;
    });
  }
}
