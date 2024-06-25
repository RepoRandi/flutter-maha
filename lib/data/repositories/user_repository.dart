import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:maha/data/models/user_model.dart';

class UserRepository {
  final String baseUrl = 'https://reqres.in/api';

  Future<List<User>> getUsers() async {
    final response = await http.get(Uri.parse('$baseUrl/users?page=2'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<User> users = (data['data'] as List)
          .map((userJson) => User.fromJson(userJson))
          .toList();
      return users;
    } else {
      throw Exception('Failed to load users');
    }
  }

  Future<Map<String, dynamic>> createUser(String name, String job) async {
    final response = await http.post(
      Uri.parse('$baseUrl/users'),
      body: json.encode({'name': name, 'job': job}),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 201) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to create user');
    }
  }
}
