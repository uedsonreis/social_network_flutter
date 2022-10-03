import 'package:flutter/material.dart';
import 'package:social_network_flutter/pages/components/PostListing.dart';
import 'package:social_network_flutter/services/post.service.dart'
    show PostService;

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.token}) : super(key: key);

  final String token;

  Future<List<dynamic>> fetchPosts() async {
    PostService service = PostService();
    return await service.getPosts(token);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchPosts(),
        builder: (context, AsyncSnapshot<dynamic> snapshot) {
          List<dynamic> posts = snapshot.data ?? [];
          return Scaffold(
            appBar: AppBar(
              title: const Text('Postagens'),
            ),
            body: PostListing(
              posts: posts,
            ),
          );
        });
  }
}
