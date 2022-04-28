import 'package:flutter/material.dart';
import 'package:social_network_flutter/components/input_text.dart';
import 'package:social_network_flutter/components/large_button.dart';
import 'package:social_network_flutter/pages/private/home.dart';
import 'package:social_network_flutter/pages/public/signup.dart';
import 'package:social_network_flutter/services/auth.service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  final String title = 'Social Network App';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email = '';
  String _password = '';

  void signUp() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignUpPage()),
    );
  }

  Future<void> login() async {
    AuthService service = AuthService();
    String? token = await service.login(_email, _password);

    if (token == null) {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('E-mail ou senha inválido(a)!'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage(token: token)),
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          InputText(
              label: 'Informe o e-mail:',
              change: (text) {
                setState(() {
                  _email = text;
                });
              }),
          InputText(
              isPassword: true,
              label: 'Informe a senha:',
              change: (text) {
                setState(() {
                  _password = text;
                });
              }),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: LargeButton(text: 'Entrar', onPress: () => login()),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: LargeButton(
                text: 'Cadastrar',
                onPress: () => signUp(),
                principalTheme: false,
              )),
        ],
      ),
    );
  }
}
