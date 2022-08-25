import 'package:flutter/material.dart';
import 'package:groceryapp/inner_Screen/ProductsOnSale.dart';
import 'package:groceryapp/providers/darkTheme_provider.dart';
import 'package:groceryapp/screens/BottomBarScreen.dart';
import 'package:groceryapp/consts/Style.dart';
import 'package:provider/provider.dart';

import 'inner_Screen/FeedsScreen.dart';
void main() {
  runApp( MyApp());
}

class MyApp extends StatefulWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
   DarkThemeProvider darkthemeprovider = DarkThemeProvider();
   void getCurrentAppTheme() async{
     darkthemeprovider.setThemeMode = await darkthemeprovider.darkthemepref.getThemeMode();
   }
   @override
   void initState(){
     super.initState();
     getCurrentAppTheme();

   }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[
      ChangeNotifierProvider<DarkThemeProvider>(create: (_)=> darkthemeprovider)
      ],
      child: Consumer<DarkThemeProvider>(
        builder: (context,darkthemeprovider,child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: Style.themeData(darkthemeprovider.getThemeMode),
            home: const BottomBarScreen(),
            routes: {
              ProductsOnSale.routeName : (cxt) => const ProductsOnSale(),
              FeedsScreen.routeName : (ctx) => const FeedsScreen(),
            },
          );
        }
      ),
    );
  }
}
