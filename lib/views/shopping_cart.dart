import 'package:flutter/material.dart';
import 'package:fogofx/models/courseModel.dart';
import 'package:fogofx/service/services.dart';
import 'package:fogofx/widgets.dart/addTo_FavOrCart_widget.dart';
import 'package:fogofx/widgets.dart/dynamic_list_item.dart';
import 'package:fogofx/widgets.dart/navigationBar.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../constants.dart';

//todo ürünlere fiyat ekle

class ShoppingCart extends StatefulWidget {
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  @override
  Widget build(BuildContext context) {
    double h = Constants.getHeight(context);
    double w = Constants.getWidth(context);

    CustomNavigationBar.currentindex = 1;

    return Scaffold(
      bottomNavigationBar: CustomNavigationBar(),
      appBar: AppBar(
        title: Text("Sepetim"),
      ),
      body: SizedBox(
        child: ListView.builder(
            itemCount: Services.shoppingList.length,
            itemBuilder: (context, index) {
              return DynamicListItem(
                h: h,
                w: w,
                index: index,
                elementItem: DynamycListItemButtons(
                  buttonWidgetList: [
                    // AddToFavOrCartWidget(
                    //   index: index,
                    //   text: "Sepetten Çıkar ",
                    //   onTap: () {
                    //     setState(() {
                    //       Services.removeFromCart(index);
                    //     });
                    //   },
                    // ),
                    // AddToFavOrCartWidget(
                    //   index: index,
                    //   text: !Services.myCourses[index].isAddedToFav
                    //       ? "Favorilere Ekle"
                    //       : "Favorilerden Çıkar",
                    //   onTap: () {
                    //     // if (!Services.myCourses[index].isAddedToFav) {
                    //     //   setState(() {
                    //     //     Services.addToFav(index);
                    //     //   });
                    //     // } else {
                    //     //   setState(() {
                    //     //     Services.removeFromFavorites(index);
                    //     //   });
                    //     // }
                    //   },
                    //  )
                  ],
                ),
                list: Services.shoppingList,
              );
            }),
      ),
    );
  }
}
