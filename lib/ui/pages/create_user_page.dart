import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maha/bloc/user/user_bloc.dart';
import 'package:maha/bloc/user/user_event.dart';
import 'package:maha/bloc/user/user_state.dart';

class CreateUserPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController jobController = TextEditingController();

  CreateUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create User'),
      ),
      body: BlocListener<UserBloc, UserState>(
        listener: (context, state) {
          if (state is UserCreated) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('User Created'),
                  content: Text(
                    'Name: ${state.response['name']}\n'
                    'Job: ${state.response['job']}\n'
                    'ID: ${state.response['id']}\n'
                    'Created At: ${state.response['createdAt']}',
                  ),
                  actions: <Widget>[
                    TextButton(
                      child: const Text('OK'),
                      onPressed: () {
                        Navigator.of(context)
                          ..pop()
                          ..pop();
                      },
                    ),
                  ],
                );
              },
            );
          } else if (state is UserError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(labelText: 'Name'),
                  ),
                  const SizedBox(height: 12.0),
                  TextField(
                    controller: jobController,
                    decoration: const InputDecoration(labelText: 'Job'),
                  ),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      context.read<UserBloc>().add(CreateUser(
                            name: nameController.text,
                            job: jobController.text,
                          ));
                    },
                    child: (state is UsersLoading)
                        ? const Center(child: CircularProgressIndicator())
                        : const Text('Create'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
