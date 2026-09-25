import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthService {
  static const String _url = 'https://dummyjson.com/auth/login';

  Future<bool> login(String username, String password) async {
    final response = await http.post(
      Uri.parse(_url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'username': username,
        'password': password,
      }),
    );

    return response.statusCode == 200;
  }
}
