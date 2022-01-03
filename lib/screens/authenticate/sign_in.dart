import 'package:flutter/material.dart';
import 'package:oppknocksapp/screens/authenticate/reset_password.dart';
import 'package:oppknocksapp/services/auth.dart';
import 'package:oppknocksapp/shared/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  // text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    return Stack(
      children: <Widget>[
        Image.asset(
          'assets/images/loginpagebg2.png',
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.fill,
        ),
        Scaffold(
          backgroundColor: isKeyboard ? Colors.white : Colors.transparent,
          resizeToAvoidBottomInset: false,
          body: Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  SizedBox(
                      height: isKeyboard
                          ? 100 //height position of email/password input
                          : MediaQuery.of(context).size.height /
                              2.3), // box to keep logo shown
                  TextFormField(
                      decoration:
                          textInputDecoration.copyWith(hintText: 'Email'),
                      validator: (val) =>
                          val!.isEmpty ? 'Enter an email' : null,
                      onChanged: (val) {
                        setState(() => email = val);
                      }),
                  SizedBox(height: 20.0), // box to keep room with password form
                  TextFormField(
                    decoration:
                        textInputDecoration.copyWith(hintText: 'Password'),
                    obscureText: true,
                    validator: (val) => val!.length < 6
                        ? 'Enter a password 6+ chars long'
                        : null,
                    onChanged: (val) {
                      setState(() => password = val);
                    },
                  ),
                  SizedBox(height: 35.0),
                  Container(
                      height: 50.0,
                      child: ElevatedButton(
                          child: Container(
                            constraints: BoxConstraints(
                                maxWidth: 200.0, minHeight: 50.0),
                            alignment: Alignment.center,
                            child: Text(
                              "Login",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              dynamic result = await _auth
                                  .signInWithEmailAndPassword(email, password);
                              if (result == null) {
                                setState(() => error =
                                    'Could not sign in with those credentials');
                              }
                            }
                          },
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(appColor1),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ))))),
                  SizedBox(height: 8.0),
                  Text(
                    error,
                    style: TextStyle(color: Colors.red, fontSize: 14.0),
                  ),
                  InkWell(
                      child: Text('Forgot Password?',
                          style: TextStyle(
                            color: Color(0xff85C0C0),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            decoration: TextDecoration.underline,
                          )),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ResetPassword()));
                      }),
                  Text("Don't have an account?",
                      style: TextStyle(color: Color(0xff58ACCD), fontSize: 16)),
                  SizedBox(height: 5.0),
                  InkWell(
                      child: Text('Apply Now',
                          style: TextStyle(
                            color: Color(0xff85C0C0),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            decoration: TextDecoration.underline,
                          )),
                      onTap: () =>
                          launch('https://forms.gle/eNBQaF8QWcWsCS1n7')),
                  SizedBox(height: 5.0),
                  

                  /*Link(
                      uri: Uri.parse(
                          'https://docs.google.com/forms/d/e/1FAIpQLSf_sZf90kzEudUAf0zwPYiNnZ666O8Y8Y-GjMWCWVy8CXWiNQ/viewform?usp=pp_url'),
                      target: LinkTarget.defaultTarget,
                      builder: (context, followLink) {
                        return ElevatedButton(
                          onPressed: followLink,
                          child: Text('Submit Application'),
                        );
                      })*/
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
