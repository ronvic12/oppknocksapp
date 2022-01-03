import 'package:flutter/material.dart';
import 'package:oppknocksapp/models/okuser.dart';
import 'package:oppknocksapp/screens/authenticate/authenticate.dart';
import 'package:oppknocksapp/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<OKUser?>(context);
    // return either Home or Authenticate widget

    // We'll have to create if statements or switch statements
    // to seperate the home screens
    if (user == null) {
      return Authenticate();
    } else {
      return Home(); //right now this is just going to the athlete home screen

    }
  }
}

/*
class _LoginScreenState extends State<LoginScreen> {
  var email;
  var password;
  var username;
  var gender;
  var userType;
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final firestoreInstance = Firestore.instance;
      void login() async {
        final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
        firebaseAuth
            .signInWithEmailAndPassword(
                email: emailController.text, password: passwordController.text)
            .then((result) {
          {
            Navigator.pushReplacementNamed(context, '/homepage');
          }
        }).catchError((err) {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Error"),
                  content: Text(err.message),
                  actions: [
                    FlatButton(
                      child: Text("Ok"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                );
              });
        });
      }
      void getUserData() async {
        try {
          firestoreInstance
              .collection('Users')
              .document(usernameController.text)
              .get()
              .then((value) {
            setState(() {
              email = (value.data)['email'];
              password = (value.data)['password'];
              gender = (value.data)['gender'];
              username = (value.data)['username'];
              userType = (value.data)['userType'];
            });
          });
        } catch (e) {
          print(e.toString);
        }
      }*/