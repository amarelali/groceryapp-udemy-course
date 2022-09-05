import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:groceryapp/Widgets/TextWidget.dart';
import 'package:groceryapp/inner_Screen/ProductDetails.dart';
import 'package:groceryapp/services/GlobalMethods.dart';
import 'package:groceryapp/services/Utils.dart';
class OrdersWidget extends StatefulWidget {
  const OrdersWidget({Key? key}) : super(key: key);

  @override
  State<OrdersWidget> createState() => _OrdersWidgetState();
}

class _OrdersWidgetState extends State<OrdersWidget> {
  @override
  Widget build(BuildContext context) {
    final Size size = Utils(context).screenSize;
    final Color color = Utils(context).color;
    return GestureDetector(
      onTap: (){
        GlobalMethods.navigateTo(context: context, routeName: ProductDetails.routeName);
      },
      child: ListTile(
        leading: FancyShimmerImage(
          imageUrl: 'https://i.ibb.co/F0s3FHQ/Apricots.png',
          width : size.width * 0.2,
        ),
        subtitle: Text('paid: \$12.8'),
        title: TextWidget(text: 'Title x12',color: color,fontSize: 18,),
        trailing: TextWidget(text: '05/09/2022',color: color,fontSize: 18,),
      ),
    );
  }
}
