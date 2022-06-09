import 'package:flutter/material.dart';

import '../my_flutter_app_icons.dart';

class Platforms {
  static String macDesktop = "macDesktop";
  static String windowsDesktop = "windowsDesktop";
  static String linuxDesktop = "linuxDesktop";
  static String web = "web";
  static String android = "android";
  static String ios = "ios";
}

Color primaryColor = HexColor("#0972A9");
Color dashboardBG = HexColor("#D2F7FF");
Color dashboardSecond = HexColor("#F6FAFF");

Color headerDarkBG = HexColor("#034779");
Color headerLightBG = HexColor("#0A75AD");
Color headerButtonBG = HexColor("#40648E");
Color countTitleColor = HexColor("#343434");

const whiteColor = Colors.white;
double defaultPadding = 20.0;
const padding_10 = 10.0;

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

String safeString(str) {
  String st = str != null ? str.toString() : '';
  return st;
}

// !TODO Page Navigation
pushTo(BuildContext context, page) async {
  await Navigator.of(context).pushNamed(page);
}

pushWithData(BuildContext context, page, Object data) async {
  await Navigator.of(context).pushNamed(page, arguments: data);
}

popToBack(BuildContext context) async {
  Navigator.of(context).pop();
}

pushAndReplace(BuildContext context, page) {
  Navigator.of(context).pushReplacement(
      new MaterialPageRoute(builder: (BuildContext context) => page));
}

List dashboardCount = [
  {
    "icon": MyFlutterApp.custom_list_solid,
    "title": "No Of Survey's",
    "totalCount": "20,0000"
  },
  {
    "icon": MyFlutterApp.custom_users_solid,
    "title": "No of Active Survey's",
    "totalCount": "150"
  }
];
