import 'package:flutter/cupertino.dart';

class GlobalMethods{
  static navigateTo({required BuildContext context ,required String routeName}){
    Navigator.pushNamed(context, routeName);
  }
}