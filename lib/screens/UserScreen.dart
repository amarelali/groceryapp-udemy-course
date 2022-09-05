import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:groceryapp/Widgets/TextWidget.dart';
import 'package:groceryapp/screens/orders/OrdersScreen.dart';
import 'package:groceryapp/screens/wishlist/WishlistScreen.dart';
import 'package:groceryapp/services/GlobalMethods.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

import '../providers/darkTheme_provider.dart';
import '../services/Utils.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final TextEditingController _addressTextEditingController =
      TextEditingController(text: '');

  @override
  void dispose() {
    _addressTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isdarkmode = Provider.of<DarkThemeProvider>(context, listen: false);
    final utils = Utils(context);
    Color color = utils.color;
    return Scaffold(
      body: Center(
        child: ListView(
          padding: EdgeInsets.only(top: 20, bottom: 20),
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RichText(
                text: TextSpan(
                    text: "Hello, ",
                    style: TextStyle(fontSize: 30, color: color),
                    children: [
                      TextSpan(
                          text: "Amar",
                          style: TextStyle(
                              color: isdarkmode.getThemeMode
                                  ? Colors.lightBlueAccent
                                  : Colors.blueGrey),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              print("Amar is pressed");
                            }),
                    ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: TextWidget(
                  text: "amarelali@gmail.com", fontSize: 18, color: color),
            ),
            const Divider(thickness: 2, height: 20),
            _listTiles(
                title: "Address",
                icon: IconlyLight.profile,
                fontSize: 24,
                subtitle: "my address",
                color: color,
                function: () async {
                  await _addressShowAlert();
                }),
            _listTiles(
                title: "Orders",
                icon: IconlyLight.wallet,
                fontSize: 24,
                color: color,
                function: () {
                  GlobalMethods.navigateTo(context: context, routeName: OrdersScreen.routeName);
                }),
            _listTiles(
                title: "Wishlist",
                icon: IconlyLight.heart,
                fontSize: 24,
                color: color,
                function: () {
                  GlobalMethods.navigateTo(context: context, routeName: WishlistScreen.routeName);
                }),
            _listTiles(
                title: "Viewed",
                icon: IconlyLight.show,
                fontSize: 24,
                color: color,
                function: () {}),
            _listTiles(
                title: "Forget password",
                icon: IconlyLight.unlock,
                fontSize: 24,
                color: color,
                function: () {}),
            SwitchListTile(
              secondary: Icon(utils.getTheme
                  ? Icons.dark_mode_rounded
                  : Icons.light_mode_rounded),
              title: TextWidget(
                text: "Theme",
                fontSize: 24,
                color: color,
              ),
              onChanged: (bool value) {
                setState(() {
                  isdarkmode.setThemeMode = value;
                });
              },
              value: isdarkmode.getThemeMode,
            ),
            _listTiles(
                title: "Log out",
                icon: IconlyLight.logout,
                fontSize: 24,
                color: color,
                function: () async {
                  await GlobalMethods.warningDialog(context: context, title: 'Sign out', subtitle: 'Do you want to sign out?', fct: (){});
                }),
          ],
        ),
      ),
    );
  }

  Widget _listTiles(
      {required String title,
      String? subtitle,
      required IconData icon,
      required double fontSize,
      bool isTitle = false,
      required Color color,
      required Function function}) {
    return ListTile(
      leading: Icon(
        icon,
        size: 30.0,
      ),
      title: TextWidget(
        text: title,
        isTitle: isTitle,
        fontSize: fontSize,
        color: color,
      ),
      subtitle: subtitle == null
          ? null
          : Text(
              subtitle,
              style: TextStyle(fontSize: 18),
            ),
      trailing: Icon(IconlyLight.arrow_right_2, size: 25.0),
      onTap: () {
        function();
      },
    );
  }

  Future<void> _addressShowAlert() async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Update"),
            content: TextField(
              // minLines: 5,
              controller: _addressTextEditingController,
              onChanged: (context) {
                print(_addressTextEditingController.text);
              },
              decoration: InputDecoration(hintText: "My Address"),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  print('button pressed');
                },
                child: Text('Update',style: TextStyle(fontSize: 18),),
              )
            ],
          );
        });
  }

}
