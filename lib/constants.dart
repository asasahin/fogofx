import 'package:flutter/material.dart';

class Constants {
  static Color themeColor1 = Color.fromRGBO(80, 138, 152, 1);
  static Color themeColor2 = Color.fromRGBO(242, 185, 107, 1);

  static double getHeight(context) {
    return MediaQuery.of(context).size.height / 406;
  }

  static double getWidth(context) {
    return MediaQuery.of(context).size.width / 375;
  }

  static String homepageText = "fogofx";

  static List<String> bannerImageList = [
    "https://birkarefotograf.com/wp-content/uploads/2018/11/net-keskin-fotograf-cekmek-icin-ipuclari.jpg",
    "https://birkarefotograf.com/wp-content/uploads/2018/11/net-keskin-fotograf-cekmek-icin-ipuclari.jpg",
    "https://birkarefotograf.com/wp-content/uploads/2018/11/net-keskin-fotograf-cekmek-icin-ipuclari.jpg",
  ];
}
