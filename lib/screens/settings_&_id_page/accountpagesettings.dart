import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:oppknocksapp/shared/constants.dart';


//import 'package:utils/utils.dart';

import 'package:oppknocksapp/screens/settings_&_id_page/settingswidget/icon_widget.dart';


class AccountPage extends StatelessWidget{

  static const keyLanguage="key-language";
  static const keyLocation="key-location";
  static const keyPassword="key-Password";
  static const keyUsername="key-username";
  @override 
  Widget build(BuildContext context) =>SimpleSettingsTile(
    title: "Account Settings",
    subtitle:"Privacy, Security, Password" ,
    leading:IconWidget(icon:Icons.person,color:appColor1),
    child:SettingsScreen(
      title:"Account Settings",
      children:<Widget>[
        buildLanguage(),
        buildLocation(),
        buildUsername(),
        buildPassword(),
        buildPrivacy(context),
        buildSecurity(context),
        buildAccountInfo(context),
      ],
    ),);

    Widget buildLanguage() =>DropDownSettingsTile(title:"Language", 
    settingKey: keyLanguage, 
    selected:1, 
    values: <int,String>{
      1:'English',
      //2:'Spanish'
    },
      onChange: (language){/*NOOP*/},
    );

    Widget buildLocation()=>TextInputSettingsTile(
    title: "Location", 
    settingKey: keyLocation,
    initialValue:"USA",
    onChange:(location){/*NOOP*/},
    );
   
   Widget buildUsername() =>TextInputSettingsTile(
     settingKey:keyUsername ,
     title: "Username",
     
     validator:(String ? username){  // there is an error here
       if (username != null && username.length >3){
         return null;
       }
       return "Username can't be smaller than 4 letters";
     },
     
     borderColor: Colors.blueAccent,
  errorColor: Colors.deepOrangeAccent,
   );
   Widget buildPassword()=>TextInputSettingsTile(
     settingKey: keyPassword,
     title: "Password", 
     obscureText:true,
     //validator:(password)=> password !=null && password.length >=6 ? null : "Enter 6 characters",
     validator: (String ? password){
       if(password != null && password.length>6){
         return null;
       }
       return "Enter 6 characters";
     },
     
     borderColor: Colors.blueAccent,
  errorColor: Colors.deepOrangeAccent,
   );
    Widget buildPrivacy(BuildContext context) => SimpleSettingsTile(
        title: 'Privacy',
        subtitle: '',
        leading: IconWidget(icon: Icons.lock, color: Colors.blue),
        // just reroute it later.
        //onTap:() =>Utils.showSnackBar(context,'Clicked Logout'),
      );
      Widget buildSecurity(BuildContext context) => SimpleSettingsTile(
        title: 'Security',
        subtitle: '',
        leading: IconWidget(icon: Icons.security, color: Colors.red),
        // just reroute it later.
        //onTap:() =>Utils.showSnackBar(context,'Clicked Logout'),
      );
      Widget buildAccountInfo(BuildContext context) => SimpleSettingsTile(
        title: 'Account Info',
        subtitle: '',
        leading: IconWidget(icon: Icons.text_snippet, color: Colors.purple),
        // just reroute it later.
        //onTap:() =>Utils.showSnackBar(context,'Clicked Logout'),
      );
}




/*

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/rendering.dart';
class accountprofile extends StatefulWidget {
  @override
 
accountprofileState createState() =>accountprofileState (); 


}

class accountprofileState extends State<accountprofile>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (listViewContext,index){
          return Container
          (
            color: Colors.lightBlue,
            height:50,
            width:100,
            child: Text('index $index'),
          );
        },
        itemCount:5,
      ),
    );
  }
}
*/