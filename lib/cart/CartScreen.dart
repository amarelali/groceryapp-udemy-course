import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:groceryapp/Widgets/TextWidget.dart';
import 'package:groceryapp/cart/CartWidget.dart';
import 'package:iconly/iconly.dart';

import '../services/Utils.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    print(
        'Cart Screen \n Utils(context) getTheme ${Utils(context).getTheme}\nUtils(context) color ${Utils(context).color}\n ');
    Color color = Utils(context).color;
    return Scaffold(
      appBar: AppBar(
          title: TextWidget(
            text: 'Cart (16)',
            color: color,
            fontSize: 22,
            isTitle: true,
          ),
          actions: [Icon(CupertinoIcons.delete)]),
      body: Center(
        child: ListView.builder(
            itemCount: 6,
            itemBuilder: (context, index) {
              return const CartWidget();
            }
            // itemBuilder: CartWidget(),
            ),
      ),
    );
  }
}
