import 'package:flutter/material.dart';
import 'package:groceryapp/Widgets/OnSaleWidget.dart';
import 'package:groceryapp/Widgets/TextWidget.dart';
import 'package:groceryapp/services/Utils.dart';
class ProductsOnSale extends StatelessWidget {
  static const routeName = '/ProductsOnSale';
  const ProductsOnSale({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Utils utils = Utils(context);
    Size size = utils.screenSize;
    Color color = utils.color;
    return Scaffold(
      appBar: AppBar(title: TextWidget(text: 'Products on sale',isTitle: true,fontSize: 24,color: color,)) ,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
    crossAxisCount: 2,
    crossAxisSpacing: 10,
    mainAxisSpacing: 10,
    childAspectRatio: size.width / (size.height * 0.45),
    children: List.generate(16, (index) => OnSaleWidget()),
    ),
      ),
    );
  }
}
