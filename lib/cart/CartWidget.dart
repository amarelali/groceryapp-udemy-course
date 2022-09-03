import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:groceryapp/Widgets/HeartBtn.dart';
import 'package:groceryapp/Widgets/TextWidget.dart';
import 'package:groceryapp/services/GlobalMethods.dart';
import 'package:groceryapp/services/Utils.dart';

import '../inner_Screen/ProductDetails.dart';

class CartWidget extends StatefulWidget {
  const CartWidget({Key? key}) : super(key: key);

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  TextEditingController _quantityTextController =
  TextEditingController(text: '1');
  @override
  void initState() {
    super.initState();
    _quantityTextController.text = '1';
  }
  @override
  Widget build(BuildContext context) {

    final Size size = Utils(context).screenSize;
    final Color color = Utils(context).color;


    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          GlobalMethods.navigateTo(context: context, routeName: ProductDetails.routeName);
        },
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).cardColor),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.width * 0.2,
                  width: size.width * 0.2,
                  child: FancyShimmerImage(
                    imageUrl: 'https://i.ibb.co/F0s3FHQ/Apricots.png',
                  ),
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  TextWidget(text: 'Title', fontSize: 22, color: color),
                  SizedBox(
                    width: size.width * 0.3,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Flexible(
                            child: _quantityController(
                                fct: () {
                                  if(_quantityTextController.text == '1'){return;}else{
                                    setState(() {
                                      _quantityTextController.text= (int.parse(_quantityTextController.text) -1).toString();
                                    });
                                  }
                                },
                                icon: CupertinoIcons.minus,
                                color: Colors.redAccent),
                          ),
                          Flexible(
                              flex: 1,
                              child: TextField(
                                controller: _quantityTextController,
                                maxLines: 1,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: color))),
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                    RegExp('[0-9]'),
                                  )
                                ],
                                onChanged: (value) {
                                  setState(() {
                                    if (value.isEmpty) {
                                      _quantityTextController.text = '1';
                                    } else {
                                      return;
                                    }
                                  });
                                },
                              )),
                          Flexible(
                            child: _quantityController(
                                fct: () {
                                  setState(() {
                                    _quantityTextController.text = (int.parse(_quantityTextController.text) + 1).toString();
                                  });
                                },
                                icon: CupertinoIcons.add,
                                color: Colors.greenAccent),
                          )
                        ]),
                  ),
                ]),
                const Spacer(),
                Column(
                  crossAxisAlignment:CrossAxisAlignment.end ,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: const Icon(CupertinoIcons.cart_badge_minus,
                          color: Colors.redAccent),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    const HeartBtn(),
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: 50,
                      child: FittedBox(
                          child: TextWidget(
                              text: '\$1.25',
                              fontSize: 20,
                              color: color)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _quantityController(
      {required Function fct, required IconData icon, required Color color}) {
    return Material(
      borderRadius: BorderRadius.circular(10),
      color: color,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          fct();
        },
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Icon(
            icon,
            size: 20,
          ),
        ),
      ),
    );
  }
}
