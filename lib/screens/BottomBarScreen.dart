import 'package:flutter/material.dart';
import 'package:groceryapp/screens/HomeScreen.dart';
import 'package:groceryapp/screens/UserScreen.dart';
import 'package:groceryapp/screens/CategoriesScreen.dart';
import 'package:groceryapp/screens/CartScreen.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import '../providers/darkTheme_provider.dart';
class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int _selectedIndex = 0;
  final List<Map<String,dynamic>> _pages = [
    {'page': const  HomeScreen(),'title': 'Home Screen'},
    {'page': const  CategoriesScreen(),'title': 'Categories Screen'},
    {'page':  const  CartScreen(),'title': 'Cart Screen'},
    {'page': const  UserScreen(),'title': 'User Screen'},
  ];
  void _selectScreen(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    var darkmode = Provider.of<DarkThemeProvider>(context);
    bool isDark = darkmode.getThemeMode;
    return Scaffold(
      body: _pages[_selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: isDark ? Theme.of(context).scaffoldBackgroundColor : Colors.white,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: isDark ?  Colors.white12 : Colors.black12,
        selectedItemColor: isDark ?  Colors.lightBlue : Colors.black87,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        onTap: _selectScreen,
        items: <BottomNavigationBarItem> [
          BottomNavigationBarItem(icon: Icon(_selectedIndex == 0 ? IconlyBold.home : IconlyLight.home),label: "Home"),
          BottomNavigationBarItem(icon: Icon( _selectedIndex == 1 ? IconlyBold.category : IconlyLight.category),label: "Categories"),
          BottomNavigationBarItem(icon: Icon( _selectedIndex == 2 ? IconlyBold.buy : IconlyLight.buy),label: "Cart"),
          BottomNavigationBarItem(icon: Icon(_selectedIndex == 3 ? IconlyBold.user_2: IconlyLight.user),label: "User"),
        ],


      ),
      appBar: AppBar(title: Text(_pages[_selectedIndex]['title']),),
    );
  }
}