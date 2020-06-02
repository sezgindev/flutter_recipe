import 'package:denemeapp/Screens/CategoryScreen.dart';
import 'package:denemeapp/Screens/addRecipe.dart';
import 'package:flutter/material.dart';

class DrawerOnly extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    return new Drawer(
        child: new ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),

            ListTile(
              title: Text('Ketagoriler'),
              onTap: () {
                // Update the state of the app.
                // ...
                Navigator.pushNamed(context,CategoryScreen.id);

              },
            ),
            ListTile(
              title: Text('Tarif Ekle'),
              onTap: () {
                // Update the state of the app.
                // ...
                Navigator.pushNamed(context,AddRecipe.id);
              },
            ),

            ListTile(
              title: Text("Tariflerim"),
              onTap: (){
               // signInWithGoogle();
                //Navigator.pop(context);
              },

            )
          ],
        )
    );
  }
}