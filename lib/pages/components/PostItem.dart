import 'package:flutter/material.dart';

class PostItem extends StatelessWidget {
  const PostItem({Key? key, required this.description, required this.location})
      : super(key: key);

  final String description;
  final String location;

  final _style = const TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        description,
        style: _style,
      ),
      subtitle: Text(
        location,
        style: _style,
      ),
    );
  }
}
