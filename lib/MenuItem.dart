import'package:flutter/material.dart';
class MenuItems extends StatelessWidget {
  String menuTitle;
  Icon menuIcon;
  Function handler;

  MenuItems({required this.menuTitle, required this.menuIcon, required this.handler});

  @override
  Widget build(BuildContext context) {
    return
      ListTile(
          title:Text(menuTitle),
          leading:menuIcon,
          trailing:Icon(Icons.arrow_right),
        onTap:(){
            this.handler(context);
            },
      );
  }
}