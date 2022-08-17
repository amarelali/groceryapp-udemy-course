import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/darkTheme_provider.dart';

class Utils {
  BuildContext context;
  Utils(this.context);

  bool get getTheme => Provider.of<DarkThemeProvider>(context, listen: false).getThemeMode;
  Color get color => getTheme ? Colors.white : Colors.black;

  Size get screenSize => MediaQuery.of(context).size;
}