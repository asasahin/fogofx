import 'package:flutter/material.dart';

import '../constants.dart';

class AddToFavOrCartWidget extends StatelessWidget {
  AddToFavOrCartWidget({
    Key? key,
    this.index,
    this.onTap,
    this.text = "",
  }) : super(key: key);

  final index;
  dynamic onTap;

  String text;

  @override
  Widget build(BuildContext context) {
    double h = Constants.getHeight(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        
        margin: EdgeInsets.only(top: h * 0.5),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.grey[400]!,
                  offset: Offset(0, 0.5),
                  blurRadius: 1,
                  spreadRadius: 1)
            ],
            color: Constants.themeColor1,
            borderRadius: BorderRadius.circular(5)),
        alignment: Alignment.center,
        height: h * 13,
        child: Text(
          text,
          style: TextStyle(
            fontSize: h * 7,
            color: Colors.white,
          ),
          //  ),
        ),
      ),
    );
  }
}
