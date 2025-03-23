import 'dart:convert';
import 'package:http/http.dart' as http;

class SignupService {
  static Future<String?> signUpUser({
    required String username,
    required String email,
    required String password,
  }) async {
    final Uri url = Uri.parse('http://192.168.1.115:3000/api/signup');

    final requestBody = jsonEncode({
      'username': username,
      'email': email,
      'password': password,
    });

    print("Sending Request to: $url");
    print("Request Body: $requestBody");

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
