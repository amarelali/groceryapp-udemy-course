import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:groceryapp/inner_Screen/ProductDetails.dart';
import 'package:groceryapp/services/GlobalMethods.dart';
import 'package:groceryapp/services/Utils.dart';
import '../../Widgets/TextWidget.dart';
class ViewedRecentlyWidget extends StatefulWidget {
  const ViewedRecentlyWidget({Key? key}) : super(key: key);

  @override
  State<ViewedRecentlyWidget> createState() => _ViewedRecentlyWidgetState();
}

class _ViewedRecentlyWidgetState extends State<ViewedRecentlyWidget> {
  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    Size size = Utils(context).screenSize;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 3),
      child: ListTile(
        shape : RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        tileColor: Theme.of(context).colorScheme.secondary,

        onTap: (){
          GlobalMethods.navigateTo(context: context, routeName: ProductDetails.routeName);
        },
        leading: FancyShimmerImage(
          imageUrl: 'https://i.ibb.co/F0s3FHQ/Apricots.png',
          width: size.width*0.2,
          height: size.width*0.27,
        ),
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: TextWidget(text: 'Title',color: color,fontSize: 18),
        ),
        subtitle: TextWidget(text: '\$12.88',color: color,fontSize: 18),
        trailing: Material(
          borderRadius: BorderRadius.circular(10),
          color: Colors.green,
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () {
            },
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Icon(
                CupertinoIcons.add,
                size: 20,
                color:Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
