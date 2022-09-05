import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:groceryapp/screens/wishlist/WishlistWidget.dart';
import 'package:groceryapp/services/GlobalMethods.dart';
import 'package:groceryapp/services/Utils.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../Widgets/BackWidget.dart';

class WishlistScreen extends StatefulWidget {
  static const routeName = '/WishlistScreen';

  const WishlistScreen({Key? key}) : super(key: key);

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        title: Text('Wishlist (16)', style: TextStyle(color: color,fontSize: 20),),
        elevation: 0,
        leading: BackWidget(),
        actions: [
          IconButton(
            onPressed: (){
              GlobalMethods.warningDialog(context: context, title: 'Empty your wishlist', subtitle: 'Are you sure?', fct: (){});
            },
            icon: Icon(
              CupertinoIcons.delete,
              color: color,
            ),
          )
        ],
      ),
      body: MasonryGridView.count(crossAxisCount: 2,itemCount: 16, itemBuilder: (context,index){
        return const WishlistWidget();
      })
    );
  }
}
