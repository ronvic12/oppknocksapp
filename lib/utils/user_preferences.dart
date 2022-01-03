import 'dart:convert';
import 'dart:async';
import 'dart:core';
import 'package:oppknocksapp/models/athleteprofileuser.dart';
import 'package:shared_preferences/shared_preferences.dart';

//import 'dart:io';
class UserPreferences {
//static const myUser= User();
  static late SharedPreferences _preferences;

  static const _keyUser = 'user'; // store the information of the user.

  static const myathleteUser = AthleteUser(
      imagePath:
          'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
      name: "Athlete's name",
      college: 'College/University',
      sports: 'Sports',
      username: '@myusername',
      bio: "My Athlete's bio");

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setUser(AthleteUser user) async {
    final json = jsonEncode(user.toJson());
// key:_keyUser
//value:json

    await _preferences.setString(_keyUser, json); // setting the local shared preferences using keyuser and json
  }

// for loading method
  static AthleteUser getUser() {
    final jsons = _preferences.getString(_keyUser);
    // this is the error
    return jsons == null
        ? myathleteUser
        : AthleteUser.fromJson(jsonDecode(jsons));
  }
}
