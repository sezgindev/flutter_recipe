import 'package:denemeapp/Screens/CategoryScreen.dart';
import 'package:denemeapp/Screens/DetailScreen.dart';
import 'package:denemeapp/Screens/addRecipe.dart';
import 'package:denemeapp/Screens/home.dart';
import 'package:denemeapp/models/ReceipeModel.dart';
import 'package:denemeapp/scripts/FirabaseReceipeAdd.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Map<dynamic, dynamic> maplista;

class SearchScreen extends StatefulWidget {
  static const String id = "SearchScreen";

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  FirebaseQuery a = new FirebaseQuery();

  void initState() {
    super.initState();
  }

  Future<List<ReceipeModel>> search(String search) async {
    await Future.delayed(Duration(seconds: 2));
    return List.generate(1, (int index) {
      return ReceipeModel(
        "yemekName : ${a.searchRecipe(search)}",
        "tarif :${a.searchRecipe(search)}",
        "malzeme :${a.searchRecipe(search)}",
        "category :${a.searchRecipe(search)}",
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0B0C28),
      resizeToAvoidBottomPadding: false,
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 28.0),
              child: new TextField(
                controller: null,
                autofocus: false,
                style: new TextStyle(fontSize: 22.0, color: Color(0xFFbdc6cf)),
                decoration: new InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Search',
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.white),
                    borderRadius: new BorderRadius.circular(20.7),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: new BorderSide(color: Colors.white),
                    borderRadius: new BorderRadius.circular(25.7),
                  ),
                ),
                onChanged: (value) {
                  Provider.of<FirebaseQuery>(context, listen: false)
                      .searchRecipe(value);
                },
              ),
            ),
            FutureBuilder(
                // future: _fetchListItems(),
                builder: (context, AsyncSnapshot snapshot) {
              if (maplista == null) {
                return Center(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 200.0),
                  child: CircularProgressIndicator(),
                ));
              } else {
                return Container(
                  width: 320,
                  height: 530,
                  child: new ListView.builder(
                    itemCount: maplista.length,
                    itemBuilder: (BuildContext context, int index) {
                      String key = maplista.keys.elementAt(index);
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
                                  padding: const EdgeInsets.only(
                                      top: 5.0, left: 40.0),
                                  child: Image.asset(
                                    "images/cookico.PNG",
                                  ),
                                ),
                                title: new Text(
                                  "${maplista[key]["yemekName"]}",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF0B0C28),
                                    fontSize: 27.0,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                onTap: () {
                                  detailSearchkey(maplista.keys.first);
                                  print(maplista.keys.first);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailScreen(),
                                      // Pass the arguments as part of the RouteSettings. The
                                      // DetailScreen reads the arguments from these settings.
                                      settings: RouteSettings(
                                        arguments: maplista.keys.first,
                                      ),
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
                );
              }
            }),
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
