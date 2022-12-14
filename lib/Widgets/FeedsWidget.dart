import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:groceryapp/Widgets/HeartBtn.dart';
import 'package:groceryapp/Widgets/PriceWidget.dart';
import 'package:groceryapp/Widgets/TextWidget.dart';
import '../inner_Screen/ProductDetails.dart';
import '../services/GlobalMethods.dart';
import '../services/Utils.dart';

class FeedsWidget extends StatefulWidget {
  const FeedsWidget({Key? key}) : super(key: key);

  @override
  State<FeedsWidget> createState() => _FeedsWidgetState();
}

class _FeedsWidgetState extends State<FeedsWidget> {
  final _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _textEditingController.text = '1';
  }

  @override
  void dispose() {
    super.dispose();
    _textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = Utils(context).screenSize;
    final Color color = Utils(context).color;

    return Material(
      borderRadius: BorderRadius.circular(10),
      color : Theme.of(context).cardColor,
      child: InkWell(
        onTap: (){
          GlobalMethods.navigateTo(context: context, routeName: ProductDetails.routeName);
        },
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          FancyShimmerImage(
            height: size.width * 0.21,
            width: size.width * 0.2,
            imageUrl: 'https://i.ibb.co/F0s3FHQ/Apricots.png',
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                  text: 'Product Title',
                  fontSize: 20,
                  color: color,
                  isTitle: true,
                ),
                HeartBtn(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 5,
                  child: PriceWidget(
                    salePrice: 6.5,
                    price: 4,
                    textPrice: _textEditingController.text,
                    isOnSale: true,
                  ),
                ),
                SizedBox(width: 2),
                Flexible(
                  flex: 3,
                  child: Row(
                    children: [
                      FittedBox(
                        child: TextWidget(
                          text: 'KG',
                          fontSize: 15,
                          color: color,
                        ),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Flexible(
                        child: TextFormField(
                          controller: _textEditingController,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                          onChanged: (value) {
                            setState(() {
                              _textEditingController.text =
                                  value.isEmpty ? '1' : value;
                              _textEditingController.selection =
                                  TextSelection.fromPosition(TextPosition(
                                      offset:
                                          _textEditingController.text.length));
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {},
            child: TextWidget(
              fontSize: 20,
              color: color,
              text: 'Add to card',
            ),
          ),
        ]),
      ),
    );
  }
}
