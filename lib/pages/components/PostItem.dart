import 'dart:convert';

import 'package:flutter/material.dart';

class PostItem extends StatelessWidget {
  const PostItem({Key? key, required this.description, required this.location})
      : super(key: key);

  final String description;
  final String location;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        description,
        style: const TextStyle(fontSize: 18),
      ),
      subtitle: Text(
        location,
        textAlign: TextAlign.right,
        style: TextStyle(
          fontSize: 12,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
