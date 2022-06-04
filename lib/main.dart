import 'package:ebanking_frontend_modile/MenuItem.dart';
import 'package:ebanking_frontend_modile/customerpage.dart';
import 'package:flutter/material.dart';

import 'accountpage.dart';

void main() => runApp(MaterialApp(
  theme: ThemeData(
    appBarTheme: AppBarTheme(color: Colors.deepOrange[200]),
  ),
  home: MyApp(),
));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final menus = [
    {'title': 'Home', 'icon': Icon(Icons.home), 'page': CustomerPage()},
    {'title': 'Setting', 'icon': Icon(Icons.settings), 'page': AccountsPage(CustomerPage)},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ma Banque"),
      ),
      body: Center(
        child: Text("Home Page ..."),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage("./images/banque.jpg"),
                  radius: 30,
                ),
              ),
              decoration: BoxDecoration(
                  gradient:
                  LinearGradient(colors: [Colors.white, Colors.orange])),
            ),
            ...this.menus.map((item) {
              return Column(
                children: <Widget>[
                  Divider(
                    color: Colors.orange),
                  MenuItems(menuTitle:'Home',menuIcon: Icon(Icons.home),handler:(context) {
                    Navigator.pop(context);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CustomerPage()));
                  }),
                  MenuItems(menuTitle:'Account',menuIcon: Icon(Icons.account_circle),handler:(context) {
                    Navigator.pop(context);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AccountsPage(CustomerPage)));
                  })
                ],
              );
            })
          ],
        ),
      ),
    );
  }
}
