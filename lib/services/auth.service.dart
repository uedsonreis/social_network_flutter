import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:social_network_flutter/services/abstract.service.dart';

class AuthService extends AbstractService {
  AuthService() : super(path: "auth");

  Future<String?> login(String email, String password) async {
    final response = await http.post(
      Uri.parse(super.getUrl() + '/login'),
      headers: super.getHeaders(),
      body: jsonEncode(<String, String>{'email': email, 'password': password}),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }

    return null;
  }
}
