import 'package:flutter/material.dart';
import 'package:fogofx/constants.dart';
import 'package:fogofx/views/homepage.dart';
import 'package:fogofx/views/my_courses.dart';
import 'package:fogofx/views/sign_up.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool? checkboxvalue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Giriş",
          ),
        ),
        body: SafeArea(
          child: SizedBox(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(20),
                      padding: EdgeInsets.only(
                        top: 10,
                      ),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 1), // changes position of shadow
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          Form(
                            child: Column(
                              children: [
                                textInputs(
                                    icon: Icons.account_circle,
                                    label: "Eposta veya Telefon Numarası",
                                    inputType: TextInputType.name),
                                textInputs(
                                    icon: Icons.password,
                                    label: "Şifre",
                                    inputType: TextInputType.visiblePassword),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Row(
                              children: [
                                Checkbox(
                                    value: checkboxvalue,
                                    onChanged: (boolvalue) {
                                      setState(() {
                                        checkboxvalue = boolvalue;
                                      });
                                    }),
                                Expanded(
                                    child: Text(
                                  "Beni Hatırla",
                                  style: TextStyle(fontSize: 17),
                                )),
                              ],
                            ),
                          ),
                          Expanded(
                              child: Text(
                            "Şifremi Unuttum",
                            style: TextStyle(fontSize: 17),
                          ))
                        ],
                      ),
                    ),
                    buttons(context,
                        buttonText: "GİRİŞ YAP",
                        boxColor: Constants.themeColor2,
                        page: HomePage()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Hesabınız yoksa",
                          style: TextStyle(fontSize: 17),
                        ),
                        TextButton(
                            child: Text(
                              "kaydolun!",
                              style: TextStyle(fontSize: 17),
                            ),
                            onPressed: () => Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return SignUpScreen();
                                })))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  Container textInputs({icon, label, inputType}) {
    return Container(
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Icon(icon),
          ),
          Expanded(
            flex: 10,
            child: TextFormField(
              keyboardType: inputType,
              decoration: InputDecoration(
                border: InputBorder.none,
                labelText: label,
                labelStyle: TextStyle(fontSize: 18, color: Colors.black54),
              ),
            ),
          ),
        ],
      ),
    );
  }

  TextButton buttons(BuildContext context, {buttonText, boxColor, icon, page}) {
    return TextButton(
        child: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.80,
          height: MediaQuery.of(context).size.height * 0.05,
          decoration: BoxDecoration(
              color: boxColor, borderRadius: BorderRadius.circular(10)),
          child: Text(
            buttonText,
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return page;
          }));
        });
  }
}
