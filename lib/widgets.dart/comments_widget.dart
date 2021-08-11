import 'package:flutter/material.dart';

import '../constants.dart';
import 'dynamic_list_item.dart';

class CommentsWidget extends StatelessWidget {
  const CommentsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = Constants.getHeight(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        StarIconWidget(),
        StarIconWidget(),
        StarIconWidget(),
        StarIconWidget(),
        StarIconWidget(),
        Text(
          "  " + "4,2 (350.523)",
          style: TextStyle(fontSize: h * 8, color: Colors.black54),
        )
      ],
    );
  }
}
