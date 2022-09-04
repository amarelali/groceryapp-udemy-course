import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:groceryapp/Widgets/HeartBtn.dart';
import 'package:groceryapp/Widgets/TextWidget.dart';
import 'package:groceryapp/inner_Screen/ProductDetails.dart';
import 'package:groceryapp/services/GlobalMethods.dart';
import 'package:iconly/iconly.dart';

import '../../services/Utils.dart';

class WishlistWidget extends StatefulWidget {
  const WishlistWidget({Key? key}) : super(key: key);

  @override
  State<WishlistWidget> createState() => _WishlistWidgetState();
}

class _WishlistWidgetState extends State<WishlistWidget> {
  @override
  Widget build(BuildContext context) {
    final Size size = Utils(context).screenSize;
    final Color color = Utils(context).color;
    return Padding(
      padding: const EdgeInsets.all(4),
      child: GestureDetector(onTap: (){ GlobalMethods.navigateTo(context: context, routeName: ProductDetails.routeName);},
      child:  Container(
        height: size.height * 0.2,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color : color , width: 1),
        ),
        child: Row(
          children: [
            Container(
              width: size.width * 0.2,
              height: size.width * 0.25,
              margin: const EdgeInsets.all(8),
              child: FancyShimmerImage(
                imageUrl: 'https://i.ibb.co/F0s3FHQ/Apricots.png',
              ),
            ),
            Column(
              children: [
                Flexible(
                  child: Row(children: [
                    IconButton(onPressed: (){}, icon: Icon(IconlyLight.bag_2,color: color,)),
                    const HeartBtn(),
                  ],),
                ),
                Flexible(child: TextWidget(text: 'Title', fontSize: 20, color: color,maxLines: 1,isTitle: true,)),
                const SizedBox(height: 5,),
                TextWidget(text: '\$2.59', fontSize: 20, color: color,maxLines: 1,isTitle: true,),

              ],)
          ],
        ),
      ),),
    );
  }
}
