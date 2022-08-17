import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";

class TextWidget extends StatelessWidget {
  TextWidget(
      {Key? key,
      required this.text,
      required this.fontSize,
      required this.color,
      this.isTitle = false,
      this.maxLines = 10})
      : super(key: key);
  final String text;
  final Color color;
  final double fontSize;
  int maxLines = 10;
  bool isTitle = false;

  @override
  Widget build(BuildContext context) {

    return Text(
      text,
      style: TextStyle(
        fontWeight: isTitle ? FontWeight.bold : FontWeight.normal,
        fontSize: fontSize,
        overflow: TextOverflow.ellipsis,
        color: color,
      ),
    );
  }
}
