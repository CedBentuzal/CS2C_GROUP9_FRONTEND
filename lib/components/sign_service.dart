import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class SignupService {
  static Future<String?> signUpUser({
    required String username,
    required String email,
    required String password,
  }) async {
    final String baseUrl = dotenv.env['BASE_URL'] ?? 'http://default-url.com';
    final Uri url = Uri.parse('$baseUrl/api/signup');

    final requestBody = jsonEncode({
      'username': username,
      'email': email,
      'password': password,
    });

    print("Sending Request to: $url");

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: requestBody,
      );

      print("Response Code: ${response.statusCode}");
      print("Response Body: ${response.body}");

      if (response.statusCode == 201) {
        return null; // Success
      } else {
        return jsonDecode(response.body)['message'] ?? 'Sign-up failed';
      }
    } catch (e) {
      print("Error: $e");
      return 'Failed to connect to the server';
    }
  }
}
