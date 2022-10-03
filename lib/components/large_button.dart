import 'package:flutter/material.dart';

class LargeButton extends StatelessWidget {
  const LargeButton(
      {Key? key,
      required this.text,
      required this.onPress,
      this.principalTheme = true})
      : super(key: key);

  final String text;
  final Function onPress;
  final bool principalTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
          style: TextButton.styleFrom(
            primary: principalTheme
                ? Theme.of(context).secondaryHeaderColor
                : Theme.of(context).primaryColor,
            backgroundColor: principalTheme
                ? Theme.of(context).primaryColor
                : Theme.of(context).secondaryHeaderColor,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(3.0)),
            ),
          ),
          onPressed: () {
            onPress();
          },
          child: Text(text)),
    );
  }
}
