import 'package:flutter/material.dart';
import 'package:groceryapp/Widgets/TextWidget.dart';
import 'package:groceryapp/inner_Screen/FeedsScreen.dart';
import 'package:groceryapp/services/GlobalMethods.dart';

import '../services/Utils.dart';

class EmptyScreen extends StatelessWidget {
  EmptyScreen(
      {Key? key,
      required this.imagePath,
      required this.title,
      required this.subtitle,
      required this.buttonTitle})
      : super(key: key);
  final String imagePath, title, subtitle, buttonTitle;

  @override
  Widget build(BuildContext context) {
    final Size size = Utils(context).screenSize;
    final isDark = Utils(context).getTheme;
    final Color color = Utils(context).color;

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset(
                imagePath,
                width: double.infinity,
                height: size.height * 0.4,
              ),
            ),
            TextWidget(
                text: 'Whoops!',
                fontSize: 30,
                color: Colors.redAccent,
                isTitle: true),
            SizedBox(
              height: 25,
            ),
            TextWidget(
                text: title,
                fontSize: 23,
                color: Colors.blueAccent),
            FittedBox(
              child: TextWidget(
                  text: subtitle,
                  fontSize: 23,
                  color: Colors.blueAccent),
            ),
            SizedBox(height: size.height * 0.15),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  GlobalMethods.navigateTo(
                      context: context, routeName: FeedsScreen.routeName);
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  side: BorderSide(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  primary: Theme.of(context).colorScheme.secondary,
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                ),
                child: Text(
                  'Shop now',
                  style: TextStyle(
                      color:
                          isDark ? Colors.grey.shade300 : Colors.grey.shade800,
                      fontWeight: FontWeight.w700,
                      fontSize: 24),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
