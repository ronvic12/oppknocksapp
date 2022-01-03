import 'package:flutter/material.dart';

import 'package:oppknocksapp/models/athleteprofileuser.dart';
import 'package:oppknocksapp/models/okuser.dart';
import 'package:oppknocksapp/services/dbcollection.dart';
import 'package:oppknocksapp/shared/constants.dart';
import 'package:oppknocksapp/utils/user_preferences.dart';
import 'package:provider/provider.dart';
import 'athlete_profile_widget.dart';

// Student athlete Profile Page
class Profile extends StatefulWidget {
  @override
  ProfileState createState() => ProfileState();
}

class ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.getUser(); // in able to update the information
    final users =
        Provider.of<OKUser?>(context); // This has the uid in users.uid

    return StreamBuilder<AthleteUser>(
        stream: DatabaseCollectionService(uid: users!.uid).userData,
        builder: (context, snapshot) {
          // update with new data from database
          if (snapshot.hasData) {
            UserPreferences.setUser(snapshot.data!);
          }

          return Scaffold(
            body: ListView(physics: BouncingScrollPhysics(), children: [
              const SizedBox(
                height: 24,
              ),
              Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius:70,
                    backgroundColor: appColor1,
                 child:AthleteProfileWidget(
                    imagePath: user.imagePath,
                    // ASYNC, AWAIT AND SETSTATE ARE BIG FACTOR FOR UPDATING THE DATA.
                    onClicked: () async {},
                  ),
                ),



                ],
              ),
              buildName(user),
              buildbio(user),
              SizedBox(height: 120),
              Column(
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                      child: Text(
                    "Scan the QR code to sign up an athlete or business!",
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  )),
                  Image.asset("assets/images/sign_up.png"),
                ],
              ),
              SizedBox(height: 50),
            ]),
          );
        });
  }

  Widget buildName(AthleteUser user) => Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(user.name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
          SizedBox(height: 5),
          Text(
            user.username,
            style: TextStyle(color: appColor1, fontSize: 20),
          ),
          SizedBox(height: 5),
          Text(
            user.sports,
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
          SizedBox(height: 5),
          Text(
            user.college,
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
        ],
      ));

  Widget buildbio(AthleteUser user) => Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Bio",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                )),
            Text(
              user.bio,
              style: TextStyle(fontSize: 18, height: 1.4),
            )
          ],
        ),
      );
}


/*
  Widget Advertisementtitle(AthleteUser user) => Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              user.name + " Recently Visited Stores",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: HexColor("#1A3F65")),
            ),
            SizedBox(
              height: 15.0,
            ),
          ],
        ),
      );
  Widget buildAdvertisement(AthleteUser user) => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        color: HexColor("#44ADD0"),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 15.0,
            ),
            CarouselSlider(
              options: CarouselOptions(
                height: 180.0,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
                /*
                onTap:GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                      builder: (context) => AthleteAdPage(),
                    ),
                    );
              },
            ),
            */
              ),
              //onPressed:Navigator.push(context, new MaterialPageRoute(builder: (context) => UsernameAndPassword(),));
              items: [
                Container(
                  margin: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: AssetImage("assets/images/Ali_Baba.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Ali Baba Cafe",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          'Lorem Ipsum is simply dummy text use for printing and type script',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: AssetImage("assets/images/Davis_Creamery.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Davis Creamery",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          'Lorem Ipsum is simply dummy text use for printing and type script',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      );

  GestureDetector SeeAlloptions(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            new MaterialPageRoute(
              builder: (context) => AthleteAdPage(),
            ));
      },
      child: Row(
        children: [
          SizedBox(height: 2),
          Text(title,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.lightBlue[600])),
        ],
      ),
    );
  }

*/

/*
class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // create widget layout here, then do it in order.
    Widget AthleteProfileSection = Expanded(
      //height: MediaQuery.of(context).size.height,
      //width: MediaQuery.of(context).size.width,
      //padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            "Student Athlete",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 35, color: Colors.lightBlue),
          ),
          Container(
              width: 200,
              height: 200,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage('assets/images/athleteprof.jpg'),
                    fit: BoxFit.fill),
              )),
          SizedBox(height: 10),
          Text("Orlando Ornelas",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, color: Colors.black)),
          Text(
            "UC Davis Aggies",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, color: Colors.lightBlue),
          ),
          Text(
            "Football - Reciever",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, color: Colors.lightBlue),
          ),
          Text(
            "Username: @OrlandoOrnelas",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.lightBlue),
          ),
          SizedBox(
            height: 60,
          ),
          Text(
            "Discount Used",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 35, color: Colors.lightBlue),
          ),
          Container(
              width: 200,
              height: 200,
              //margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/Ali_Baba.png'),
                    fit: BoxFit.fill),
              )),
          SizedBox(height: 10),
          Text("Ali Baba Cafe",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, color: Colors.black)),
          Text(
            "Breakfast Burrito:\$2.50 off",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, color: Colors.lightBlue),
          ),
          Text(
            "Data Used:6/23",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, color: Colors.lightBlue),
          ),
        ],
      ),
    );

    return Scaffold(
      
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Image.asset(
                'assets/images/athprofbackground.png',
                width: 600,
                height: 240,
                fit: BoxFit.cover,
              ),
              Container(
                alignment: Alignment.bottomCenter,
                child:Text(
                'Discount Receipt',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 38.0),
              ),),
              
            ],
          ),
          AthleteProfileSection,
          //DiscountProfSection
        ],
      ),
    );
  }
}


*/


//use this later if needed
/*await Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) =>
                              EditAthleteProfile()), // might move this later.
                    );
                    setState(() {});*/



                    //for v3

                    /*
            Row(
              children: [
                buildbio(user),
              ],
            ),
            */
    /*
            Row(
              mainAxisAlignment: MainAxisAlignment.center, 
              children: [
              ElevatedButton(
                onPressed: () async {
                  await Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) =>
                            EditAthleteProfile()), // might move this later.
                  );
                  setState(() {});
                },
                child: Text("Edit Profile"),
                style: ElevatedButton.styleFrom(
                  padding:EdgeInsets.symmetric(horizontal: 60),
                  primary: appColor1,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
              ),
            ]),
    */
          /*
        Divider(thickness: 3,color: Colors.black,),
            DefaultTabController(
                length: 3,
                child: Column(
                  children: [
                    TabBar(
                      tabs: [
                        Tab(text: 'Overview'),
                        Tab(text: 'Linked Accounts'),
                        Tab(
                          text: 'Oppurtunity Points',
                        )
                      ],
                      labelColor: appColor1,
                    ),
                    Divider(thickness: 3,color: Colors.black,),
                    Container(
                      height: 300.0,
                      child: TabBarView(
                        children: [
                          Overview(),
                          MediaAccount(),
                          Points()
                        ],
                      ),
                    ),
                  ],
                )),
    */
            //Advertisementtitle(user),
            //buildAdvertisement(user),
            //SeeAlloptions(context, "See All"),