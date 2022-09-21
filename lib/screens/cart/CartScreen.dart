import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:groceryapp/Widgets/TextWidget.dart';
import 'package:groceryapp/screens/cart/CartWidget.dart';
import 'package:groceryapp/services/GlobalMethods.dart';
import '../../services/Utils.dart';
import '../../Widgets/EmptyScreen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    bool _isEmpty = true;

    return _isEmpty
        ? EmptyScreen(
            imagePath: 'Assets/Images/cart.png',
            title: 'Your cart is empty',
            subtitle:  'Add something to make me happy :)',
            buttonTitle: 'Show now',
          )
        : Scaffold(
            appBar: AppBar(
                elevation: 0,
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                title: TextWidget(
                  text: 'Cart (16)',
                  color: color,
                  fontSize: 22,
                  isTitle: true,
                ),
                actions: [
                  IconButton(
                      onPressed: () {
                        GlobalMethods.warningDialog(
                            context: context,
                            title: 'Empty your card',
                            subtitle: 'Are you sure?',
                            fct: () {});
                      },
                      icon: Icon(
                        CupertinoIcons.delete,
                        color: color,
                      ))
                ]),
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
