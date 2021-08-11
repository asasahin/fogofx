import 'package:flutter/material.dart';
import 'package:fogofx/service/apiService.dart';
import 'package:fogofx/views/sign_in.dart';
import 'package:fogofx/views/sign_up.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.6,
          margin: EdgeInsets.symmetric(vertical: 170),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  //  height: MediaQuery.of(context).size.height * 0.3,
                  child: Image.asset("images/FOGOFX LOGO-1.jpg"),
                ),
              ),
              buttons(context,
                  buttonText: "KAYDOL",
                  boxColor: Colors.orange,
                  icon: Icons.mail_sharp,
                  page: SignUpScreen()),
              buttons(context,
                  buttonText: "GİRİŞ YAP",
                  boxColor: Color.fromRGBO(80, 138, 152, 0.9),
                  icon: FontAwesomeIcons.signInAlt,
                  page: SignInScreen()),
              buttons(context,
                  buttonText: "GOOGLE İLE KAYDOL",
                  boxColor: Color.fromRGBO(81, 134, 236, 1.0),
                  icon: FontAwesomeIcons.google,
                  page: SignInScreen()),
              buttons(context,
                  buttonText: "FACEBOOK İLE KAYDOL",
                  boxColor: Color.fromRGBO(59, 89, 152, 1.0),
                  icon: FontAwesomeIcons.facebook,
                  page: SignInScreen()),
            ],
          ),
        ),
      ),
    );
  }

  Expanded buttons(BuildContext context, {buttonText, boxColor, icon, page}) {
    return Expanded(
      child: TextButton(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.80,
            height: MediaQuery.of(context).size.height * 0.05,
            decoration: BoxDecoration(
                color: boxColor, borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                Expanded(
                  child: Icon(
                    icon,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    buttonText,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return page;
            }));
          }),
    );
  }
}
