import 'dart:convert';

import 'package:bank__sha/shared/shared_value.dart';
import 'package:http/http.dart' as http;

class AuthService {
  Future<bool> checkEmail(String Email) async {
    try {
      final response = await http.post(
        Uri.parse(
          '$baseUrl/is-email-exist',
        ),
        body: {
          'email': Email,
        },
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body)['is_email_exist'];
      } else {
        return jsonDecode(response.body)['errors'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
