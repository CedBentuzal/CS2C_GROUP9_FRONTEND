import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginService {
  static Future<String?> loginUser({
    required String email,
    required String password,
  }) async {
    final Uri url = Uri.parse('http://localhost:3000/api/login');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        String token = data['token'];

        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('authToken', token);

        print('JWT Token saved: $token');

        return null;
      } else {
        final data = jsonDecode(response.body);
        return data['message'] ?? 'Login failed';
      }
    } catch (e) {
      print('Login error: $e');
      return 'An error occurred. Please try again.';
    }
  }
}
