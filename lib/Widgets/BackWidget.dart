import 'package:flutter/material.dart';
import 'package:groceryapp/services/Utils.dart';
import 'package:iconly/iconly.dart';
class BackWidget extends StatelessWidget {
  const BackWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;

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
