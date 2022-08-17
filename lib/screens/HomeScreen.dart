import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:groceryapp/Widgets/TextWidget.dart';
import 'package:groceryapp/providers/darkTheme_provider.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:card_swiper/card_swiper.dart';

import '../Widgets/FeedsWidget.dart';
import '../Widgets/OnSaleWidget.dart';
import '../services/Utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> _offersImages = [
    'Assets/Images/offers/Offer1.jpg',
    'Assets/Images/offers/Offer2.jpg',
    'Assets/Images/offers/Offer3.jpg',
    'Assets/Images/offers/Offer4.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    final color = Utils(context).color;
    Size size = Utils(context).screenSize;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.33,
              child: Swiper(
                autoplay: true,
                itemBuilder: (BuildContext context, int index) {
                  return Image.asset(
                    _offersImages[index],
                    fit: BoxFit.fill,
                  );
                },
                itemCount: _offersImages.length,
                pagination: const SwiperPagination(
                    builder: DotSwiperPaginationBuilder(
                  color: Colors.white,
                  activeColor: Colors.red,
                )),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            TextButton(
                onPressed: () {},
                child: TextWidget(
                  color: Colors.blue,
                  text: 'View All',
                  fontSize: 22,
                )),
            Row(
              children: [
                SizedBox(
                  width: 40,
                  child: RotatedBox(
                    quarterTurns: -1,
                    child: Row(
                      children: [
                        TextWidget(
                            text: "On Sale".toUpperCase(),
                            color: Colors.red,
                            fontSize: 20,
                            isTitle: true),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          IconlyLight.discount,
                          size: 20,
                          color: Colors.red,
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  child: SizedBox(
                    height: size.width * 0.45,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: OnSaleWidget(),
                          );
                        }),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                      text: 'Our Product',
                      fontSize: 20,
                      color: color,
                      isTitle: true,
                    ),
                    TextWidget(
                        text: 'Browse All', fontSize: 20, color: Colors.blue),
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: size.width / (size.height * 0.65),
                children: List.generate(4, (index) => FeedsWidget()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
