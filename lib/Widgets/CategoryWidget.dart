import 'package:flutter/material.dart';
import '../services/Utils.dart';
import 'TextWidget.dart';

class CategoryWidget extends StatelessWidget {
  CategoryWidget(
      {Key? key,
      required this.imagPath,
      required this.catText,
      required this.Categcolor})
      : super(key: key);
  final String imagPath, catText;
  final Color Categcolor;

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    final double _screenWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        color: Categcolor.withOpacity(0.1),
        border: Border.all(
          width: 2,
          color: Categcolor.withOpacity(0.7),
        ),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              width: _screenWidth * 0.3,
              height: _screenWidth * 0.3,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(imagPath), fit: BoxFit.fill),
              ),
            ),
            TextWidget(
              text: catText,
              fontSize: 24,
              color: color,
            ),
          ],
        ),
      ),
    );
  }
}
