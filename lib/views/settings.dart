import 'package:flutter/material.dart';
import 'package:fogofx/views/my_account.dart';
import 'package:fogofx/views/sign_in.dart';
import 'package:fogofx/widgets.dart/navigationBar.dart';

import '../constants.dart';

class Settings extends StatefulWidget {
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    double h = Constants.getHeight(context);
    double w = Constants.getWidth(context);

    CustomNavigationBar.currentindex = 4;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ayarlar',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: h * 5,
            ),
            AccountSettingsMainTitle(
              title: "Hesap Ayarları",
            ),
            AccountSettingsSubTitle(text: "Hesap bilgileri", page: MyAccount()),
            AccountSettingsSubTitle(text: "Hesap güvenliği", page: MyAccount()),
            AccountSettingsSubTitle(
                text: "Bildirim ayarları", page: MyAccount()),
            AccountSettingsSubTitle(
                text: "İndirme seçenekleri", page: MyAccount()),
            AccountSettingsMainTitle(
              title: "Destek",
            ),
            AccountSettingsSubTitle(text: "Teknik Destek", page: MyAccount()),
            AccountSettingsSubTitle(
                text: "Sıkça Sorulan Sorular", page: MyAccount()),
            AccountSettingsSubTitle(
                text: "Yardım ve Destek", page: MyAccount()),
            AccountSettingsMainTitle(
              title: "Yasal Bilgiler",
            ),
            AccountSettingsSubTitle(
                text: "Kullanım Şartları", page: MyAccount()),
            AccountSettingsSubTitle(
                text: "Gizlilik Politikası", page: MyAccount()),
            AccountSettingsSubTitle(text: "Fogofx Hakkında", page: MyAccount()),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SignInScreen()));
              },
              child: Text(
                "Çıkış Yap",
                style: TextStyle(
                    fontSize: h * 13,
                    fontWeight: FontWeight.bold,
                    color: Constants.themeColor2),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(),
    );
  }
}

class AccountSettingsMainTitle extends StatelessWidget {
  const AccountSettingsMainTitle({Key? key, this.title = ""}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    double h = Constants.getHeight(context);
    double w = Constants.getWidth(context);
    return Container(
      padding: EdgeInsets.only(left: w * 5),
      alignment: Alignment.centerLeft,
      height: h * 29,
      width: w * 337,
      child: Text(
        title,
        style: TextStyle(color: Colors.white, fontSize: h * 11),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(h * 11),
        color: Constants.themeColor1,
      ),
    );
  }
}

class AccountSettingsSubTitle extends StatelessWidget {
  const AccountSettingsSubTitle({
    this.page,
    this.text = "",
    Key? key,
  }) : super(key: key);

  final page;
  final String text;

  @override
  Widget build(BuildContext context) {
    double h = Constants.getHeight(context);
    double w = Constants.getWidth(context);

    return Center(
      child: InkWell(
        onTap: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => page)),
        child: Container(
          padding: EdgeInsets.only(left: w * 5),
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.symmetric(vertical: h * 1),
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: Constants.themeColor1),
            borderRadius: BorderRadius.circular(10),
          ),
          height: h * 19,
          width: w * 310,
          child: Text(
            text,
            style: TextStyle(fontSize: h * 8, color: Constants.themeColor1),
          ),
        ),
      ),
    );
  }
}
