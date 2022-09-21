import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:groceryapp/Widgets/BackWidget.dart';
import 'package:groceryapp/Widgets/TextWidget.dart';
import 'package:groceryapp/screens/orders/OrdersWidget.dart';
import 'package:groceryapp/services/GlobalMethods.dart';
import '../../services/Utils.dart';
import '../../Widgets/EmptyScreen.dart';

class OrdersScreen extends StatefulWidget {
  static const routeName = '/OrdersScreen';

  const OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    bool _isEmpty = true;

    return _isEmpty
        ? EmptyScreen(
            imagePath: 'Assets/Images/wishlist.png',
            title: "You didn't place any order yet",
            subtitle: "Order something and make me happy :)",
            buttonTitle: "Shop now",
          )
        : Scaffold(
            appBar: AppBar(
                elevation: 0,
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                title: TextWidget(
                  text: 'Your Orders (16)',
                  color: color,
                  fontSize: 22,
                  isTitle: true,
                ),
                leading: const BackWidget(),
                actions: [
                  IconButton(
                      onPressed: () {
                        GlobalMethods.warningDialog(
                            context: context,
                            title: 'Empty your orders',
                            subtitle: 'Are you sure?',
                            fct: () {});
                      },
                      icon: Icon(
                        CupertinoIcons.delete,
                        color: color,
                      ))
                ]),
            body: ListView.separated(
              separatorBuilder: (context, index) => Divider(
                color: color,
                thickness: 1,
              ),
              itemCount: 6,
              itemBuilder: (context, index) => const OrdersWidget(),
            ),
          );
  }
}
