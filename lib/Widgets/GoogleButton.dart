import 'package:flutter/material.dart';
import 'package:groceryapp/Widgets/TextWidget.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.blue,
      child: InkWell(
        onTap: (){},
        child: Row(
          children: [
            Container(
                child: Image.asset(
                  'Assets/Images/google.png',
                  width: 40,
                ),
                color: Colors.white),
            const SizedBox(width: 8,),
            TextWidget(text: 'Continue with google', fontSize: 18, color: Colors.white),


          ],
        ),
      ),
    );
  }
}
