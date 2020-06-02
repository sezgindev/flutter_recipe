import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:denemeapp/Screens/login.dart';


class RegisterScreen extends StatefulWidget{
  static const String id = 'register_screen';
  @override
  _RegisterScreenState createState() => _RegisterScreenState();

}
class _RegisterScreenState extends State <RegisterScreen>{

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
        title: Text("Register"),
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
                email=value;
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
                password=value;
              },

            ),
            RaisedButton(
              onPressed: () async{
                setState(() {
                  showSpinner=true;
                });
                try {
                  final newUser = await _auth.createUserWithEmailAndPassword(
                      email: email, password: password);
                  if (newUser != null) {
                    //  Navigator.pushNamed(context, LoginScreen.id);

                  }

                  setState(() {
                    showSpinner = false;
                  });
                } catch (e) {
                  print(e);
                }
              },
              child: Text("Save"),
            ),
            Padding(
              padding: const EdgeInsets.only(top:10.0),
              child: GestureDetector(
                  child: Text("If you have an account click here", textAlign: TextAlign.center, style: TextStyle(decoration: TextDecoration.underline, color: Colors.blueAccent,fontSize: 18)),
                  onTap: () {
                    Navigator.pushNamed(context,LoginScreen.id);
                    // do what you need to do when "Click here" gets clicked
                  }
              ),
            )

          ],
        ),
      ),
    );
  }
}