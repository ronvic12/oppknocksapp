import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:oppknocksapp/services/auth.dart';
import 'package:oppknocksapp/shared/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({ Key? key }) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  
  // text field state
  String email = '';
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
                      height: isKeyboard ? 
                          100 //height position of email/password input
                          : MediaQuery.of(context).size.height / 2.3), // box to keep logo shown
                  Text("Reset Password",
                      style: TextStyle(color: Colors.black, fontSize: 32)),
                  SizedBox(height: 20.0),  
                  TextFormField(
                      decoration:
                          textInputDecoration.copyWith(hintText: 'Email'),
                      validator: (val) =>
                          val!.isEmpty ? 'Enter an email' : null,
                      onChanged: (val) {
                        setState(() => email = val);
                      }),
                  SizedBox(height: 20.0), // box to keep room with password form
                  Container(
                      height: 50.0,
                      child: ElevatedButton(
                          child: Container(
                            constraints: BoxConstraints(
                                maxWidth: 200.0, minHeight: 50.0),
                            alignment: Alignment.center,
                            child: Text(
                              "Reset",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              dynamic result = await _auth
                                  .resetPassword(email);
                              if (result == null) {
                                setState(() => error =
                                    'Error: Could not send reset email. Please try again.');
                              } else {
                                Navigator.of(context).pop();
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) => AlertDialog(
                                      content: Text('A password reset email has been sent',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(color: Colors.black, fontSize: 20)),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () => Navigator.pop(context),
                                          child: const Text('Ok'),
                                          style: TextButton.styleFrom(textStyle: TextStyle(fontSize: 16))
                                          
                                        ),
                                      ],
                                      
                                    ),
                                  );
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

                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}