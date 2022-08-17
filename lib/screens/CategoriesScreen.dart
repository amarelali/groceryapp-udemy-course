import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Widgets/TextWidget.dart';
import '../Widgets/CategoryWidget.dart';

import '../services/Utils.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  List<Color> gridColor = [
    const Color(0xff538175),
    const Color(0xffF8A44C),
    const Color(0xffF7A593),
    const Color(0xffD380E0),
    const Color(0xffFDE598),
    const Color(0xffB7DFF5),
  ];
  List<Map<String, dynamic>> catInfo = [
    {'imgPath': 'Assets/Images/cat/fruits.png', 'catText': 'Fruits'},
    {'imgPath': 'Assets/Images/cat/spices.png', 'catText': 'Spices'},
    {'imgPath': 'Assets/Images/cat/Spinach.png', 'catText': 'Herbs'},
    {'imgPath': 'Assets/Images/cat/veg.png', 'catText': 'Vegatables'},
    {'imgPath': 'Assets/Images/cat/grains.png', 'catText': 'Grains'},
    {'imgPath': 'Assets/Images/cat/nuts.png', 'catText': 'Nuts'},
  ];

  @override
  Widget build(BuildContext context) {
    final utils = Utils(context);
    Color color = utils.color;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 250 / 250,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: List.generate(
              catInfo.length,
              (index) => CategoryWidget(
                Categcolor: gridColor[index],
                imagPath: catInfo[index]['imgPath'],
                catText: catInfo[index]['catText'],
              ),
            )),
      ),
    );
  }
}
