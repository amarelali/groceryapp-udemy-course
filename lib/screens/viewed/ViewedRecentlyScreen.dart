import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:groceryapp/Widgets/BackWidget.dart';
import 'package:groceryapp/screens/viewed/ViewedRecentlyWidget.dart';

import '../../Widgets/TextWidget.dart';
import '../../services/GlobalMethods.dart';
import '../../services/Utils.dart';
class ViewedRecentlyScreen extends StatefulWidget {
  static const routeName = '/ViewedRecentlyScreen';
  const ViewedRecentlyScreen({Key? key}) : super(key: key);

  @override
  State<ViewedRecentlyScreen> createState() => _ViewedRecentlyScreenState();
}

class _ViewedRecentlyScreenState extends State<ViewedRecentlyScreen> {
  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;

    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          leading: const BackWidget(),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: TextWidget(
            text: 'History',
            color: color,
            fontSize: 22,
          ),
          actions: [
            IconButton(
                onPressed: () {
                  GlobalMethods.warningDialog(context: context, title: 'Empty your history', subtitle: 'Are you sure?', fct: (){});
                },
                icon: Icon(
                  CupertinoIcons.delete,
                  color: color,
                ))
          ]),
      body: ListView.builder(
          itemCount: 6,
          itemBuilder: (context, index) {
            return const ViewedRecentlyWidget();
          }
        // itemBuilder: CartWidget(),
      ),
    );
  }
}
