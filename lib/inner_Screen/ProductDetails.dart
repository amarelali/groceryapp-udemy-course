import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:groceryapp/Widgets/HeartBtn.dart';
import 'package:groceryapp/Widgets/PriceWidget.dart';
import 'package:groceryapp/Widgets/TextWidget.dart';
import 'package:iconly/iconly.dart';
import '../Widgets/BackWidget.dart';
import '../consts/Style.dart';
import '../services/Utils.dart';

class ProductDetails extends StatefulWidget {
  static const routeName = '/ProductDetails';

  const ProductDetails({Key? key}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  TextEditingController _quantityTextController =
      TextEditingController(text: '1');

  @override
  void initState() {
    super.initState();
    _quantityTextController.text = '1';
  }

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    final Size size = Utils(context).screenSize;
    final bool isDark = Utils(context).getTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Style.themeData(isDark, context).scaffoldBackgroundColor,
        elevation: 0,
        leading: BackWidget(),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Flexible(
            flex: 2,
            child: Container(
              width: size.width,
              child: FancyShimmerImage(
                imageUrl: 'https://i.ibb.co/F0s3FHQ/Apricots.png',
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                  color: Style.themeData(isDark, context).cardColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidget(text: 'Title', fontSize: 20, color: color),
                        const HeartBtn(),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidget(
                            text: '\$2.99', fontSize: 20, color: Colors.green),
                        TextWidget(text: '/KG', fontSize: 14, color: color),
                        const SizedBox(
                          width: 5,
                        ),Text('\$10',style : TextStyle(fontSize: 14, color: color,decoration: TextDecoration.lineThrough) ),
                        const Spacer(),
                        Material(
                          color: Colors.green,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: TextWidget(
                              text: 'Free Delivery',
                              color: color,
                              fontSize: 18,
                            ),
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: size.width * 0.3,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Flexible(
                            child: _quantityController(
                                fct: () {
                                  if(_quantityTextController.text == '1'){
                                  return;
                                }else{
                                  setState(() {
                                    _quantityTextController.text= (int.parse(_quantityTextController.text) -1).toString();
                                  });
                                }},
                                icon: CupertinoIcons.minus_square,
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
                                fct: () {setState(() {
                                  _quantityTextController.text= (int.parse(_quantityTextController.text) +1).toString();
                                });},
                                icon: CupertinoIcons.plus_square,
                                color: Colors.greenAccent),
                          )
                        ]),
                  ),
                  const Spacer(),
                  Material(
                    color: Style.themeData(isDark, context).colorScheme.secondary,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40),
                        topLeft: Radius.circular(40)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget(
                                  text: 'Total', fontSize: 20, color: Colors.red),
                              const SizedBox(height: 5,),
                              Row(
                                children: [
                                  TextWidget(
                                      text: '\$ 2.99', fontSize: 20, color:color),
                                  TextWidget(text: '/${_quantityTextController.text}KG', fontSize: 15, color: color),
                                ],
                              ),
                            ],
                          ),
                          Material(
                            borderRadius: BorderRadius.circular(10),
                              color: Colors.green,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextWidget(
                                  text: 'Add to Card',
                                  color: color,
                                  fontSize: 18,
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
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
            color:Colors.white,
          ),
        ),
      ),
    );
  }
}
