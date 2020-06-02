import 'package:denemeapp/Screens/DetailScreen.dart';

import 'package:denemeapp/Screens/SearchScreen.dart';
import 'package:denemeapp/Screens/SelectedCategoryScreen.dart';
import 'package:denemeapp/Screens/UserAddedReceipe.dart';
import 'package:denemeapp/scripts/FirabaseReceipeAdd.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:denemeapp/Screens/addRecipe.dart';
import 'package:denemeapp/Screens/home.dart';
import 'package:denemeapp/Screens/register.dart';
import 'package:provider/provider.dart';
import 'Screens/login.dart';
import 'package:denemeapp/Screens/CategoryScreen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) =>FirebaseQuery()),
      ],
      child:MyApp(),
    ),


  );
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}
class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      initialRoute: HomeScreen.id, //ilk açılacak ekran
      routes: {
        RegisterScreen.id: (context) => RegisterScreen(),
        SelectedCategoryScreen.id: (context) => SelectedCategoryScreen(),
        SearchScreen.id: (context) => SearchScreen(),
        UserAddedReceipe.id: (context) => UserAddedReceipe(),
        LoginScreen.id: (context) => LoginScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        AddRecipe.id: (context) => AddRecipe(),
        CategoryScreen.id: (context) => CategoryScreen(),
        DetailScreen.id: (context) => DetailScreen(),


      },
    );
  }
}
