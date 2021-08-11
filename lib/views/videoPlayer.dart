import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fogofx/models/lessonModel.dart';
import 'package:fogofx/service/services.dart';
import 'package:fogofx/widgets.dart/navigationBar.dart';
import 'package:video_player/video_player.dart';

class Videoplayer extends StatefulWidget {
  final VideoPlayerController? videoPlayerController;
  final bool isLoop;
  Videoplayer(
      {@required this.videoPlayerController, @required this.isLoop = true});

  @override
  _VideoplayerState createState() => _VideoplayerState();
}

class _VideoplayerState extends State<Videoplayer> {
  late ChewieController chewieController;

  @override
  void initState() {
    chewieController = ChewieController(
        videoPlayerController:
            widget.videoPlayerController ?? VideoPlayerController.network(""),
        looping: widget.isLoop,
        aspectRatio: 16 / 9,
        autoInitialize: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: CustomNavigationBar(),
        body: Column(
          children: [
            Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Colors.grey[200] ?? Colors.grey,
                    offset: Offset(0, 2),
                    blurRadius: 1,
                    spreadRadius: 1)
              ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              height: MediaQuery.of(context).size.height * 0.37,
              child: Column(
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Chewie(controller: chewieController),
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            Expanded(
                                child: Text(
                              "Yazılımcı Olma Kursu",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            )),
                            Expanded(
                                flex: 1,
                                child: Text(
                                  "Engin Demiroğ",
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                )),
                          ],
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        color: Colors.amber,
                        child: Row(
                          children: [
                            Expanded(
                                child: Text(
                              "Dersler",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )),
                            Expanded(
                                flex: 2,
                                child: Text(
                                  "Eğitim Hakkında",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                )),
                          ],
                        ),
                      )),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Text(
                      "Bölüm 1",
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                  lessonList(context, Services.lessonList1),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Text(
                      "Bölüm 2",
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                  lessonList(context, Services.lessonList2),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Text(
                      "Bölüm 3",
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                  lessonList(context, Services.lessonList3),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container lessonList(BuildContext context, List<LessonModel> list) {
    return Container(
      child: Column(
        children: list
            .map((lesson) => Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey[200] ?? Colors.grey,
                            offset: Offset(0, 2),
                            blurRadius: 1,
                            spreadRadius: 1)
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                          child: Text(
                        lesson.lessonId.toString(),
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      )),
                      Expanded(
                          flex: 5,
                          child: Text(
                            lesson.lessonName,
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          )),
                      Expanded(child: Icon(Icons.download))
                    ],
                  ),
                  margin: EdgeInsets.all(5),
                  height: MediaQuery.of(context).size.height * 0.075,
                ))
            .toList(),
      ),
    );
  }
}

class VideoDisplay extends StatefulWidget {
  late final String videoUrl =
      "https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4";
  @override
  _VideoDisplayState createState() => _VideoDisplayState();
}

class _VideoDisplayState extends State<VideoDisplay> {
  @override
  Widget build(BuildContext context) {
    return Videoplayer(
      isLoop: true,
      videoPlayerController: VideoPlayerController.network(widget.videoUrl),
    );
  }
}
