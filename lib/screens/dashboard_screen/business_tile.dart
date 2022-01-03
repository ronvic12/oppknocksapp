import 'package:flutter/material.dart';
import 'package:oppknocksapp/models/business.dart';

class BusinessTile extends StatelessWidget {
  final Business business;
  BusinessTile({required this.business});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: Card(
            margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
            child: ListTile(
              leading: CircleAvatar(
                  backgroundImage: AssetImage(business.imageURL),
                  radius: 30.0,
                  backgroundColor: Colors.transparent),
              title: Text(business.name),
              subtitle: Text(business.discount),
            )));
  }
}
