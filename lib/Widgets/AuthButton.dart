import 'package:flutter/material.dart';
import 'package:groceryapp/Widgets/TextWidget.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({Key? key, required this.ButtonText, this.primary = Colors.white38, required this.fct})
      : super(key: key);
  final String ButtonText;
  final Color primary;
  final Function fct;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        fct();
      },
      child: TextWidget(
        text: ButtonText,
        fontSize: 18,
        color: Colors.white,
      ),
      style: ElevatedButton.styleFrom(
        primary: primary,
      ),
    );
  }
}
