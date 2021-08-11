import 'package:flutter/material.dart';
import 'package:fogofx/constants.dart';
import 'package:fogofx/views/sign_in.dart';
import 'package:percent_indicator/percent_indicator.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool? checkboxvalue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Kaydol",
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
                                    label: "İsim ve Soyisim",
                                    inputType: TextInputType.name),
                                textInputs(
                                    icon: Icons.phone,
                                    label: "Telefon",
                                    inputType: TextInputType.visiblePassword),
                                textInputs(
                                    icon: Icons.mail,
                                    label: "Eposta",
                                    inputType: TextInputType.visiblePassword),
                                textInputs(
                                    icon: Icons.password,
                                    label: "Şifre",
                                    inputType: TextInputType.visiblePassword),
                                textInputs(
                                    icon: Icons.code,
                                    label: "Referans Kodu",
                                    inputType: TextInputType.visiblePassword),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(20),
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
                            "Üyelik koşullarını kabul ediyorum",
                            style: TextStyle(fontSize: 17),
                          )),
                        ],
                      ),
                    ),
                    buttons(context,
                        buttonText: "KAYDOL",
                        boxColor: Constants.themeColor2,
                        page: SignInScreen()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Hesabınız varsa",
                          style: TextStyle(fontSize: 17),
                        ),
                        TextButton(
                            child: Text(
                              "giriş yapın!",
                              style: TextStyle(fontSize: 17),
                            ),
                            onPressed: () => Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return SignInScreen();
                                })))
                      ],
                    ),
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
