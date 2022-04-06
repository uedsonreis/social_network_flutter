import 'package:flutter/material.dart';
import 'package:social_network_flutter/services/user.service.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  final String title = 'Novo Usuário';

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String _name = '';
  String _email = '';
  String _password = '';
  String _confirmPass = '';

  void back() {
    Navigator.pop(context);
  }

  Future<void> create() async {
    if (_password == _confirmPass) {
      UserService service = UserService();
      String? id = await service.create(_name, _email, _password);

      if (id == null) {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Dados inválidos!'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      } else {
        Navigator.pop(context);
      }
    } else {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Senha não confere!'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Add from here...
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _buildForm(),
    );
  }

  Widget _buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            onChanged: (text) {
              setState(() {
                _name = text;
              });
            },
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Nome:',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            onChanged: (text) {
              setState(() {
                _email = text;
              });
            },
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'E-mail:',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            obscureText: true,
            autocorrect: false,
            enableSuggestions: false,
            onChanged: (text) {
              setState(() {
                _password = text;
              });
            },
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Senha:',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            obscureText: true,
            autocorrect: false,
            enableSuggestions: false,
            onChanged: (text) {
              setState(() {
                _confirmPass = text;
              });
            },
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Confirmar Senha:',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: SizedBox(
            width: double.infinity,
            child: TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.grey,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(3.0)),
                  ),
                ),
                onPressed: () {
                  back();
                },
                child: const Text('Voltar')),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: SizedBox(
            width: double.infinity,
            child: TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(3.0)),
                  ),
                ),
                onPressed: () {
                  create();
                },
                child: const Text('Salvar')),
          ),
        ),
      ],
    );
  }
}
