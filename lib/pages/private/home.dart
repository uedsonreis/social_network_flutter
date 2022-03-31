import 'package:flutter/material.dart';
import 'package:social_network_flutter/services/post.service.dart'
    show PostService;

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.token}) : super(key: key);

  final String token;

  final _style = const TextStyle(fontSize: 18);

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
            body: _buildPosts(posts),
          );
        });
  }

  Widget _buildPosts(List<dynamic> _posts) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _posts.length,
      itemBuilder: (context, i) {
        if (i.isOdd) {
          return const Divider();
        }
        return _buildRow(_posts[i]['description']);
      },
    );
  }

  Widget _buildRow(String word) {
    return ListTile(
      title: Text(
        word,
        style: _style,
      ),
    );
  }
}
