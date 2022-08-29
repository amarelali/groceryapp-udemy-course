import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:groceryapp/Widgets/TextWidget.dart';
import 'package:groceryapp/services/Utils.dart';

class CartWidget extends StatefulWidget {
  const CartWidget({Key? key}) : super(key: key);

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _quantityTextController =
        TextEditingController(text: '1');
    Size size = Utils(context).screenSize;
    Color color = Utils(context).color;
    @override
    void initState() {
      super.initState();
      _quantityTextController.text = '1';
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 3),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {},
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
                                fct: () {},
                                icon: CupertinoIcons.minus,
                                color: Colors.redAccent),
                          ),
                          Flexible(
                              flex: 1,
                              child: TextField(
                                controller: _quantityTextController,
                                maxLines: 1,
                                keyboardType: TextInputType.number,
                                textAlign : TextAlign.center,
                                decoration: InputDecoration(focusedBorder: UnderlineInputBorder(borderSide: BorderSide()) ),
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                    RegExp('[0-9]'),
                                  )
                                ],onChanged: (value){
                                  setState(() {
                                    if(value.isEmpty){
                                      _quantityTextController.text='1';
                                    }else{return;}
                                  });
                              },
                              )),
                          Flexible(
                            child: _quantityController(
                                fct: () {},
                                icon: CupertinoIcons.add,
                                color: Colors.greenAccent),
                          )
                        ]),
                  ),
                ]),
              ],
            ),
          ),
          // child: Text('hello'),
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
