import 'package:denemeapp/Screens/CategoryScreen.dart';
import 'package:denemeapp/Screens/SearchScreen.dart';
import 'package:denemeapp/Screens/addRecipe.dart';
import 'package:denemeapp/Screens/home.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';


final dbRef = FirebaseDatabase.instance.reference();
Map<dynamic, dynamic> map;
Map<dynamic, dynamic> map2;

class DetailScreen extends StatefulWidget {
  static const id = "DetailScreen";

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    final String searchKey = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      backgroundColor: Color(0xFF0B0C28),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 100.0, right: 50),
              child: Container(
                  color: Color(0xFFECECEC),
                  width: 300,
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      map2["yemekName"],
                      style: TextStyle(fontSize: 25),
                      textAlign: TextAlign.center,
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50.0, left: 40),
              child: Container(
                  width: 300,
                  height: 200,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 10.0,
                        // has the effect of softening the shadow
                        spreadRadius: 2.0,
                        // has the effect of extending the shadow
                        offset: Offset(
                          5.0, // horizontal, move right 10
                          5.0, // vertical, move down 10
                        ),
                      )
                    ],
                    color: Color(0xFFECECEC),
                    border: Border.all(
                      color: Color(0xFFECECEC),
                      width: 10,
                    ),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Text(map2["malzeme"])),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50.0, left: 40),
              child: Container(
                  width: 300,
                  height: 200,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 10.0,
                        // has the effect of softening the shadow
                        spreadRadius: 2.0,
                        // has the effect of extending the shadow
                        offset: Offset(
                          5.0, // horizontal, move right 10
                          5.0, // vertical, move down 10
                        ),
                      )
                    ],
                    color: Color(0xFFECECEC),
                    border: Border.all(
                      color: Color(0xFFECECEC),
                      width: 10,
                    ),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Text(map2["tarif"])),
            ),
          ],
        ),
      ),
      persistentFooterButtons: <Widget>[
        Container(
          height: 60,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.white,
                blurRadius: 0.0, // has the effect of softening the shadow
                spreadRadius: 0.0, // has the effect of extending the shadow
                offset: Offset(
                  0.0, // horizontal, move right 10
                  20.0, // vertical, move down 10
                ),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, HomeScreen.id);
                },
                child: Container(
                  width: 60,
                  height: 60,
                  child: Icon(
                    Icons.home,
                    size: 40,
                    color: Colors.white,
                  ),
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 45.0, right: 30.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, CategoryScreen.id);
                  },
                  child: Container(
                    width: 60,
                    height: 60,
                    child: Icon(
                      Icons.format_align_center,
                      size: 35,
                      color: Colors.white,
                    ),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.blue),
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 25.0, right: 45.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, SearchScreen.id);
                    },
                    child: Container(
                      width: 60,
                      height: 60,
                      child: Icon(
                        Icons.search,
                        size: 45,
                        color: Colors.white,
                      ),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.blue),
                    ),
                  )),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, AddRecipe.id);
                },
                child: Container(
                  width: 60,
                  height: 60,
                  child: Icon(
                    Icons.add,
                    size: 45,
                    color: Colors.white,
                  ),
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
