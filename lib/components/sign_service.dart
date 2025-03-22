import 'dart:convert';
import 'package:http/http.dart' as http;

class SignupService {
  static Future<String?> signUpUser(
      {required String username,
      required String email,
      required String password}) async {
    final Uri url = Uri.parse('http://localhost:3000/api/signup');
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(
            {'username': username, 'email': email, 'password': password}),
      );

      if (response.statusCode == 201) {
        return null;
      } else {
        final responseData = jsonDecode(response.body);
        return responseData['message'] ?? 'Sign-up failed';
      }
    } catch (e) {
      return 'An error occurred. Please try again later.';
    }
  }
}
