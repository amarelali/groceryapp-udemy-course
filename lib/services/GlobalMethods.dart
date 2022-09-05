import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Widgets/TextWidget.dart';

class GlobalMethods {
  static navigateTo(
      {required BuildContext context, required String routeName}) {
    Navigator.pushNamed(context, routeName);
  }

  static Future<void> warningDialog(
      {required BuildContext context,
      required String title,
      required String subtitle,
      required Function fct}) async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Row(
              children: [
                Image.asset('Assets/Images/warning-sign.png',
                    height: 20, width: 20, fit: BoxFit.fill),
                SizedBox(
                  width: 8,
                ),
                Text(title),
              ],
            ),
            content: Text(subtitle),
            actions: [
              TextButton(
                  onPressed: () {
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    }
                  },
                  child: TextWidget(
                    text: 'Cancel',
                    color: Colors.cyan,
                    fontSize: 18,
                  )),
              TextButton(
                  onPressed: () {
                    fct();
                  },
                  child: TextWidget(
                    text: 'OK',
                    fontSize: 18,
                    color: Colors.redAccent,
                  )),
            ],
          );
        });
  }
}
