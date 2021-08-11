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

class MyCourses extends StatefulWidget {
  @override
  _MyCoursesState createState() => _MyCoursesState();
}

class _MyCoursesState extends State<MyCourses> {
  Object? _value;

  @override
  Widget build(BuildContext context) {
    double h = Constants.getHeight(context);
    double w = Constants.getWidth(context);

    CustomNavigationBar.currentindex = 2;

    return Scaffold(
        bottomNavigationBar: CustomNavigationBar(),
        appBar: AppBar(
          elevation: 3,
          title: Text("Eğitimlerim"),
        ),
        body: SizedBox(
          child: ListView.builder(
              itemCount: Services.myCourses.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return Videoplayer(
                            videoPlayerController: VideoPlayerController.network(
                                "https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4"),
                            isLoop: true);
                      }));
                    },
                    child: DynamicListItem(
                      h: h,
                      w: w,
                      index: index,
                      elementItem: MyCoursesProgressBarWidget(),
                      list: Services.myCourses,
                    ));
              }),
        ));
  }
}
