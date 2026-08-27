import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project/models/user.dart';

class UserService {
  static const baseUrl = 'https://jsonplaceholder.typicode.com';

  Future<List<User>> findAll() async {
    final response = await http.get(
      Uri.parse('$baseUrl/users'),
    );

    if (response.statusCode != 200) {
      throw Exception(
        'Erro ao buscar usuários: ${response.statusCode}',
      );
    }

    final List<dynamic> jsonList = jsonDecode(response.body);

    return jsonList
        .map((json) => User.fromJson(json as Map<String, dynamic>))
        .toList();
  }
  Future<User> findById(int id) async {
    final response = await http.get(
      Uri.parse("$baseUrl/users/$id"),
    );
    if (response.statusCode != 200) {
      throw Exception(
        'Erro ao buscar usuário: ${response.statusCode}',
      );
    }
    final Map<String, dynamic> json = jsonDecode(response.body);
    return User.fromJson(json);
  }
}