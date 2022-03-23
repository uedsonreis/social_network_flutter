import 'package:flutter/material.dart';
import 'package:social_network_flutter/random_words.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: 'Welcome to Flutter', home: Center(child: RandomWords()));
  }
}
