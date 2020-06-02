import 'package:denemeapp/Screens/CategoryScreen.dart';
import 'package:denemeapp/Screens/DetailScreen.dart';
import 'package:denemeapp/Screens/SearchScreen.dart';
import 'package:denemeapp/Screens/addRecipe.dart';
import 'package:denemeapp/Screens/home.dart';
import 'package:denemeapp/scripts/FirabaseReceipeAdd.dart';
import 'package:flutter/material.dart';

Map<dynamic, dynamic> maplist1;
Map<dynamic, dynamic> maplist2;

class SelectedCategoryScreen extends StatefulWidget {
  static const String id = 'selectedcategory';

  @override
  _SelectedCategoryScreenState createState() => _SelectedCategoryScreenState();
}

class _SelectedCategoryScreenState extends State<SelectedCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    final String CategoryName = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Color(0xFF0B0C28),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
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
            Container(
              width: 320,
              height: 600,
              child: new ListView.builder(
                itemCount: maplist1.length,
                itemBuilder: (BuildContext context, int index) {
                  String key = maplist1.keys.elementAt(index);
                  return new Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Container(
                          height: 90,
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
                              padding:
                                  const EdgeInsets.only(top: 5.0, left: 40.0),
                              child: Image.asset(
                                "images/cookico.PNG",
                              ),
                            ),
                            title: new Text(
                              "${maplist1[key]["yemekName"]}",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF0B0C28),
                                fontSize: 27.0,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            onTap: () {
                              detailSearchkey(maplist1.keys.elementAt(index));
                              print(maplist1.keys.elementAt(index));
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailScreen(),
                                  // Pass the arguments as part of the RouteSettings. The
                                  // DetailScreen reads the arguments from these settings.
                                  settings: RouteSettings(
                                      arguments:
                                          maplist1.keys.elementAt(index)),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
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
