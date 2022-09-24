import 'package:flutter/material.dart';
import 'package:groceryapp/inner_Screen/ProductDetails.dart';
import 'package:groceryapp/inner_Screen/ProductsOnSale.dart';
import 'package:groceryapp/providers/darkTheme_provider.dart';
import 'package:groceryapp/screens/BottomBarScreen.dart';
import 'package:groceryapp/consts/Style.dart';
import 'package:groceryapp/screens/auth/ForgetPass.dart';
import 'package:groceryapp/screens/auth/LoginScreen.dart';
import 'package:groceryapp/screens/auth/RegisterScreen.dart';
import 'package:groceryapp/screens/orders/OrdersScreen.dart';
import 'package:groceryapp/screens/viewed/ViewedRecentlyScreen.dart';
import 'package:groceryapp/screens/wishlist/WishlistScreen.dart';
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
            theme: Style.themeData(darkthemeprovider.getThemeMode,context),
            home: const LoginScreen(),
            routes: {
              ProductsOnSale.routeName : (cxt) => const ProductsOnSale(),
              FeedsScreen.routeName : (ctx) => const FeedsScreen(),
              ProductDetails.routeName : (ctx)=> const ProductDetails(),
              WishlistScreen.routeName : (ctx)=> const WishlistScreen(),
              OrdersScreen.routeName : (ctx)=> const OrdersScreen(),
              ViewedRecentlyScreen.routeName : (ctx)=> const ViewedRecentlyScreen(),
              RegisterScreen.routeName : (ctx)=> const RegisterScreen(),
              ForgetPass.routeName : (ctx)=> const ForgetPass(),

            },
          );
        }
      ),
    );
  }
}
