import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:oppknocksapp/screens/authenticate/reset_password.dart';
import 'package:oppknocksapp/screens/settings_&_id_page/athlete_profile/edit_athlete_profile.dart';
import 'package:oppknocksapp/services/auth.dart';
import 'package:oppknocksapp/screens/settings_&_id_page/settingswidget/icon_widget.dart';
import 'package:oppknocksapp/shared/constants.dart';

class SettingsPage extends StatefulWidget {
  @override
  SettingsPageState createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
  final AuthService _auth = AuthService();
  static const keyLanguage = "key-language";
  static const keyLocation = "key-location";
  @override
  Widget build(BuildContext context) => Scaffold(
        //appBar: buildAppBar(context),
        body: SafeArea(
            child: ListView(
          padding: EdgeInsets.all(24),
          children: [
            SettingsGroup(
              title: "GENERAL",
              children: <Widget>[
                //AccountPage(),
                buildeditprofile(),
                //buildLanguage(),
                //buildLocation(),
                const SizedBox(height: 10),
                  buildresetpassword(),
                buildlogout(),
                //builddeleteAccount()
              
              ],
            ),

            /*SettingsGroup(
              title: "FEEDBACK",
              children: <Widget>[
                buildreportbug(),
                buildsendfeedback()
              ],
            ),
            */
          ],
        )),
      );

  Widget buildeditprofile() => SimpleSettingsTile(
      title: 'Edit Profile',
      subtitle: '',
      leading: IconWidget(icon: Icons.account_box, color: appColor1),
      // just reroute it later.
      //onTap:() =>Utils.showSnackBar(context,'Clicked Logout'),
      onTap: () async {
        await Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) =>
                  EditAthleteProfile()), // might move this later.
        );
        setState(() {});
      });

  Widget buildLanguage() => DropDownSettingsTile(
        title: "Language",
        settingKey: keyLanguage,
        selected: 1,
        values: <int, String>{
          1: 'English',
          //2:'Spanish'
        },
        onChange: (language) {/*NOOP*/},
      );

  Widget buildLocation() => TextInputSettingsTile(
        title: "Location",
        settingKey: keyLocation,
        initialValue: "USA",
        onChange: (location) {/*NOOP*/},
      );
  Widget buildlogout() => SimpleSettingsTile(
      title: 'Logout',
      subtitle: '',
      leading: IconWidget(icon: Icons.logout, color: Colors.red),
      // just reroute it later.
      //onTap:() =>Utils.showSnackBar(context,'Clicked Logout'),
      onTap: () async {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                  title: Text("Log Out"),
                  content: Text("Are you sure want to log out?"),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text("Cancel")),
                    ElevatedButton(
                        onPressed: () async {
                          Navigator.of(context).pop(await _auth.signOut());
                        },
                        child: Text("Log out")),
                  ]);
            });
      });

  Widget builddeleteAccount() => SimpleSettingsTile(
        title: 'Delete Account',
        subtitle: '',
        leading: IconWidget(icon: Icons.delete, color: Colors.pink),
      );

  Widget buildreportbug() => SimpleSettingsTile(
        title: "Report A Bug",
        subtitle: '',
        leading: IconWidget(icon: Icons.bug_report, color: appColor1),
      );
  Widget buildsendfeedback() => SimpleSettingsTile(
        title: "Send Feedback",
        subtitle: '',
        leading: IconWidget(icon: Icons.thumb_up, color: appColor1),
      );


      Widget buildresetpassword() => SimpleSettingsTile(
        title: "Reset Password",
        subtitle: '',
        leading: IconWidget(icon: Icons.lock, color: appColor1),
        onTap: () async {
        await Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) =>
                  ResetPassword()), // might move this later.
        );
        setState(() {});
      });
      
}
