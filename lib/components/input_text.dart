import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  const InputText(
      {Key? key,
      required this.label,
      required this.change,
      this.isPassword = false})
      : super(key: key);

  final String label;
  final Function change;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: TextFormField(
        autocorrect: false,
        enableSuggestions: false,
        obscureText: isPassword,
        onChanged: (text) {
          change(text);
        },
        decoration: InputDecoration(
          border: const UnderlineInputBorder(),
          labelText: label,
        ),
      ),
    );
  }
}
