import 'package:flutter/material.dart';
import 'package:fogofx/constants.dart';
import 'package:fogofx/models/courseModel.dart';
import 'package:fogofx/service/services.dart';
import 'package:fogofx/views/settings.dart';
import 'package:fogofx/widgets.dart/addTo_FavOrCart_widget.dart';
import 'package:fogofx/widgets.dart/comments_widget.dart';
import 'package:fogofx/widgets.dart/dynamic_list_item.dart';
import 'package:fogofx/widgets.dart/price_widget.dart';

class CourseDetail extends StatefulWidget {
  const CourseDetail({Key? key, this.courseModel, this.index})
      : super(key: key);

  final CourseModel? courseModel;
  final int? index;

  @override
  _CourseDetailState createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetail> {
  @override
  Widget build(BuildContext context) {
    double h = Constants.getHeight(context);
    double w = Constants.getWidth(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back),
            color: Constants.themeColor1,
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            height: h * 800,
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.courseModel!.courseName,
                  style: TextStyle(fontSize: 17, color: Colors.black),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.courseModel!.teacher,
                      style: TextStyle(color: Colors.black45),
                    ),
                    PriceWidget(
                      price: "36,99 ₺ ",
                    )
                  ],
                ),
                CommentsWidget(),
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(h * 10),
                    child: Container(
                      width: w * 250,
                      child: Image.network(widget.courseModel!.courseImage),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: w * 3),
                      height: h * 50,
                      width: w * 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AddToFavOrCartWidget(
                            text: !widget.courseModel!.isAddedToCart
                                ? "Sepete Ekle"
                                : "Sepetten Çıkar",
                            onTap: () {
                              if (!widget.courseModel!.isAddedToCart) {
                                setState(() {
                                  Services.addToCart(widget.courseModel!);
                                });
                              } else {
                                setState(() {
                                  Services.removeFromCart(widget.courseModel!);
                                });
                              }
                            },
                          ),
                          AddToFavOrCartWidget(
                            text: "Satın Al",
                            onTap: () {},
                          ),
                          AddToFavOrCartWidget(
                            index: widget.index,
                            text:
                                !Services.myCourses[widget.index!].isAddedToFav
                                    ? "Favorilere Ekle"
                                    : "Favorilerden Çıkar",
                            onTap: () {
                              if (!Services
                                  .myCourses[widget.index!].isAddedToFav) {
                                setState(() {
                                  Services.addToFav(widget.courseModel!);
                                });
                              } else {
                                setState(() {
                                  Services.removeFromFavorites(
                                      widget.courseModel!);
                                });
                              }
                            },
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: h * 40,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.play_circle),
                              Text("Kaliteli video içeriği"),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.mobile_screen_share),
                              Text("Mobil ve masaüstü erişim"),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.file_copy),
                              Text("Sertifika"),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Text(
                  "Bu eğitim kimlere göre",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text("◼ Lorem Ipsum is simply dummy"),
                Text("◼ Lorem Ipsum is simply dummy"),
                Text("◼ Lorem Ipsum is simply dummy"),
                Text(
                  "Eğitim Hakkında",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged."),
                Text(
                  "Öğrenecekleriniz",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text("◼ Lorem Ipsum is simply dummy"),
                Text("◼ Lorem Ipsum is simply dummy"),
                Text("◼ Lorem Ipsum is simply dummy"),
                Text(
                  "Müfredat",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Container(
                  padding: EdgeInsets.only(left: w * 5),
                  alignment: Alignment.centerLeft,
                  height: h * 17,
                  width: w * 337,
                  child: Text(
                    "Bölüm 1-Giriş",
                    style: TextStyle(color: Colors.white, fontSize: h * 8),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(h * 11),
                    color: Constants.themeColor1,
                  ),
                ),
                Text(
                  "Yorumlar",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                CourseCommentWidget(),
                CourseCommentWidget(),
                CourseCommentWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CourseCommentWidget extends StatelessWidget {
  const CourseCommentWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = Constants.getHeight(context);
    double w = Constants.getWidth(context);

    return Container(
      margin: EdgeInsets.symmetric(vertical: h * 10),
      height: h * 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Hasan Tarık Yurtseven",
            style: TextStyle(fontSize: h * 7),
          ),
          Row(
            children: [
              StarIconWidget(),
              StarIconWidget(),
              StarIconWidget(),
              StarIconWidget(),
              StarIconWidget(),
              Text("3 ay önce"),
            ],
          ),
          Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged."),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: w * 50, child: Text("1 Yanıt")),
              SizedBox(
                width: w * 150,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Yorum yap"),
                    Text(
                      "Şikayet et",
                      style: TextStyle(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
