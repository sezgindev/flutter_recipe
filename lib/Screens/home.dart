import 'package:denemeapp/Screens/CategoryScreen.dart';
import 'package:denemeapp/Screens/DetailScreen.dart';
import 'package:denemeapp/Screens/addRecipe.dart';
import 'package:denemeapp/scripts/FirabaseReceipeAdd.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_skeleton/flutter_skeleton.dart';
import '../models/ReceipeModel.dart';
import 'SearchScreen.dart';

class HomeScreen extends StatefulWidget {
  static const id = "HomePage";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final databaseReference2 = FirebaseDatabase.instance.reference();
  List<ReceipeModel> recips = List();
  ReceipeModel recip;
  DatabaseReference recipRef;

  @override
  void initState() {
    super.initState();
    recip = ReceipeModel("", "", "", "");
    final FirebaseDatabase database = FirebaseDatabase
        .instance; //Rather then just writing FirebaseDatabase(), get the instance.
    recipRef = database.reference().child("yemekler");
    recipRef.onChildAdded.listen(_onEntryAdded);
    recipRef.onChildChanged.listen(_onEntryChanged);
  }

  _onEntryAdded(Event event) {
    setState(() {
      recips.add(ReceipeModel.fromSnapshot(event.snapshot));
    });
  }

  _onEntryChanged(Event event) {
    var old = recips.singleWhere((entry) {
      return entry.key == event.snapshot.key;
    });
    setState(() {
      recips[recips.indexOf(old)] = ReceipeModel.fromSnapshot(event.snapshot);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0B0C28),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/background-image.jpg"),
                fit: BoxFit.cover,
              ),
              border: Border.all(
                color: Color(0xFFECECEC),
                width: 10,
              ),
              borderRadius: BorderRadius.circular(18),
            ),
            width: MediaQuery.of(context).size.width,
            height: 240,
          ),
          Expanded(
            child: Container(
              width: 370,
              child: FirebaseAnimatedList(
                duration: Duration(milliseconds: 150),
                defaultChild: onLoadSkeleton(),
                query: recipRef,
                itemBuilder: (BuildContext context, DataSnapshot snapshot,
                    Animation<double> animation, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Container(
                      //width: 400,
                      height: 100,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black54,
                            blurRadius: 5.0,
                            // has the effect of softening the shadow
                            spreadRadius: 0.0,
                            // has the effect of extending the shadow
                            offset: Offset(
                              4.0, // horizontal, move right 10
                              3.0, // vertical, move down 10
                            ),
                          )
                        ],
                        color: Color(0xFFECECEC),
                        border: Border.all(
                          color: Color(0xFFECECEC),
                          width: 10,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(50.0),
                        ),
                      ),
                      child: new ListTile(
                        leading: Padding(
                          padding: const EdgeInsets.only(top: 5.0, left: 40.0),
                          child: Image.asset(
                            "images/cookico.PNG",
                          ),
                        ),
                        title: Padding(
                          padding: const EdgeInsets.only(left: 20.0, top: 10.0),
                          child: Text(
                            recips[index].yemekName,
                            style: TextStyle(
                              color: Color(0xFF0B0C28),
                              fontSize: 25.0,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        onTap: () {
                          detailSearchkey(recips[index].key);
                          print(recips[index].key);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailScreen(),
                              // Pass the arguments as part of the RouteSettings. The
                              // DetailScreen reads the arguments from these settings.
                              settings: RouteSettings(
                                arguments: recips[index].key,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
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
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.blue),
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
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

onLoadSkeleton() {
  return Padding(
    padding: const EdgeInsets.only(top: 8.0),
    child: Container(
      child: ListView(
        children: <Widget>[
          Container(
            // width: 100,
            height: 100,
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
            child: new ListTile(
              leading: Padding(
                padding: const EdgeInsets.only(top: 5.0, left: 40.0),
                child: Image.asset(
                  "images/skeletonImage.png",
                ),
              ),
              title: Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 10.0),
                child: Image.asset(
                  "images/skeletonText.png",
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 28.0),
            child: Container(
              // width: 100,
              height: 100,
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
              child: new ListTile(
                leading: Padding(
                  padding: const EdgeInsets.only(top: 5.0, left: 40.0),
                  child: Image.asset(
                    "images/skeletonImage.png",
                  ),
                ),
                title: Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 10.0),
                  child: Image.asset(
                    "images/skeletonText.png",
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 28.0),
            child: Container(
              // width: 100,
              height: 100,
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
              child: new ListTile(
                leading: Padding(
                  padding: const EdgeInsets.only(top: 5.0, left: 40.0),
                  child: Image.asset(
                    "images/skeletonImage.png",
                  ),
                ),
                title: Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 10.0),
                  child: Image.asset(
                    "images/skeletonText.png",
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
