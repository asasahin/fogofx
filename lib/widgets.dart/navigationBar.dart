import 'package:flutter/material.dart';
import 'package:fogofx/views/my_certificates.dart';
import 'package:fogofx/views/videoPlayer.dart';
import 'package:fogofx/views/favorites.dart';
import 'package:fogofx/views/homepage.dart';
import 'package:fogofx/views/my_account.dart';
import 'package:fogofx/views/my_courses.dart';
import 'package:fogofx/views/settings.dart';
import 'package:fogofx/views/shopping_cart.dart';
import 'package:video_player/video_player.dart';

class CustomNavigationBar extends StatefulWidget {
  static int? currentindex;
  int _currentIndex = currentindex ?? 0;

  @override
  _CustomNavigationBarState createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget._currentIndex,
      onTap: (index) {
        setState(() {
          widget._currentIndex = index;
        });

        if (widget._currentIndex == 0) {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return HomePage();
          }));
        } else if (widget._currentIndex == 1) {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return Favorites();
          }));
        } else if (widget._currentIndex == 2) {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return MyCourses();
          }));
        } else if (widget._currentIndex == 3) {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return MyCertificates();
          }));
        } else if (widget._currentIndex == 4) {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return Settings();
          }));
        }
      },
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Anasayfa"),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favoriler"),
        BottomNavigationBarItem(
            icon: Icon(Icons.video_collection), label: "Eğitimlerim"),
        BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag), label: "Sertifikalarım"),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Hesap"),
      ],
    );
  }
}
