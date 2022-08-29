import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:groceryapp/Widgets/TextWidget.dart';
import 'package:iconly/iconly.dart';

import '../Widgets/FeedsWidget.dart';
import '../services/Utils.dart';

class FeedsScreen extends StatefulWidget {
  static const routeName = '/FeedsScreen';

  const FeedsScreen({Key? key}) : super(key: key);

  @override
  State<FeedsScreen> createState() => _FeedsScreenState();
}

class _FeedsScreenState extends State<FeedsScreen> {
  TextEditingController? _searchTextController = TextEditingController();
  FocusNode _searchFocusNode = FocusNode();

  @override
  void dispose(){
    super.dispose();
    _searchTextController?.dispose();
    _searchFocusNode.unfocus;
  }
  @override
  Widget build(BuildContext context) {
    Color color = Utils(context).color;
    Size size = Utils(context).screenSize;

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){ Navigator.of(context).pop(context);},
          child: Icon(
            IconlyLight.arrow_left_2,
            color: color,
          ),
        ),
        title: TextWidget(
            text: 'All Products', color: color, fontSize: 20, isTitle: true),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: kBottomNavigationBarHeight,
                  child: TextField(
                    controller: _searchTextController,
                    onChanged: (value) {},
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.greenAccent, width: 1),
                          borderRadius: BorderRadius.circular(12)),
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(width: 1,color: Colors.greenAccent)),
                    prefixIcon: const Icon(Icons.search,color: Colors.greenAccent,),
                    suffix:  Icon(Icons.clear,color: (_searchFocusNode.hasFocus) ? Colors.red : color ),),
                    focusNode: _searchFocusNode,
                  ),
                ),
              ),
               GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: size.width / (size.height * 0.65),
                children: List.generate(16, (index) => const FeedsWidget()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
