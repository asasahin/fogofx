import 'package:flutter/material.dart';
import 'package:fogofx/constants.dart';
import 'package:fogofx/views/firstpage.dart';
import 'package:fogofx/views/my_courses.dart';
import 'package:video_player/video_player.dart';
import 'views/videoPlayer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FogoFx',
      theme: ThemeData(
          textTheme: TextTheme(
            bodyText2: TextStyle(fontSize: 14.0, color: Constants.themeColor1),
          ),
          appBarTheme: AppBarTheme(
              centerTitle: true,
              actionsIconTheme: IconThemeData(),
              color: Constants.themeColor1,
              iconTheme: IconThemeData(color: Colors.white),
              textTheme: TextTheme(
                  headline6: TextStyle(color: Colors.white, fontSize: 20)),
              titleTextStyle: TextStyle(backgroundColor: Colors.amber)),
          primarySwatch: Colors.amber,
          primaryColor: Colors.amber),
      home: MyHomePage(),
    );
  }
}

//Color.fromRGBO(225, 177, 118, 0)
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool firstRun = false;

  notFirstRun() async {
    firstRun = true;

    await Future.delayed(const Duration(seconds: 3));

    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return FirstPage();
    }));
  }

  @override
  Widget build(BuildContext context) {
    if (!firstRun) {
      notFirstRun();
    }

    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      child: Image.asset("images/FOGOFX-01.jpg"),
    ));
  }

  TextButton textbutton(BuildContext context, {page, icon, color}) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return page;
        }));
      },
      child: Icon(icon, color: Colors.black),
    );
  }
}
