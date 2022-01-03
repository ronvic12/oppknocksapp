import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:oppknocksapp/models/okuser.dart';
import 'package:oppknocksapp/services/auth.dart';
import 'package:oppknocksapp/utils/business_preferences.dart';
import 'package:oppknocksapp/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:oppknocksapp/utils/user_preferences.dart';

void main() async {
  // this is for settings, again, i think we want this in firebase? this is it for now.
  await Settings.init(cacheProvider: SharePreferenceCache());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await UserPreferences
      .init(); // this is for the athlete profile update user data.
  await BusinessUserPreferences.init(); // for busines profile
  runApp(OppKnocksApp());
}

class OppKnocksApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<OKUser?>.value(
      initialData: null,
      value: AuthService().user,
      child: MaterialApp(
        //when debugging, comment out the line below
        //debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}
