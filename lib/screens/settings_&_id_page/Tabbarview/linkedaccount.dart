import 'package:flutter/material.dart';


class MediaAccount extends StatefulWidget{
   @override
   MediaAccountState createState() =>  MediaAccountState();
}

class MediaAccountState extends State<MediaAccount>{
  @override 

  Widget build(BuildContext context){

    return Scaffold(
      
      body:ListView(
         physics: BouncingScrollPhysics(),
        children: [
      Card(
        child:ListTile(
          leading: FlutterLogo(),
          title:Text("Instagram"),
        ),
      ),
      Card(
        child:ListTile(
          leading: FlutterLogo(),
          title:Text("Facebook"),
        ),
      ),
      Card(
        child:ListTile(
          leading: FlutterLogo(),
          title:Text("LinkedIn"),
        ),
      ),
Card(
        child:ListTile(
          leading: FlutterLogo(),
          title:Text("Twitter"),
        ),
      )
      ],),
    );
  }
}