import 'package:flutter/material.dart';

import 'package:oppknocksapp/models/businessprofileuser.dart';
import 'package:oppknocksapp/utils/business_preferences.dart';
import 'businessprofilewidget.dart';
import 'business_profile_edit.dart';


class BusinessProfile extends StatefulWidget {
  @override
  BusinessProfileState createState() => BusinessProfileState();
}

class BusinessProfileState extends State<BusinessProfile> {
  //final _pages = [];
  @override
  Widget build(BuildContext context) {
    final businessuser = BusinessUserPreferences.bgetUser();
    return Scaffold(
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          const SizedBox(
            height: 24,
          ),
          BusinessProfileWidget(
            businessimagePath: businessuser.businessimagePath,
            businessonClicked: () async {
              await Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) =>
                        EditBusinessProfile()), // might move this later.
              );
              setState(() {});
            },
          ),

          buildbusinessName(businessuser),
          const SizedBox(
            height: 24,
          ),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
        primary: Colors.blueAccent,
        shape: StadiumBorder(),
            ),
              onPressed: () async {
                await Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) =>
                          EditBusinessProfile()), // might move this later.
                );
                setState(() {});
              },
              child: Text("Edit Profile"),
             ),

        

          const SizedBox(
            height: 24,
          ),

          ratingsInfoWidget(),
          //TabBarView(children: children)
          DefaultTabController(
              length: 2,
              child: Column(children: [
                TabBar(
                  tabs: [
                    Tab(text: 'About ' + businessuser.businessName),
                    Tab(text: 'Contact Info')
                  ],
                  labelColor: Colors.blueAccent,
                ),
                Container(
                  height: 300.0,
                  child: TabBarView(
                    children: [
                      buildaboutbusiness(businessuser),
                      buildContactInfo(businessuser),
                    ],
                  ),
                ),
              ])),
        ],
      ),
    );
  }

  Widget buildbusinessName(BusinessUser businessuser) => Column(
        children: [
          Text(businessuser.businessName, style: TextStyle(fontSize: 24)),
        ],
      );

  Widget buildaboutbusiness(BusinessUser businessuser) => Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 16,
            ),
            Text("About" + ":", style: TextStyle(fontSize: 20)),
            SizedBox(
              height: 2,
            ),
            Text(businessuser.businessBio, style: TextStyle(fontSize: 20)),
            SizedBox(
              height: 16,
            ),
          ],
        ),
      );

  Widget ratingsInfoWidget() => Container(
        //title: 'Reviews',
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
              5,
              (index) => Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 40,
                  )),
        ),
      );

  Widget buildContactInfo(BusinessUser businessuser) => Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Email" + ": " + businessuser.businessEmail,
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 15),
          Text(
            "Phone Number" + ": " + businessuser.businessPhoneNumber,
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 15),
          Text("Address" + ": " + businessuser.businessAddress,
              style: TextStyle(fontSize: 20)),
        ],
      ));
}
