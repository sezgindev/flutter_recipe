import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:denemeapp/scripts/FirabaseReceipeAdd.dart';
import 'package:denemeapp/Screens/addRecipe.dart';
import 'package:denemeapp/Screens/home.dart';
import 'package:denemeapp/Screens/register.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: Text("Login"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: "Enter your email",
                labelText: "Email",
                icon: Icon(Icons.email),
              ),
              onChanged: (value) {
                email = value;
              },
            ),
            TextFormField(
              obscureText: true,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: "Enter your password",
                labelText: "Password",
                icon: Icon(Icons.security),
              ),
              onChanged: (value) {
                password = value;
              },
            ),
            RaisedButton(
              onPressed: () async {
                setState(() {
                  showSpinner = true;
                });
                try {
                  final user = await _auth.signInWithEmailAndPassword(
                      email: email, password: password);
                  if (user != null) {
                    Navigator.pushNamed(context, AddRecipe.id);
                    print("giris basarili");
                  }

                  setState(() {
                    showSpinner = false;
                  });
                } catch (e) {
                  print(e);
                }
              },
              child: Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
