import 'package:flutter/material.dart';
import 'package:social_network_flutter/pages/components/PostItem.dart';

class PostListing extends StatelessWidget {
  const PostListing({Key? key, required this.posts}) : super(key: key);

  final List<dynamic> posts;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: posts.length,
      itemBuilder: (context, i) {
        if (i.isOdd) return const Divider();

        return PostItem(
          description: posts[i]['description'],
          location: posts[i]['location'],
        );
      },
    );
  }
}
