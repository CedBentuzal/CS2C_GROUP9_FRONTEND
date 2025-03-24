import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginService {
  static Future<String?> loginUser({
    required String email,
    required String password,
  }) async {
    final Uri url = Uri.parse('http://192.168.1.115:3000/api/login');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200 && data.containsKey('token')) {
        String token = data['token'];
        String username = data['username']; // Fetch username from response

        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('authToken', token);
        await prefs.setString('username', username); // ✅ Store username

        print('JWT Token saved: $token');
        print('Username saved: $username');

        return "success";
      } else if (response.statusCode == 401) {
        return "Invalid email or password. Please try again.";
      } else if (response.statusCode == 403) {
        return "Please verify your email before logging in.";
      } else {
        return data['message'] ?? 'Login failed.';
      }
    } catch (e) {
      print('Login error: $e');
      return 'An error occurred. Please try again.';
    }
  }
}
