import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:oppknocksapp/shared/constants.dart';
AppBar buildAppBar(BuildContext context) {
  //final icon=CupertinoIcons.moon_stars;
  return AppBar(
    leading: BackButton(),
    backgroundColor: appColor1,
    elevation: 0,
    /*
    actions: [
      IconButton(
        icon: Icon(icon),
        onPressed:() {},
      ),
      
    ],*/
  );
}
