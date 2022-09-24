import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:groceryapp/screens/wishlist/WishlistWidget.dart';
import 'package:groceryapp/services/GlobalMethods.dart';
import 'package:groceryapp/services/Utils.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../Widgets/BackWidget.dart';
import '../../Widgets/EmptyScreen.dart';

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
    bool _isEmpty = true;

    return _isEmpty
        ? EmptyScreen(
      imagePath: 'Assets/Images/wishlist.png',
      title :"Your wishlist is empty",
      subtitle: "Explore more and shortlist some items",
      buttonTitle: "Add a wish",
    ) :  Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        title: Text('Wishlist (16)', style: TextStyle(color: color,fontSize: 20),),
        elevation: 0,
        leading:  BackWidget(color: color,),
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
