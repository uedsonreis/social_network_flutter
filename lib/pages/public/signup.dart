import 'package:flutter/material.dart';
import 'package:social_network_flutter/components/input_text.dart';
import 'package:social_network_flutter/components/large_button.dart';
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
        InputText(
          label: 'Nome:',
          change: (text) => setState(() => _name = text),
        ),
        InputText(
          label: 'E-mail:',
          change: (text) => setState(() => _email = text),
        ),
        InputText(
          label: 'Senha:',
          change: (text) => setState(() => _password = text),
          isPassword: true,
        ),
        InputText(
          label: 'Confirmar Senha:',
          change: (text) => setState(() => _confirmPass = text),
          isPassword: true,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: LargeButton(
            text: 'Voltar',
            onPress: () => back(),
            principalTheme: false,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: LargeButton(text: 'Salvar', onPress: () => create()),
        ),
      ],
    );
  }
}
