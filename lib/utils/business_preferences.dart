import 'dart:convert';
import 'package:oppknocksapp/models/businessprofileuser.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BusinessUserPreferences {
  static late SharedPreferences _businesspreferences;

  static const _bkeyUser = 'buser'; // store the information of the user.

  static const mybusinessUser = BusinessUser(
    businessimagePath:
        'https://images-ext-1.discordapp.net/external/zA_LxTx-h6kXvMwCfp7p4ASh5gS1NFjBALqDLnw3WO0/%3Fformat%3D1500w/http/static1.squarespace.com/static/60bc2ca8171032105436b94f/t/60c2b7d58f342c1eed27ee26/1623373784403/4.png',
    businessName: "Business name",
    businessAddress: "Address:1024 P.O.BOX",
    businessBio: 'My Business Bio',
    businessEmail: 'businessname@example.com',
    businessPhoneNumber: '(123)456-789',
  );
  static Future init() async =>
      _businesspreferences = await SharedPreferences.getInstance();

  static Future bsetUser(BusinessUser businessuser) async {
    final json = jsonEncode(businessuser.toJson());
// key:_keyUser
//value:json

/*
final CollectionReference businessusers=
 FirebaseFirestore.instance.collection('businessusers');
businessusers.add(businessuser.toJson()); // hopefully this worked?

*/
    await _businesspreferences.setString(_bkeyUser, json);
  }
static BusinessUser bgetUser(){
  final bjson= _businesspreferences.getString(_bkeyUser);
  return bjson ==null? mybusinessUser :BusinessUser.fromJson(jsonDecode(bjson));
}

}
