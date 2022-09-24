import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
class BackWidget extends StatelessWidget {
  BackWidget({Key? key, required this.color}) : super(key: key);
  final Color color;

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop(context);
      },
      child: Icon(
        IconlyLight.arrow_left_2,
        color: color,
      ),
    );
  }
}
