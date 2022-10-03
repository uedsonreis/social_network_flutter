import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:social_network_flutter/services/abstract.service.dart';

class UserService extends AbstractService {
  UserService() : super(path: "users");

  Future<String?> create(String name, String email, String password) async {
    final response = await http.post(
      Uri.parse(super.getUrl()),
      headers: super.getHeaders(),
      body: jsonEncode(
        <String, String>{'name': name, 'email': email, 'password': password},
      ),
    );

    if (response.statusCode == 201) {
      return jsonDecode(response.body)['id'];
    }

    return null;
  }
}
