import 'package:flutter/material.dart';
import 'package:oppknocksapp/models/business.dart';
import 'package:provider/provider.dart';
import 'package:oppknocksapp/screens/dashboard_screen/business_tile.dart';

class BusinessList extends StatefulWidget {
  const BusinessList({Key? key}) : super(key: key);

  @override
  _BusinessListState createState() => _BusinessListState();
}

class _BusinessListState extends State<BusinessList> {
  @override
  Widget build(BuildContext context) {
    final businesses = Provider.of<List<Business>>(context);

    return ListView.builder(
      itemCount: businesses.length,
      itemBuilder: (context, index) {
        return BusinessTile(business: businesses[index]);
      },
    );
  }
}
