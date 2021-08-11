import 'package:flutter/material.dart';
import 'package:fogofx/constants.dart';
import 'package:fogofx/models/courseModel.dart';
import 'package:fogofx/service/services.dart';
import 'package:fogofx/widgets.dart/addTo_FavOrCart_widget.dart';
import 'package:fogofx/widgets.dart/dynamic_list_item.dart';
import 'package:fogofx/widgets.dart/navigationBar.dart';
import 'package:percent_indicator/percent_indicator.dart';

//todo ürünlere fiyat ekle
class Favorites extends StatefulWidget {
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    double h = Constants.getHeight(context);
    double w = Constants.getWidth(context);

    CustomNavigationBar.currentindex = 1;

    return Scaffold(
      bottomNavigationBar: CustomNavigationBar(),
      appBar: AppBar(
        title: Text("Favoriler"),
      ),
      body: SizedBox(
        child: ListView.builder(
            itemCount: Services.favoritesList.length,
            itemBuilder: (context, index) {
              return DynamicListItem(
                h: h,
                w: w,
                index: index,
                elementItem: DynamycListItemButtons(
                  buttonWidgetList: [
                    // AddToFavOrCartWidget(
                    //   index: index,
                    //   text: "Favorilerden Çıkar ",
                    //   onTap: () {
                    //     setState(() {
                    //       Services.removeFromFavorites(index);
                    //     });
                    //   },
                    // ),
                    // AddToFavOrCartWidget(
                    //   index: index,
                    //   text: !Services.myCourses[index].isAddedToCart
                    //       ? "Sepete Ekle"
                    //       : "Sepetten Çıkar",
                    //   onTap: () {
                    //     if (!Services.myCourses[index].isAddedToCart) {
                    //       setState(() {
                    //         Services.addToCart(index);
                    //       });
                    //     } else {
                    //       setState(() {
                    //         Services.removeFromCart(index);
                    //       });
                    //     }
                    //   },
                    // ),
                  ],
                ),
                list: Services.favoritesList,
              );
            }),
      ),
    );
  }
}
