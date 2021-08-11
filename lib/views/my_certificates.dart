import 'package:flutter/material.dart';
import 'package:fogofx/constants.dart';
import 'package:fogofx/models/courseModel.dart';
import 'package:fogofx/service/services.dart';
import 'package:fogofx/views/videoPlayer.dart';
import 'package:fogofx/widgets.dart/dynamic_list_item.dart';
import 'package:fogofx/widgets.dart/navigationBar.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'dart:io';

import 'package:video_player/video_player.dart';

class MyCertificates extends StatefulWidget {
  @override
  _MyCertificatesState createState() => _MyCertificatesState();
}

class _MyCertificatesState extends State<MyCertificates> {
  Object? _value;

  @override
  Widget build(BuildContext context) {
    double h = Constants.getHeight(context);
    double w = Constants.getWidth(context);

    CustomNavigationBar.currentindex = 3;

    return Scaffold(
        bottomNavigationBar: CustomNavigationBar(),
        appBar: AppBar(
          elevation: 3,
          title: Text("Sertifikalarım"),
        ),
        body: SizedBox(
          child: ListView.builder(
              itemCount: Services.myCourses.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {},
                    child: DynamicListItem(
                      h: h,
                      w: w,
                      index: index,
                      elementItem: CertificatesButtonsWidget(),
                      list: Services.myCourses,
                    ));
              }),
        ));
  }
}
