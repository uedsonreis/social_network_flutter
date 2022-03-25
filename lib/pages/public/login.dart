import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  final String title = 'Social Network App';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Add from here...
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _buildPanel(),
    );
  }

  Widget _buildPanel() {
    return Center(
      child: _buildView()
    );
  }

  Widget _buildView() {

    return ListView(
      children: [
        Row(
          children: [
            const Text('E-mail:'),
            Flexible(
              child: TextField(
                controller: TextEditingController(),
                onChanged: (text) {
                  setState(() {
                    _email = text;
                  });
                },
                decoration: const InputDecoration.collapsed(hintText: 'E-mail'),
              ),
            )
          ],
        ),
        Row(
          children: [
            Column(children: const [Text('Senha:')]),
            Column(children: const [Text('Input da senha')])
          ],
        ),
      ]
    );
  }

}
