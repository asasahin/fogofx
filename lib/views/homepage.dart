import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fogofx/constants.dart';
import 'package:fogofx/models/courseModel.dart';
import 'package:fogofx/service/services.dart';
import 'package:fogofx/views/categoryContent.dart';
import 'package:fogofx/views/course_detail.dart';
import 'package:fogofx/views/shopping_cart.dart';
import 'package:fogofx/widgets.dart/addTo_FavOrCart_widget.dart';
import 'package:fogofx/widgets.dart/comments_widget.dart';
import 'package:fogofx/widgets.dart/dynamic_list_item.dart';
import 'package:fogofx/widgets.dart/navigationBar.dart';
import 'package:fogofx/widgets.dart/price_widget.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  List<String> mainCategories = [
    "Antropoloji",
    "Bankacılık ve Sigortacılık",
    "Beslenme ve Diyetetik",
    "Bilgisayar Mühendisliği",
    "Hukuk",
    "Antropoloji",
    "Bankacılık ve Sigortacılık",
    "Beslenme ve Diyetetik",
    "Bilgisayar Mühendisliği",
    "Hukuk",
    "Antropoloji",
    "Bankacılık ve Sigortacılık",
  ];
  List<String> subCategories = [
    "Antropoloji",
    "Bankacılık ve Sigortacılık",
    "Beslenme ve Diyetetik",
    "Bilgisayar Mühendisliği",
    "Hukuk",
  ];

  String mainTitle = "Kategoriler";
  String subMainTitle = "Bilgisayar Mühendisliği";

  List<String> drawerListItems = [];
  String drawerTitle = "";

  Widget drawerWidget = MainDrawerWidget();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    CustomNavigationBar.currentindex = 0;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: CustomNavigationBar(),
        drawer: MainDrawerWidget(
          list: mainCategories,
          title: mainTitle,
        ),
        endDrawer: SubDrawerWidget(
          title: subMainTitle,
          list: subCategories,
        ),
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: size.height * 86 / 812,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications),
            color: Colors.white,
            iconSize: 35,
          ),
          backgroundColor: Constants.themeColor1,
          title: Text(
            Constants.homepageText,
            style: TextStyle(color: Colors.white, fontSize: 40),
          ),
          actions: [
            IconButton(
                color: Colors.white,
                iconSize: 35,
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return ShoppingCart();
                  }));
                },
                icon: Icon(
                  Icons.shopping_cart_outlined,
                ))
          ],
        ),
        body: Builder(
          builder: (context) => SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: size.width * 337 / 375,
                  height: size.height * 34 / 812,
                  margin: EdgeInsets.symmetric(
                    vertical: 15,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        child: Icon(
                          Icons.menu,
                          color: Constants.themeColor1,
                          size: size.height * 35 / 812,
                        ),
                        onTap: () {
                          setState(() {
                            drawerTitle = mainTitle;
                            drawerListItems = mainCategories;
                          });
                          Scaffold.of(context).openDrawer();
                        },
                      ),
                      Container(
                        height: size.height * 34 / 812,
                        width: size.width * 286 / 375,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                                width: 1, color: Constants.themeColor1)),
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              icon: Icon(
                                Icons.search,
                                size: size.height * 17 / 812,
                                color: Constants.themeColor1,
                              ),
                              hintText: "Arama yap..."),
                        ),
                      )
                    ],
                  ),
                ),
                CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    // enlargeCenterPage: true,
                    //scrollDirection: Axis.vertical,
                    onPageChanged: (index, reason) {
                      setState(
                        () {
                          _currentIndex = index;
                        },
                      );
                    },
                  ),
                  items: Constants.bannerImageList
                      .map(
                        (item) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            margin: EdgeInsets.only(
                              top: 10.0,
                              bottom: 10.0,
                            ),
                            elevation: 6.0,
                            shadowColor: Colors.redAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30.0),
                              ),
                              child: Stack(
                                children: [
                                  Image.network(
                                    item,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                  ),
                                  Container(
                                    alignment: Alignment.bottomCenter,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: Constants.bannerImageList
                                          .map((urlOfItem) {
                                        int index = Constants.bannerImageList
                                            .indexOf(urlOfItem);
                                        return Container(
                                          width: 10.0,
                                          height: 10.0,
                                          margin: EdgeInsets.symmetric(
                                              vertical: 10.0, horizontal: 2.0),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: _currentIndex == index
                                                ? Color.fromRGBO(0, 0, 0, 0.8)
                                                : Color.fromRGBO(0, 0, 0, 0.3),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.all(10),
                  child: Text(
                    "Size Özel",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 21,
                        color: Constants.themeColor1),
                  ),
                ),
                coursesListView(context),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.all(10),
                  child: Text(
                    "Size Özel",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 21),
                  ),
                ),
                coursesListView(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container coursesListView(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var h = MediaQuery.of(context).size.height / 812 * 1.25;
    var w = MediaQuery.of(context).size.width / 375 * 1.25;

    return Container(
      height: h * 270,
      child: ListView.builder(
          itemCount: Services.myCourses.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return CourseDetail(
                    courseModel: Services.myCourses[index],
                    index: index,
                  );
                }));
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: w * 10),
                width: w * 191,
                height: h * 250,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(h * 21),
                      child: Container(
                        width: w * 191,
                        child: Image.network(
                            Services.myCourses[index].courseImage),
                      ),
                    ),
                    SizedBox(
                      height: h * 35,
                      child: Text(
                        Services.myCourses[index].courseName,
                        style: TextStyle(
                            fontSize: h * 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      height: h * 12,
                      child: Text(
                        Services.myCourses[index].teacher,
                        style:
                            TextStyle(fontSize: h * 11, color: Colors.black54),
                      ),
                    ),
                    SizedBox(
                      height: h * 12,
                      child: CommentsWidget(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        PriceWidget(
                          price: "36,99 ₺",
                        ),
                        // Expanded(
                        //   child: Container(
                        //     margin: EdgeInsets.only(left: w * 3),
                        //     height: h * 52,
                        //     child: Column(
                        //       children: [
                        //         Expanded(
                        //           child: AddToFavOrCartWidget(
                        //             index: index,
                        //             text: !Services.myCourses[index].isAddedToCart
                        //                 ? "Sepete Ekle"
                        //                 : "Sepetten Çıkar",
                        //             onTap: () {
                        //               if (!Services
                        //                   .myCourses[index].isAddedToCart) {
                        //                 setState(() {
                        //                   Services.addToCart(index);
                        //                 });
                        //               } else {
                        //                 setState(() {
                        //                   Services.removeFromCart(index);
                        //                 });
                        //               }
                        //             },
                        //           ),
                        //         ),
                        //         Expanded(
                        //           child: AddToFavOrCartWidget(
                        //             index: index,
                        //             text: !Services.myCourses[index].isAddedToFav
                        //                 ? "Favorilere Ekle"
                        //                 : "Favorilerden Çıkar",
                        //             onTap: () {
                        //               if (!Services
                        //                   .myCourses[index].isAddedToFav) {
                        //                 setState(() {
                        //                   Services.addToFav(index);
                        //                 });
                        //               } else {
                        //                 setState(() {
                        //                   Services.removeFromFavorites(index);
                        //                 });
                        //               }
                        //             },
                        //           ),
                        //         )
                        //       ],
                        //     ),
                        //   ),
                        // ),

                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.favorite_border),
                          iconSize: 35,
                          color: Colors.red,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}

class MainDrawerWidget extends StatelessWidget {
  const MainDrawerWidget({
    Key? key,
    this.title = "",
    this.list = const [],
  }) : super(key: key);

  final List<String> list;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.grey[300],
        child: Column(
          children: [
            Container(
                color: Constants.themeColor2,
                child: ListTile(
                  title: Center(child: Text(title)),
                )),
            ListView.builder(
                shrinkWrap: true,
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return DrawerMainCategoryItem(
                    text: list[index],
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return CategoryContent(
                          text: list[index],
                        );
                      }));

                      // Scaffold.of(context).openEndDrawer();
                    },
                  );
                }),
          ],
        ),
      ),
    );
  }
}

class SubDrawerWidget extends StatelessWidget {
  const SubDrawerWidget({
    Key? key,
    this.title = "",
    this.list = const [],
  }) : super(key: key);

  final List<String> list;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.grey[300],
        child: Column(
          children: [
            Container(
                color: Constants.themeColor2,
                child: ListTile(
                  title: Center(child: Text(title)),
                )),
            ListView.builder(
                shrinkWrap: true,
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return DrawerMainCategoryItem(
                    text: list[index],
                    onTap: () {},
                  );
                }),
          ],
        ),
      ),
    );
  }
}

class DrawerMainCategoryItem extends StatelessWidget {
  const DrawerMainCategoryItem({Key? key, this.text = "", this.onTap})
      : super(key: key);
  final String text;
  final onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2),
      color: Colors.white,
      child: ListTile(
        onTap: onTap,
        title: Text(text),
        trailing: Icon(Icons.arrow_forward),
      ),
    );
  }
}
