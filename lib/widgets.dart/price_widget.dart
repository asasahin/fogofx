import 'package:flutter/material.dart';
import 'package:fogofx/constants.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget({Key? key, this.price = ""}) : super(key: key);

  final String price;

  @override
  Widget build(BuildContext context) {
    double h = Constants.getHeight(context);
    double w = Constants.getWidth(context);

    return Container(
      padding: EdgeInsets.all(5),
      alignment: Alignment.center,
      height: h * 20,
      decoration: BoxDecoration(
        border: Border.all(width: 1),
        // boxShadow: [
        //   BoxShadow(
        //       color: Colors.grey[400]!,
        //       offset: Offset(0, 0.5),
        //       blurRadius: 1,
        //       spreadRadius: 1)
        // ],
        borderRadius: BorderRadius.circular(h * 5),
      ),
      child: Text(
        price,
        style: TextStyle(
            fontSize: h * 8,
            fontWeight: FontWeight.bold,
            color: Colors.deepOrange),
      ),
    );
  }
}
