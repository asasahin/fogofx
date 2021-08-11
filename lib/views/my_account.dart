import 'package:flutter/material.dart';
import 'package:fogofx/widgets.dart/navigationBar.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({Key? key}) : super(key: key);

  @override
  _MyAccountState createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Profilim"),
      ),
      bottomNavigationBar: CustomNavigationBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child:
                    Image.network("https://thispersondoesnotexist.com/image")),
            margin: EdgeInsets.all(20),
            height: 100,
            width: 100,
            decoration:
                BoxDecoration(color: Colors.amber, shape: BoxShape.circle),
          ),
          Text(
            "Halit Ayarcı",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
          ),
          Container(
            child: Column(
              children: [
                editListItem(text1: "İsim-Soyisim", text2: "Halit Ayarcı"),
                editListItem(text1: "Email", text2: "qwerty@gmail.com"),
                editListItem(text1: "Telefon Numarası", text2: "05443323422"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container editListItem({text1, text2}) {
    return Container(
      padding: EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height * 0.1,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                spreadRadius: 2,
                blurRadius: 2,
                offset: Offset(0, 2),
                color: Colors.grey[200] ?? Colors.grey)
          ]),
      margin: EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    text1,
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
                  ),
                  Text(
                    text2,
                    style: TextStyle(fontSize: 17),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.edit,
                  size: 35,
                )),
          )
        ],
      ),
    );
  }
}
