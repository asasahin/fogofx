import 'package:flutter/material.dart';
import 'package:fogofx/service/services.dart';
import 'package:fogofx/views/homepage.dart';

import '../constants.dart';
import 'comments_widget.dart';
import 'price_widget.dart';

class DynamicListItem extends StatefulWidget {
  DynamicListItem(
      {Key? key, this.h, this.w, this.index, this.elementItem, this.list})
      : super(key: key);

  double? h;
  double? w;
  int? index;
  Widget? elementItem;
  List? list;

  @override
  _DynamicListItemState createState() => _DynamicListItemState();
}

class _DynamicListItemState extends State<DynamicListItem> {
  @override
  Widget build(BuildContext context) {
    return dynamicListItem(widget.h!, widget.w!, widget.index!,
        elementWidget: widget.elementItem, list: widget.list);
  }

  Container dynamicListItem(double h, double w, int index,
      {Widget? elementWidget, List? list}) {
    return Container(
      margin: EdgeInsets.only(
          top: h * 14.5, bottom: h * 14.5, left: w * 14.5, right: w * 14.5),
      height: h * 72,
      width: w * 337,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(h * 10),
            child: Container(
              width: w * 110,
              child: Image.network(list![index].courseImage),
            ),
          ),
          Container(
            height: h * 72,
            width: w * 226,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  list[index].courseName,
                  style: TextStyle(
                      fontSize: h * 8,
                      fontWeight: FontWeight.w800,
                      color: Colors.black),
                ),
                Text(
                  list[index].teacher,
                  style: TextStyle(fontSize: h * 7),
                ),
                CommentsWidget(),
                elementWidget!
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class StarIconWidget extends StatelessWidget {
  const StarIconWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = Constants.getHeight(context);
    return Icon(
      Icons.star,
      size: h * 7.3,
      color: Colors.orange,
    );
  }
}

class DynamycListItemButtons extends StatelessWidget {
  const DynamycListItemButtons({Key? key, this.buttonWidgetList = const []})
      : super(key: key);

  final List<Widget> buttonWidgetList;

  @override
  Widget build(BuildContext context) {
    double h = Constants.getHeight(context);
    double w = Constants.getWidth(context);

    return Container(
      height: h * 29,
      child: Row(
        children: [
          Expanded(
              child: PriceWidget(
            price: "36,99 ₺",
          )),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: w * 2),
              height: h * 27,
              child: Column(
                children: buttonWidgetList,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyCoursesProgressBarWidget extends StatelessWidget {
  const MyCoursesProgressBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = Constants.getHeight(context);
    double w = Constants.getWidth(context);
    return Container(
      child: Column(
        children: [
          Container(
            height: h * 9,
            width: w * 218,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(h * 5),
              color: Constants.themeColor1,
            ),
          ),
          SizedBox(
            height: h * 9,
            width: w * 218,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "50 ders indirildi",
                  style: TextStyle(fontSize: h * 6),
                ),
                Text(
                  "%100 tamamlandı",
                  style: TextStyle(fontSize: h * 6),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CertificatesButtonsWidget extends StatelessWidget {
  const CertificatesButtonsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = Constants.getHeight(context);
    double w = Constants.getWidth(context);
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {},
              child: Container(
                width: w * 67,
                height: h * 14,
                child: Text(
                  "Sertifika Görüntüle",
                  style: TextStyle(fontSize: h * 6.5),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: w * 67,
              height: h * 14,
              child: Text(
                "Sertifika İndir",
                style: TextStyle(fontSize: h * 7),
              ),
            ),
          )
        ],
      ),
    );
  }
}
