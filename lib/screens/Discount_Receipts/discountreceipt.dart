import 'package:flutter/material.dart';
import 'package:oppknocksapp/models/athleteprofileuser.dart';
import 'package:oppknocksapp/models/okuser.dart';
import 'package:oppknocksapp/services/dbcollection.dart';
import 'package:oppknocksapp/utils/user_preferences.dart';
import 'package:provider/provider.dart';

class DiscountRecipts extends StatefulWidget {
  @override
  DiscountReciptsState createState() => DiscountReciptsState();
}

class DiscountReciptsState extends State<DiscountRecipts> {
  
  @override
  Widget build(BuildContext context) {
    final receiptuser = UserPreferences.getUser(); //change to getUser later
  final uidusers=Provider.of<OKUser?>(context); 
    
    
    return StreamBuilder<AthleteUser>(
stream: DatabaseCollectionService(uid: uidusers!.uid).userData,

    builder: (context, snapshot) {
    return Scaffold(
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          buildreceiptbackground(),
          buildReceiptName(receiptuser), 
          buildReceiptresult(),
          //buildthankyoureceipt(),
        ],
      ),
    );
    }
    );
  }

Widget buildreceiptbackground()=> Stack(
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
);
  Widget buildReceiptName(AthleteUser receiptuser) => Container(
        //height: MediaQuery.of(context).size.height,
        //width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(20.0),
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
            Text(receiptuser.name,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, color: Colors.black)),
            Text(
              receiptuser.college,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: Colors.lightBlue),
            ),
             Text(
              receiptuser.sports,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: Colors.lightBlue),
            ),
             Text(
              receiptuser.username,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: Colors.lightBlue),
            ),
            
          ],

        ),
      );

Widget buildReceiptresult() => Container(
        //height: MediaQuery.of(context).size.height,
        //width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          // need to insert database here. 
          children: <Widget>[
            Text(
              "DISCOUNT USED",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 35, color: Colors.lightBlue),
            ),
            Container(
                width: 200,
                height: 200,
                margin: EdgeInsets.all(25),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                      image: AssetImage('assets/images/Ali_Baba.png'),
                      fit: BoxFit.fill),
                )),
                //need firebase here.
                
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






/*
      Widget  buildReceiptresult() =>Container(
         height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[ 
          Text(
              "DISCOUNT USED",
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
          ],),

          */
      
}
/*
class DiscountRecipts extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
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
          // have  a new widget build around here.
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

    
}
*/