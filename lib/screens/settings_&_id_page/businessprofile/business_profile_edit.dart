import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:oppknocksapp/models/businessprofileuser.dart';
import 'package:oppknocksapp/screens/settings_&_id_page/athlete_profile/appbar_widget.dart';
import 'package:oppknocksapp/screens/settings_&_id_page/athlete_profile/button_widget.dart';
import 'package:oppknocksapp/screens/settings_&_id_page/businessprofile/businessprofilewidget.dart';
import 'package:oppknocksapp/screens/settings_&_id_page/businessprofile/textfieldbusiness_widget.dart';
import 'package:oppknocksapp/utils/business_preferences.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class EditBusinessProfile extends StatefulWidget {
  @override
  EditBusinessProfileState createState() => EditBusinessProfileState();
}

class EditBusinessProfileState extends State<EditBusinessProfile> {
  //BusinessUser _users = BusinessUserPreferences.mybusinessUser;

  late BusinessUser _users;

  @override
// for loading stuff
  void initState() {
    super.initState();
    _users = BusinessUserPreferences.bgetUser();
  }

  businesschooseImage(ImageSource bsource) async {
    final bimage = await ImagePicker().getImage(source: bsource);
    if (bimage != null) {
      final bdirectory = await getApplicationDocumentsDirectory();
      final name = basename(bimage.path);
      final imageFile = File('${bdirectory.path}/$name');
      final bnewImage = await File(bimage.path).copy(imageFile.path);
      setState(() => _users =
          _users.copybusinessprofile(businessimagePath: bnewImage.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: appColor1,
      appBar: buildAppBar(context),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 32),
        physics: BouncingScrollPhysics(),
        children: [
          // add images here by tom.
          BusinessProfileWidget(
            businessimagePath: _users.businessimagePath,
            businessEdit: true,
            businessonClicked: () async {
              if (Platform.isIOS) {
                showCupertinoModalPopup(
                    context: context,
                    builder: (context) => CupertinoActionSheet(actions: [
                          CupertinoActionSheetAction(
                              child: Text('Camera'),
                              onPressed: () {
                                Navigator.pop(context);
                                businesschooseImage(ImageSource.camera);
                              }),
                          CupertinoActionSheetAction(
                              child: Text('Gallery'),
                              onPressed: () {
                                Navigator.pop(context);
                                businesschooseImage(ImageSource.gallery);
                              }),
                        ]));
              }
              // for android devices.
              else {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => Wrap(
                    children: [
                      ListTile(
                          leading: Icon(Icons.camera_alt),
                          title: Text('Camera'),
                          onTap: () {
                            Navigator.pop(context);
                            businesschooseImage(ImageSource.camera);
                          }),
                      ListTile(
                          leading: Icon(Icons.photo_album),
                          title: Text('Gallery'),
                          onTap: () {
                            Navigator.pop(context);
                            businesschooseImage(ImageSource.gallery);
                          }),
                    ],
                  ),
                );
              }
            },
          ),
          const SizedBox(height: 24),
          BusinessFieldWidget(
              label: "Business Name",
              text: _users.businessName,
              onChanged: (businessName) => _users =
                  _users.copybusinessprofile(businessName: businessName)),
          BusinessFieldWidget(
              label: "Business Address",
              text: _users.businessAddress,
              onChanged: (businessAddress) => _users =
                  _users.copybusinessprofile(businessAddress: businessAddress)),

          BusinessFieldWidget(
              label: "Business Email",
              text: _users.businessEmail,
              onChanged: (businessEmail) => _users =
                  _users.copybusinessprofile(businessEmail: businessEmail)),
          BusinessFieldWidget(
              label: "Business Phone Number",
              text: _users.businessPhoneNumber,
              onChanged: (businessPhoneNumber) => _users =
                  _users.copybusinessprofile(
                      businessPhoneNumber: businessPhoneNumber)),
          BusinessFieldWidget(
              label: "Business Bio",
              text: _users.businessBio,
              maxLines: 5,
              onChanged: (businessBio) => _users =
                  _users.copybusinessprofile(businessBio: businessBio)),
          ButtonWidget(
            text: 'Save Changes',
            onClicked: () {
              Map <String,dynamic> data=
              {"name":_users.businessName,
              "email":_users.businessEmail,
               "bio":_users.businessBio,
              };
              FirebaseFirestore.instance.collection("businessUserCollection").add(data);
              BusinessUserPreferences.bsetUser(_users);
              // create a firebase data to do a collection of businessisers. 
              //BusinessUserPreferences.bsetUser(_users);
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }

// can just copy from the widget itself.
/*
  Widget _profilepic() {
    return CircleAvatar(
      radius: 50,
      child: Icon(Icons.person),
    );
  }

  Widget _changeProfileButton() {
    return TextButton(
      onPressed: () {}, 
      child: Icon(Icons.add_photo_alternate_sharp));
  }
  // make a tile editing page, just to make look professional for businesses. 
  
  Widget  _businessaddressTile(){
    return ListTile(
      tileColor:Colors.white,
      leading:Icon(Icons.person_pin_circle),
      title:Text('businessAddress'),
    );
}
Widget   _businessemailTile(){
    return ListTile(
      tileColor:Colors.white,
      leading:Icon(Icons.mail),
      title:Text('businessAddress'),
    );
}
Widget   _businessphoneTile(){
    return ListTile(
      tileColor:Colors.white,
      leading:Icon(Icons.phone),
      title:Text('businessAddress'),
    );
}
Widget   _businessbio(){
    return ListTile(
      tileColor:Colors.white,
      leading:Icon(Icons.edit),
      title:TextFormField(
        decoration:
              InputDecoration.collapsed(hintText: "Say something about business"),
              maxLines: null,
      ),
    );
}
*/
  Widget _savechangesbutton() {
    return ElevatedButton(
      onPressed: () {},
      child: Text('Save Changes'),
    );
  }
}
