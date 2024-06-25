import 'package:flutter/material.dart';
import 'package:maha/data/models/user_model.dart';

class UserDetailPage extends StatelessWidget {
  final User user;

  const UserDetailPage({required this.user, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Detail'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(user.avatar),
              ),
              const SizedBox(height: 20),
              Text(
                '${user.firstName} ${user.lastName}',
                style: const TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 10),
              Text(user.email),
            ],
          ),
        ),
      ),
    );
  }
}
