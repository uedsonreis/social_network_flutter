import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:social_network_flutter/services/abstract.service.dart';

class PostService extends AbstractService {
  PostService() : super(path: "posts");

  Future<List<dynamic>> getPosts(String token) async {
    var headers = super.getHeaders();
    headers.putIfAbsent('Authorization', () => 'Bearer ' + token);

    final response = await http.get(
      Uri.parse(super.getUrl()),
      headers: headers,
    );

    return List.from(jsonDecode(response.body));
  }
}
