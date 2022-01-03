import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:oppknocksapp/shared/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailScreen extends StatefulWidget {
  final DocumentSnapshot item;
  DetailScreen({required this.item});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        backgroundColor: appColor1,
        elevation: 0,
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              //color: Colors.white,
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade400,
                      blurRadius: 4,
                      offset: Offset(5, 6))
                ],
                gradient: new LinearGradient(
                  colors: [appColor1, appColor2],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(4.0, 2.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp,
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.center,
                    child: Image.network(
                      widget.item['img'],
                      width: 300,
                    ),
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
            SizedBox(height: 30),
            Text(
              widget.item["deal"],
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 5),
            Text(widget.item["business"],
                style: TextStyle(
                  fontSize: 16,
                )),
            SizedBox(height: 15),
            Row(
              children: [
                SizedBox(width: 20),
                Text("Description",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    )),
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: <Widget>[
                SizedBox(width: 20),
                Expanded(
                  child: Text(widget.item["detail"],
                      style: TextStyle(
                        fontSize: 15,
                      )),
                ),
              ],
            ),
            SizedBox(height: 20),
            InkWell(
                child: Text('Address',
                    style: TextStyle(
                      color: appColor1,
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                    )),
                onTap: () => launch(widget.item["address"])),
          ],
        ),
      ),
    );
  }
}
