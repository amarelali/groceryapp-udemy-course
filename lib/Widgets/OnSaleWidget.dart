import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:groceryapp/Widgets/TextWidget.dart';
import 'package:iconly/iconly.dart';
import '../services/Utils.dart';
import 'PriceWidget.dart';

class OnSaleWidget extends StatefulWidget {
  const OnSaleWidget({Key? key}) : super(key: key);

  @override
  State<OnSaleWidget> createState() => _OnSaleWidgetState();
}

class _OnSaleWidgetState extends State<OnSaleWidget> {
  @override
  Widget build(BuildContext context) {
    Color color = Utils(context).color;
    Size size = Utils(context).screenSize;
    return Material(
      color: Theme.of(context).cardColor.withOpacity(0.9),
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment : MainAxisAlignment.spaceBetween, children: [
              FancyShimmerImage(
                height: size.width * 0.22,
                width: size.width * 0.22,
                imageUrl: 'https://i.ibb.co/F0s3FHQ/Apricots.png',
              ),
              Column(children: [
                TextWidget(
                    text: '1 KG', fontSize: 22, color: color, isTitle: true),
                const SizedBox(
                  height: 6,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        print('bag button is pressed');
                      },
                      child: Icon(
                        IconlyLight.bag_2,
                        size: 22,
                        color: color,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        print('heart button is pressed');
                      },
                      child: Icon(
                        IconlyLight.heart,
                        size: 22,
                        color: color,
                      ),
                    ),
                  ],
                ),
              ]),
            ]),
            PriceWidget(
                isOnSale: true, price: 5.9, salePrice: 2.2, textPrice: '1'),
            const SizedBox(
              height: 5,
            ),
            TextWidget(
                text: 'Product title',
                fontSize: 18,
                color: color,
                isTitle: true),
            const SizedBox(
              height: 5,
            ),
          ]),
        ),
      ),
    );
  }
}
