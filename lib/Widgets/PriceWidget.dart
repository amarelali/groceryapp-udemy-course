import 'package:flutter/material.dart';
import 'package:groceryapp/Widgets/TextWidget.dart';
import 'package:groceryapp/services/Utils.dart';

class PriceWidget extends StatelessWidget {
  final double salePrice, price;
  final String textPrice;
  final bool isOnSale;

  PriceWidget(
      {Key? key,
      required this.salePrice,
      required this.price,
      required this.textPrice,
      required this.isOnSale})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    final userPrice = isOnSale ? salePrice : price;
    return FittedBox(
      child: Row(
        children: [
          TextWidget(
              text:
                  '\$${(userPrice * double.parse(textPrice)).toStringAsFixed(2)}',
              fontSize: 18,
              color: Colors.green),
          const SizedBox(
            width: 5,
          ),
          Visibility(
            visible: isOnSale ? true : false,
            child: FittedBox(
              fit : BoxFit.scaleDown,
              child: Text(
                "\$${(price * double.parse(textPrice)).toStringAsFixed(2)}",
                style: TextStyle(
                    color: color,
                    fontSize: 13,
                    decoration: TextDecoration.lineThrough),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
